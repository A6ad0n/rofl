-- Users
INSERT INTO users (user_id, user_name, password_hash, email) 
VALUES (1, 'admin', 'hashed_password', 'admin@example.com');

-- Schemas
INSERT INTO schemas (schema_id, schema_name, owner_id) 
VALUES (1, 'public', 1);

-- Data Types
INSERT INTO data_types (data_type_id, data_type_name, description) 
VALUES 
    (1, 'INTEGER', 'Integer type'),
    (2, 'VARCHAR(255)', 'Variable character type'),
    (3, 'TIMESTAMP', 'Timestamp type'),
    (4, 'BOOLEAN', 'Boolean type'),
    (5, 'TEXT', 'Text type'),
    (6, 'VARCHAR(10)', 'Short variable character type');

-- Constraint Types
INSERT INTO constraint_types (constraint_type_id, constraint_type_name) 
VALUES 
    (1, 'PRIMARY KEY'),
    (2, 'FOREIGN KEY'),
    (3, 'UNIQUE');

-- Roles
INSERT INTO roles (role_id, role_name, description) 
VALUES (1, 'admin', 'Administrator role');

-- Privileges
INSERT INTO privileges (privilege_id, privilege_name, privilege_type, description) 
VALUES 
    (1, 'SELECT', 'OBJECT', 'Read table data'),
    (2, 'INSERT', 'OBJECT', 'Insert table data'),
    (3, 'CREATE_TABLE', 'SYSTEM', 'Create new tables');

-- System Privileges
INSERT INTO system_privileges (system_privilege_id, privilege_id, description) 
VALUES (1, 3, 'Allows creating new tables');

-- Tables
INSERT INTO tables (table_id, schema_id, table_name, owner_id) 
VALUES 
    (1, 1, 'users', 1),
    (2, 1, 'schemas', 1),
    (3, 1, 'data_types', 1),
    (4, 1, 'tables', 1),
    (5, 1, 'columns', 1),
    (6, 1, 'constraint_types', 1),
    (7, 1, 'constraints', 1),
    (8, 1, 'constraint_columns', 1),
    (9, 1, 'constraint_referenced_columns', 1),
    (10, 1, 'roles', 1),
    (11, 1, 'privileges', 1),
    (12, 1, 'system_privileges', 1),
    (13, 1, 'user_roles', 1),
    (14, 1, 'role_privileges', 1),
    (15, 1, 'user_privileges', 1),
    (16, 1, 'user_sessions', 1);

    -- Columns
