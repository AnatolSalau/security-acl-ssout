CREATE TABLE IF NOT EXISTS DOCUMENT (
    id SERIAL not null,
    content varchar(255),
    primary key (id)
);

CREATE TABLE IF NOT EXISTS acl_sid (
  id SERIAL NOT NULL,
  principal int NOT NULL,
  sid varchar(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS acl_class (
  id SERIAL NOT NULL,
  class varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS acl_object_identity (
  id SERIAL NOT NULL,
  object_id_class bigint NOT NULL,
  object_id_identity bigint NOT NULL,
  parent_object bigint DEFAULT NULL,
  owner_sid bigint DEFAULT NULL,
  entries_inheriting int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS acl_entry (
                                         id SERIAL NOT NULL,
                                         acl_object_identity bigint NOT NULL,
                                         ace_order int NOT NULL,
                                         sid bigint NOT NULL,
                                         mask int NOT NULL,
                                         granting int NOT NULL,
                                         audit_success int NOT NULL,
                                         audit_failure int NOT NULL,
                                         PRIMARY KEY (id)
);


ALTER TABLE acl_entry
ADD FOREIGN KEY (acl_object_identity) REFERENCES acl_object_identity(id);

ALTER TABLE acl_entry
ADD FOREIGN KEY (sid) REFERENCES acl_sid(id);
 
--
-- Constraints for table acl_object_identity
--
ALTER TABLE acl_object_identity
ADD FOREIGN KEY (parent_object) REFERENCES acl_object_identity (id);

ALTER TABLE acl_object_identity
ADD FOREIGN KEY (object_id_class) REFERENCES acl_class (id);

ALTER TABLE acl_object_identity
ADD FOREIGN KEY (owner_sid) REFERENCES acl_sid (id);