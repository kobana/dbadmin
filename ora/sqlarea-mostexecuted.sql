-- This is free and unencumbered software released into the public domain.


-- Select all the most executed SQLs

select to_char(LAST_ACTIVE_TIME,'YYYY.MM.DD HH24:MI:SS') LAST_ACTIVE_TIME,
    EXECUTIONS, FETCHES, ROWS_PROCESSED, ELAPSED_TIME/1000000 ELAPSED_TIME_SEC,
    PARSING_SCHEMA_NAME, SQL_FULLTEXT
from V$SQLAREA
where EXECUTIONS > 0
order by 2 desc;