INSERT INTO columns (column_id, table_id, column_name, data_type_id, is_nullable, default_value, position) 
VALUES 
    -- users
    (1, 1, 'user_id', 1, FALSE, NULL, 1),
    (2, 1, 'user_name', 2, FALSE, NULL, 2),
    (3, 1, 'password_hash', 2, FALSE, NULL, 3),
    (4, 1, 'registration_time', 3, FALSE, 'CURRENT_TIMESTAMP', 4),
    (5, 1, 'email', 2, TRUE, NULL, 5),
    -- schemas
    (6, 2, 'schema_id', 1, FALSE, NULL, 1),
    (7, 2, 'schema_name', 2, FALSE, NULL, 2),
    (8, 2, 'owner_id', 1, FALSE, NULL, 3),
    -- data_types
    (9, 3, 'data_type_id', 1, FALSE, NULL, 1),
    (10, 3, 'data_type_name', 2, FALSE, NULL, 2),
    (11, 3, 'description', 5, TRUE, NULL, 3),
    -- tables
    (12, 4, 'table_id', 1, FALSE, NULL, 1),
    (13, 4, 'schema_id', 1, FALSE, NULL, 2),
    (14, 4, 'table_name', 2, FALSE, NULL, 3),
    (15, 4, 'owner_id', 1, FALSE, NULL, 4),
    (16, 4, 'created_at', 3, FALSE, 'CURRENT_TIMESTAMP', 5),
    -- columns
    (17, 5, 'column_id', 1, FALSE, NULL, 1),
    (18, 5, 'table_id', 1, FALSE, NULL, 2),
    (19, 5, 'column_name', 2, FALSE, NULL, 3),
    (20, 5, 'data_type_id', 1, FALSE, NULL, 4),
    (21, 5, 'is_nullable', 4, FALSE, 'FALSE', 5),
    (22, 5, 'default_value', 5, TRUE, NULL, 6),
    (23, 5, 'position', 1, FALSE, NULL, 7),
    -- constraint_types
    (24, 6, 'constraint_type_id', 1, FALSE, NULL, 1),
    (25, 6, 'constraint_type_name', 2, FALSE, NULL, 2),
    -- constraints
    (26, 7, 'constraint_id', 1, FALSE, NULL, 1),
    (27, 7, 'constraint_name', 2, FALSE, NULL, 2),
    (28, 7, 'constraint_type_id', 1, FALSE, NULL, 3),
    (29, 7, 'table_id', 1, FALSE, NULL, 4),
    (30, 7, 'referenced_table_id', 1, TRUE, NULL, 5),
    (31, 7, 'expression', 5, TRUE, NULL, 6),
    -- constraint_columns
    (32, 8, 'constraint_id', 1, FALSE, NULL, 1),
    (33, 8, 'column_id', 1, FALSE, NULL, 2),
    (34, 8, 'column_order', 1, FALSE, NULL, 3),
    -- constraint_referenced_columns
    (35, 9, 'constraint_id', 1, FALSE, NULL, 1),
    (36, 9, 'referenced_column_id', 1, FALSE, NULL, 2),
    (37, 9, 'column_order', 1, FALSE, NULL, 3),
    -- roles
    (38, 10, 'role_id', 1, FALSE, NULL, 1),
    (39, 10, 'role_name', 2, FALSE, NULL, 2),
    (40, 10, 'description', 5, TRUE, NULL, 3),
    -- privileges
    (41, 11, 'privilege_id', 1, FALSE, NULL, 1),
    (42, 11, 'privilege_name', 2, FALSE, NULL, 2),
    (43, 11, 'privilege_type', 6, FALSE, NULL, 3),
    (44, 11, 'description', 5, TRUE, NULL, 4),
    -- system_privileges
    (45, 12, 'system_privilege_id', 1, FALSE, NULL, 1),
    (46, 12, 'privilege_id', 1, FALSE, NULL, 2),
    (47, 12, 'description', 5, TRUE, NULL, 3),
    -- user_roles
    (48, 13, 'user_id', 1, FALSE, NULL, 1),
    (49, 13, 'role_id', 1, FALSE, NULL, 2),
    -- role_privileges
    (50, 14, 'role_id', 1, FALSE, NULL, 1),
    (51, 14, 'privilege_id', 1, FALSE, NULL, 2),
    (52, 14, 'table_id', 1, TRUE, NULL, 3),
    -- user_privileges
    (53, 15, 'user_id', 1, FALSE, NULL, 1),
    (54, 15, 'privilege_id', 1, FALSE, NULL, 2),
    (55, 15, 'table_id', 1, TRUE, NULL, 3),
    -- user_sessions
    (56, 16, 'session_id', 1, FALSE, NULL, 1),
    (57, 16, 'user_id', 1, FALSE, NULL, 2),
    (58, 16, 'login_time', 3, FALSE, NULL, 3),
    (59, 16, 'logout_time', 3, TRUE, NULL, 4),
    (60, 16, 'session_token', 2, TRUE, NULL, 5);

    -- Constraints
