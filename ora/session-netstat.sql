-- This is free and unencumbered software released into the public domain.


-- Select all the sessions and their respective network statistics

select *
from (
    select to_char(se.LOGON_TIME,'YYYY.MM.DD HH24:MI:SS') LOGON_TIME,
        se.SID, se.SERIAL#, se.USERNAME, se.STATUS, se.SCHEMANAME, se.OSUSER,
        se.PROCESS, se.MACHINE, se.TERMINAL, se.PROGRAM, se.MODULE, se.TYPE,
        stna.DISPLAY_NAME, sest.VALUE
    from V$SESSION se, V$SESSTAT sest, V$STATNAME stna
    where se.SID=sest.SID
        and stna.STATISTIC#=sest.STATISTIC#
        and stna.DISPLAY_NAME like '%SQL*Net%'
) pivot (
    sum(VALUE)
    for DISPLAY_NAME in (
        'bytes sent via SQL*Net to client' BYTES_SENT,
        'bytes received via SQL*Net from client' BYTES_RECEIVED,
        'SQL*Net roundtrips to/from client' ROUNDTRIPS
    )
)
order by 1 asc;
