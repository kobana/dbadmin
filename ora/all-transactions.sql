-- This is free and unencumbered software released into the public domain.


-- Select all transactions

select t.START_TIME, s.SID, s.SERIAL#, s.USERNAME, s.STATUS, s.SCHEMANAME,
    s.OSUSER, s.PROCESS, s.MACHINE, s.TERMINAL, s.PROGRAM, s.MODULE,
    s.TYPE, to_char(s.LOGON_TIME,'DD/MON/YY HH24:MI:SS') LOGON_TIME
from V$TRANSACTION t, V$SESSION s
where s.SADDR = t.SES_ADDR
order by 1 asc;