INSERT INTO constraints (constraint_id, constraint_name, constraint_type_id, table_id, referenced_table_id, expression) 
VALUES 
    -- users PK
    (1, 'users_pk', 1, 1, NULL, NULL),
    -- schemas PK
    (2, 'schemas_pk', 1, 2, NULL, NULL),
    -- schemas FK
    (3, 'schemas_owner_fk', 2, 2, 1, NULL),
    -- data_types PK
    (4, 'data_types_pk', 1, 3, NULL, NULL),
    -- tables PK
    (5, 'tables_pk', 1, 4, NULL, NULL),
    -- tables FKs
    (6, 'tables_schema_fk', 2, 4, 2, NULL),
    (7, 'tables_owner_fk', 2, 4, 1, NULL),
    -- columns PK
    (8, 'columns_pk', 1, 5, NULL, NULL),
    -- columns FKs
    (9, 'columns_table_fk', 2, 5, 4, NULL),
    (10, 'columns_data_type_fk', 2, 5, 3, NULL),
    -- constraint_types PK
    (11, 'constraint_types_pk', 1, 6, NULL, NULL),
    -- constraints PK
    (12, 'constraints_pk', 1, 7, NULL, NULL),
    -- constraints FKs
    (13, 'constraints_type_fk', 2, 7, 6, NULL),
    (14, 'constraints_table_fk', 2, 7, 4, NULL),
    (15, 'constraints_ref_table_fk', 2, 7, 4, NULL),
    -- constraint_columns PK
    (16, 'constraint_columns_pk', 1, 8, NULL, NULL),
    -- constraint_columns FKs
    (17, 'constraint_columns_constraint_fk', 2, 8, 7, NULL),
    (18, 'constraint_columns_column_fk', 2, 8, 5, NULL),
    -- constraint_referenced_columns PK
    (19, 'constraint_referenced_columns_pk', 1, 9, NULL, NULL),
    -- constraint_referenced_columns FKs
    (20, 'constraint_referenced_columns_constraint_fk', 2, 9, 7, NULL),
    (21, 'constraint_referenced_columns_column_fk', 2, 9, 5, NULL),
    -- roles PK
    (22, 'roles_pk', 1, 10, NULL, NULL),
    -- privileges PK
    (23, 'privileges_pk', 1, 11, NULL, NULL),
    -- system_privileges PK
    (24, 'system_privileges_pk', 1, 12, NULL, NULL),
    -- system_privileges FK
    (25, 'system_privileges_privilege_fk', 2, 12, 11, NULL),
    -- user_roles PK
    (26, 'user_roles_pk', 1, 13, NULL, NULL),
    -- user_roles FKs
    (27, 'user_roles_user_fk', 2, 13, 1, NULL),
    (28, 'user_roles_role_fk', 2, 13, 10, NULL),
    -- role_privileges PK
    (29, 'role_privileges_pk', 1, 14, NULL, NULL),
    -- role_privileges FKs
    (30, 'role_privileges_role_fk', 2, 14, 10, NULL),
    (31, 'role_privileges_privilege_fk', 2, 14, 11, NULL),
    (32, 'role_privileges_table_fk', 2, 14, 4, NULL),
    -- user_privileges PK
    (33, 'user_privileges_pk', 1, 15, NULL, NULL),
    -- user_privileges FKs
    (34, 'user_privileges_user_fk', 2, 15, 1, NULL),
    (35, 'user_privileges_privilege_fk', 2, 15, 11, NULL),
    (36, 'user_privileges_table_fk', 2, 15, 4, NULL),
    -- user_sessions PK
    (37, 'user_sessions_pk', 1, 16, NULL, NULL),
    -- user_sessions FK
    (38, 'user_sessions_user_fk', 2, 16, 1, NULL);

    -- Constraint Columns
