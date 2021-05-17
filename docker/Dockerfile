FROM postgrest/postgrest:latest

USER root

RUN set -ex
RUN sed -e 's/^deb /deb-src /' < /etc/apt/sources.list >> /etc/apt/sources.list;
RUN apt-get update
RUN apt-get install -qy libdbd-pg-perl postgresql-client
RUN apt-get build-dep -qy sqitch
RUN cpan App::Sqitch

ADD start.sh /start.sh
CMD /start.sh
