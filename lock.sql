／*
  Author:      bisal
  Version:     1.0
  Description: Find blocking session and provide kill sql
*／

ACCEPT SQL_TEXT PROMPT 'SQL TEXT: '

exec print_table('select sid, event, username, sql.sql_text from v$session s, v$sql sql where s.sql_id=sql.sql_id and sid <> (select distinct sid from v$mystat) and sql.sql_text like ''%&SQL_TEXT%''');

exec print_table('select sid, blocking_session from v$session where sid=(select sid from v$session s, v$sql sql where s.sql_id=sql.sql_id and sid <> (select distinct sid from v$mystat) and sql.sql_text like ''%&SQL_TEXT%'')');

select 'alter system kill session '''||sid||','|| serial# ||''';' from v$session where sid=(select sid from v$session where sid=(select blocking_session from v$session s, v$sql sql where s.sql_id=sql.sql_id and sid <> (select distinct sid from v$mystat) and sql.sql_text like '%&SQL_TEXT%'));
