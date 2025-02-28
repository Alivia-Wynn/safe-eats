-- CREATE DATABASE safeeats;


USE safeeats;

-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS alternatives;
-- DROP TABLE IF EXISTS recalls;
-- DROP TABLE IF EXISTS assets;


CREATE TABLE users
(
    userid       int not null AUTO_INCREMENT,
    email        varchar(128) not null,
    lastname     varchar(64) not null,
    firstname    varchar(64) not null,
    alerts		 int not null default 0,
    bucketfolder varchar(48) not null,  -- random, unique name (UUID)
    PRIMARY KEY (userid),
    UNIQUE      (email),
    UNIQUE      (bucketfolder)
);


ALTER TABLE users AUTO_INCREMENT = 80001;  -- starting value


CREATE TABLE assets
(
    assetid      int not null AUTO_INCREMENT,
    userid       int not null,
    assetname    varchar(128) not null,  -- original name from user
    bucketkey    varchar(128) not null,  -- random, unique name in bucket
    PRIMARY KEY (assetid),
    FOREIGN KEY (userid) REFERENCES users(userid),
    UNIQUE      (bucketkey)
);
ALTER TABLE assets AUTO_INCREMENT = 1001;  -- starting value


CREATE TABLE alternatives
(
    altid        int not null AUTO_INCREMENT,
    userid       int not null,
    assetname    varchar(128) not null,  -- original name from user
    bucketkey    varchar(128) not null,  -- random, unique name in bucket
    PRIMARY KEY (altid),
    -- FOREIGN KEY (recallid) REFERENCES recalls(recallid),
    UNIQUE      (bucketkey)
);
ALTER TABLE alternatives AUTO_INCREMENT = 2001;  -- starting value


CREATE TABLE recalls
(
    recallid      int not null AUTO_INCREMENT,
    brandname    varchar(128) not null, 
    altid        int not null,
    PRIMARY KEY (recallid),
    -- FOREIGN KEY (altid) REFERENCES alternatives(altid)
    FOREIGN KEY (altid) REFERENCES alternatives(altid)
  --  UNIQUE      (bucketkey)
);
-- Error Code: 1072. Key column 'altid' doesn't exist in table

ALTER TABLE recalls AUTO_INCREMENT = 3001;  -- starting value


--
-- DONE
--
