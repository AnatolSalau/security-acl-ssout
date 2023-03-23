INSERT INTO document(id,content) VALUES
(nextval('document_id_seq'),'Document 1'),
(nextval('document_id_seq'),'Document 2'),
(nextval('document_id_seq'),'Document 3');


INSERT INTO acl_sid (id, principal, sid) VALUES
(nextval('acl_sid_id_seq'), 1, 'user1'),
(nextval('acl_sid_id_seq'), 1, 'user2'),
(nextval('acl_sid_id_seq'), 1, 'admin');

INSERT INTO acl_class (id, class) VALUES
(nextval('acl_class_id_seq'), 'ru.sysout.model.Document');


INSERT INTO acl_object_identity (id, object_id_class, object_id_identity, parent_object, owner_sid, entries_inheriting) VALUES
(nextval('acl_object_identity_id_seq'), 1, 1, NULL, 3, 0),
(nextval('acl_object_identity_id_seq'), 1, 2, NULL, 3, 0),
(nextval('acl_object_identity_id_seq'), 1, 3, NULL, 3, 0);

INSERT INTO acl_entry (id, acl_object_identity, ace_order, sid, mask, granting, audit_success, audit_failure) VALUES
(nextval('acl_entry_id_seq'), 1, 1, 1, 1, 1, 1, 1),
(nextval('acl_entry_id_seq'), 1, 2, 3, 1, 1, 1, 1),
(nextval('acl_entry_id_seq'), 1, 3, 3, 2, 1, 1, 1),
(nextval('acl_entry_id_seq'), 2, 1, 2, 1, 1, 1, 1),
(nextval('acl_entry_id_seq'), 2, 2, 3, 1, 1, 1, 1),
(nextval('acl_entry_id_seq'), 2, 3, 3, 2, 1, 1, 1),
(nextval('acl_entry_id_seq'), 3, 1, 3, 1, 1, 1, 1),
(nextval('acl_entry_id_seq'), 3, 2, 3, 2, 1, 1, 1);