INSERT INTO constraint_columns (constraint_id, column_id, column_order) 
VALUES 
    (1, 1, 1), -- users_pk
    (2, 6, 1), -- schemas_pk
    (3, 8, 1), -- schemas_owner_fk
    (4, 9, 1), -- data_types_pk
    (5, 12, 1), -- tables_pk
    (6, 13, 1), -- tables_schema_fk
    (7, 15, 1), -- tables_owner_fk
    (8, 17, 1), -- columns_pk
    (9, 18, 1), -- columns_table_fk
    (10, 20, 1), -- columns_data_type_fk
    (11, 24, 1), -- constraint_types_pk
    (12, 26, 1), -- constraints_pk
    (13, 28, 1), -- constraints_type_fk
    (14, 29, 1), -- constraints_table_fk
    (15, 30, 1), -- constraints_ref_table_fk
    (16, 32, 1), -- constraint_columns_pk
    (16, 33, 2),
    (17, 32, 1), -- constraint_columns_constraint_fk
    (18, 33, 1), -- constraint_columns_column_fk
    (19, 35, 1), -- constraint_referenced_columns_pk
    (19, 36, 2),
    (20, 35, 1), -- constraint_referenced_columns_constraint_fk
    (21, 36, 1), -- constraint_referenced_columns_column_fk
    (22, 38, 1), -- roles_pk
    (23, 41, 1), -- privileges_pk
    (24, 45, 1), -- system_privileges_pk
    (25, 46, 1), -- system_privileges_privilege_fk
    (26, 48, 1), -- user_roles_pk
    (26, 49, 2),
    (27, 48, 1), -- user_roles_user_fk
    (28, 49, 1), -- user_roles_role_fk
    (29, 50, 1), -- role_privileges_pk
    (29, 51, 2),
    (30, 50, 1), -- role_privileges_role_fk
    (31, 51, 1), -- role_privileges_privilege_fk
    (32, 52, 1), -- role_privileges_table_fk
    (33, 53, 1), -- user_privileges_pk
    (33, 54, 2),
    (34, 53, 1), -- user_privileges_user_fk
    (35, 54, 1), -- user_privileges_privilege_fk
    (36, 55, 1), -- user_privileges_table_fk
    (37, 56, 1), -- user_sessions_pk
    (38, 57, 1); -- user_sessions_user_fk

-- User Roles
INSERT INTO user_roles (user_id, role_id) 
VALUES (1, 1);

-- Role Privileges
INSERT INTO role_privileges (role_id, privilege_id, table_id) 
VALUES 
    (1, 1, 1), -- SELECT on users
    (1, 2, 1); -- INSERT on users

-- User Sessions
INSERT INTO user_sessions (session_id, user_id, login_time, session_token) 
VALUES (1, 1, CURRENT_TIMESTAMP, 'abc123token');

INSERT INTO constraint_referenced_columns (constraint_id, referenced_column_id, column_order) 
VALUES 
    (3, 1, 1),   -- schemas_owner_fk -> users.user_id
    (6, 6, 1),   -- tables_schema_fk -> schemas.schema_id
    (7, 1, 1),   -- tables_owner_fk -> users.user_id
    (9, 12, 1),  -- columns_table_fk -> tables.table_id
    (10, 9, 1),  -- columns_data_type_fk -> data_types.data_type_id
    (13, 24, 1), -- constraints_type_fk -> constraint_types.constraint_type_id
    (14, 12, 1), -- constraints_table_fk -> tables.table_id
    (15, 12, 1), -- constraints_ref_table_fk -> tables.table_id
    (17, 26, 1), -- constraint_columns_constraint_fk -> constraints.constraint_id
    (18, 17, 1), -- constraint_columns_column_fk -> columns.column_id
    (20, 26, 1), -- constraint_referenced_columns_constraint_fk -> constraints.constraint_id
    (21, 17, 1), -- constraint_referenced_columns_column_fk -> columns.column_id
    (25, 41, 1), -- system_privileges_privilege_fk -> privileges.privilege_id
    (27, 1, 1),  -- user_roles_user_fk -> users.user_id
    (28, 38, 1), -- user_roles_role_fk -> roles.role_id
    (30, 38, 1), -- role_privileges_role_fk -> roles.role_id
    (31, 41, 1), -- role_privileges_privilege_fk -> privileges.privilege_id
    (32, 12, 1), -- role_privileges_table_fk -> tables.table_id
    (34, 1, 1),  -- user_privileges_user_fk -> users.user_id
    (35, 41, 1), -- user_privileges_privilege_fk -> privileges.privilege_id
    (36, 12, 1), -- user_privileges_table_fk -> tables.table_id
    (38, 1, 1);  -- user_sessions_user_fk -> users.user_id