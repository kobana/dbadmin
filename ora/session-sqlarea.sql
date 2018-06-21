-- This is free and unencumbered software released into the public domain.


-- Select all session and their respective network statistics

select sess.SID, sess.SERIAL#, sess.USERNAME, sess.MACHINE, sess.PROGRAM, 
    sess.EVENT, sess.SQL_ID, sess.SQL_CHILD_NUMBER, area.OPTIMIZER_MODE, 
    area.HASH_VALUE, area.ADDRESS, area.EXECUTIONS, area.PLSQL_EXEC_TIME, 
    area.CPU_TIME, area.ELAPSED_TIME, area.APPLICATION_WAIT_TIME, 
    area.CONCURRENCY_WAIT_TIME, area.CLUSTER_WAIT_TIME, area.USER_IO_WAIT_TIME, 
    area.SHARABLE_MEM, area.PERSISTENT_MEM, area.RUNTIME_MEM, 
    area.PHYSICAL_READ_BYTES, area.PHYSICAL_WRITE_BYTES, area.LOCKED_TOTAL,
    area.SQL_FULLTEXT
from V$SESSION sess, V$SQLAREA area
where sess.SQL_HASH_VALUE = area.HASH_VALUE
    and sess.SQL_ADDRESS = area.ADDRESS
    and sess.USERNAME is not null;