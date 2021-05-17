#!/bin/sh

set -e

PGRST_DB_URI="${PGRST_DB_URI:-pg://}"

do_sqitch() {
  sqitch status "db:${PGRST_DB_URI}" || true
  sqitch ${SQITCH_DEPLOY:-deploy} "db:${PGRST_DB_URI}"
  if [ "${SQITCH_VERIFY}" ]; then
    sqitch ${SQITCH_VERIFY} "db:${PGRST_DB_URI}"
  fi
}

mkdir -p ~/.sqitch
cat > ~/.sqitch/sqitch.conf <<EOF
[core]
  engine = pg
EOF

SQITCH_DIR=/sqitch
SQITCH_PLAN=$SQITCH_DIR/sqitch.plan

if [ -e $SQITCH_PLAN ]; then
  if ! (cd $SQITCH_DIR && do_sqitch); then
    RC=$?
    echo "ERROR: Sqitch returned $RC" 1>&2
    exit $RC
  fi
else
  echo "ERROR: Missing $SQITCH_PLAN" 1>&2
  exit 1
fi

# Add support for PGRST_QUIET
export PGRST_QUIET=${PGRST_QUIET:-false}
if ! grep -q ^quiet /etc/postgrest.conf; then
  echo 'quiet = "$(PGRST_QUIET)"' >> /etc/postgrest.conf
fi

exec postgrest /etc/postgrest.conf $PGRST_ARGS
