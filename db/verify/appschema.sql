-- Verify lab-postgrest-sqitch:appschema on pg

DO $$
BEGIN

  ASSERT ( SELECT has_schema_privilege( 'public', 'usage' ));

END $$;
