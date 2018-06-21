-- This is free and unencumbered software released into the public domain.


-- Select all held locks 

select vs.USERNAME, vlo.SESSION_ID, dbao.OWNER, dbao.OBJECT_NAME, 
    dbao.OBJECT_TYPE, vs.OSUSER,
    decode(vl.BLOCK,
        0, 'Not Blocking',
        1, 'Blocking',
        2, 'Global') BLOCK,
    decode(vlo.LOCKED_MODE,
        0, 'None',
        1, 'Null',
        2, 'Row-S (SS)',
        3, 'Row-X (SX)',
        4, 'Share',
        5, 'S/Row-X (SSX)',
        6, 'Exclusive', 
        to_char(vl.LMODE)
    ) LOCKED_MODE
from V$LOCKED_OBJECT vlo, DBA_OBJECTS dbao, V$LOCK vl, V$SESSION vs
where vlo.OBJECT_ID = dbao.OBJECT_ID
and vlo.OBJECT_ID = vl.ID1
and vlo.SESSION_ID = vs.SID
order by 1, 2;
