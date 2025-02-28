USE safeeats;


DROP USER IF EXISTS 'safeeats-read-only';
DROP USER IF EXISTS 'safeeats-read-write';


CREATE USER 'safeeats-read-only' IDENTIFIED BY 'sheate';
CREATE USER 'safeeats-read-write' IDENTIFIED BY '2002safeats';


GRANT SELECT, SHOW VIEW ON safeeats.* 
      TO 'safeeats-read-only';
GRANT SELECT, SHOW VIEW, INSERT, UPDATE, DELETE, DROP, CREATE, ALTER ON safeeats.* 
      TO 'safeeats-read-write';
      
FLUSH PRIVILEGES;
