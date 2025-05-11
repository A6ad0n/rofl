-- 1. Insert into users
INSERT INTO users (user_id, user_name, password_hash, registration_time, email)
VALUES (1, 'admin', 'hashed_password', CURRENT_TIMESTAMP, 'admin@example.com');

-- 2. Insert into schemas
INSERT INTO schemas (schema_id, schema_name, owner_id)
VALUES (1, 'public', 1);

-- 3. Insert into data_types
INSERT INTO data_types (data_type_id, data_type_name, description) VALUES
(1, 'INTEGER', '32-bit integer'),
(2, 'VARCHAR', 'Variable-length character string'),
(3, 'TIMESTAMP', 'Date and time with timezone'),
(4, 'TEXT', 'Unlimited-length text'),
(5, 'BOOLEAN', 'True/false value');

-- 4. Insert into tables
INSERT INTO tables (table_id, schema_id, table_name, owner_id, created_at) VALUES
(1, 1, 'users', 1, CURRENT_TIMESTAMP),
(2, 1, 'schemas', 1, CURRENT_TIMESTAMP),
(3, 1, 'data_types', 1, CURRENT_TIMESTAMP),
(4, 1, 'tables', 1, CURRENT_TIMESTAMP),
(5, 1, 'columns', 1, CURRENT_TIMESTAMP),
(6, 1, 'constraint_types', 1, CURRENT_TIMESTAMP),
(7, 1, 'constraints', 1, CURRENT_TIMESTAMP),
(8, 1, 'constraint_columns', 1, CURRENT_TIMESTAMP),
(9, 1, 'constraint_referenced_columns', 1, CURRENT_TIMESTAMP),
(10, 1, 'roles', 1, CURRENT_TIMESTAMP),
(11, 1, 'privilege_types', 1, CURRENT_TIMESTAMP),
(12, 1, 'privileges', 1, CURRENT_TIMESTAMP),
(13, 1, 'system_privileges', 1, CURRENT_TIMESTAMP),
(14, 1, 'user_roles', 1, CURRENT_TIMESTAMP),
(15, 1, 'role_privileges', 1, CURRENT_TIMESTAMP),
(16, 1, 'user_privileges', 1, CURRENT_TIMESTAMP),
(17, 1, 'user_sessions', 1, CURRENT_TIMESTAMP);

-- 5. Insert into columns
INSERT INTO columns (column_id, table_id, column_name, data_type_id, is_nullable, default_value, position) VALUES
-- users (table_id = 1)
(1, 1, 'user_id', 1, FALSE, NULL, 1),
(2, 1, 'user_name', 2, FALSE, NULL, 2),
(3, 1, 'password_hash', 2, FALSE, NULL, 3),
(4, 1, 'registration_time', 3, FALSE, 'CURRENT_TIMESTAMP', 4),
(5, 1, 'email', 2, TRUE, NULL, 5),
-- schemas (table_id = 2)
(6, 2, 'schema_id', 1, FALSE, NULL, 1),
(7, 2, 'schema_name', 2, FALSE, NULL, 2),
(8, 2, 'owner_id', 1, FALSE, NULL, 3),
-- data_types (table_id = 3)
(9, 3, 'data_type_id', 1, FALSE, NULL, 1),
(10, 3, 'data_type_name', 2, FALSE, NULL, 2),
(11, 3, 'description', 4, TRUE, NULL, 3),
-- tables (table_id = 4)
(12, 4, 'table_id', 1, FALSE, NULL, 1),
(13, 4, 'schema_id', 1, FALSE, NULL, 2),
(14, 4, 'table_name', 2, FALSE, NULL, 3),
(15, 4, 'owner_id', 1, FALSE, NULL, 4),
(16, 4, 'created_at', 3, FALSE, 'CURRENT_TIMESTAMP', 5),
-- columns (table_id = 5)
(17, 5, 'column_id', 1, FALSE, NULL, 1),
(18, 5, 'table_id', 1, FALSE, NULL, 2),
(19, 5, 'column_name', 2, FALSE, NULL, 3),
(20, 5, 'data_type_id', 1, FALSE, NULL, 4),
(21, 5, 'is_nullable', 5, FALSE, 'FALSE', 5),
(22, 5, 'default_value', 4, TRUE, NULL, 6),
(23, 5, 'position', 1, FALSE, NULL, 7),
-- constraint_types (table_id = 6)
(24, 6, 'constraint_type_id', 1, FALSE, NULL, 1),
(25, 6, 'constraint_type_name', 2, FALSE, NULL, 2),
-- constraints (table_id = 7)
(26, 7, 'constraint_id', 1, FALSE, NULL, 1),
(27, 7, 'constraint_name', 2, FALSE, NULL, 2),
(28, 7, 'constraint_type_id', 1, FALSE, NULL, 3),
(29, 7, 'table_id', 1, FALSE, NULL, 4),
(30, 7, 'referenced_table_id', 1, TRUE, NULL, 5),
(31, 7, 'expression', 4, TRUE, NULL, 6),
-- constraint_columns (table_id = 8)
(32, 8, 'constraint_id', 1, FALSE, NULL, 1),
(33, 8, 'column_id', 1, FALSE, NULL, 2),
(34, 8, 'column_order', 1, FALSE, NULL, 3),
-- constraint_referenced_columns (table_id = 9)
(35, 9, 'constraint_id', 1, FALSE, NULL, 1),
(36, 9, 'referenced_column_id', 1, FALSE, NULL, 2),
(37, 9, 'column_order', 1, FALSE, NULL, 3),
-- roles (table_id = 10)
(38, 10, 'role_id', 1, FALSE, NULL, 1),
(39, 10, 'role_name', 2, FALSE, NULL, 2),
(40, 10, 'description', 4, TRUE, NULL, 3),
-- privilege_types (table_id = 11)
(41, 11, 'privilege_type_id', 1, FALSE, NULL, 1),
(42, 11, 'privilege_type_name', 2, FALSE, NULL, 2),
(43, 11, 'description', 4, TRUE, NULL, 3),
-- privileges (table_id = 12)
(44, 12, 'privilege_id', 1, FALSE, NULL, 1),
(45, 12, 'privilege_name', 2, FALSE, NULL, 2),
(46, 12, 'privilege_type_id', 1, FALSE, NULL, 3),
(47, 12, 'description', 4, TRUE, NULL, 4),
-- system_privileges (table_id = 13)
(48, 13, 'system_privilege_id', 1, FALSE, NULL, 1),
(49, 13, 'privilege_id', 1, FALSE, NULL, 2),
(50, 13, 'description', 4, TRUE, NULL, 3),
-- user_roles (table_id = 14)
(51, 14, 'user_id', 1, FALSE, NULL, 1),
(52, 14, 'role_id', 1, FALSE, NULL, 2),
-- role_privileges (table_id = 15)
(53, 15, 'role_id', 1, FALSE, NULL, 1),
(54, 15, 'privilege_id', 1, FALSE, NULL, 2),
(55, 15, 'table_id', 1, TRUE, NULL, 3),
-- user_privileges (table_id = 16)
(56, 16, 'user_id', 1, FALSE, NULL, 1),
(57, 16, 'privilege_id', 1, FALSE, NULL, 2),
(58, 16, 'table_id', 1, TRUE, NULL, 3),
-- user_sessions (table_id = 17)
(59, 17, 'session_id', 1, FALSE, NULL, 1),
(60, 17, 'user_id', 1, FALSE, NULL, 2),
(61, 17, 'login_time', 3, FALSE, NULL, 3),
(62, 17, 'logout_time', 3, TRUE, NULL, 4),
(63, 17, 'session_token', 2, TRUE, NULL, 5);

-- 6. Insert into constraint_types
INSERT INTO constraint_types (constraint_type_id, constraint_type_name) VALUES
(1, 'PRIMARY KEY'),
(2, 'UNIQUE'),
(3, 'CHECK'),
(4, 'FOREIGN KEY');

-- 7. Insert into constraints
INSERT INTO constraints (constraint_id, constraint_name, constraint_type_id, table_id, referenced_table_id, expression) VALUES
-- users constraints
(1, 'PK_users_user_id', 1, 1, NULL, NULL),
(2, 'UQ_users_user_name', 2, 1, NULL, NULL),
(3, 'UQ_users_email', 2, 1, NULL, NULL),
(4, 'CH_users_email', 3, 1, NULL, 'email ~* ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'''),
-- schemas constraints
(5, 'PK_schemas_schema_id', 1, 2, NULL, NULL),
(6, 'UQ_schemas_schema_name', 2, 2, NULL, NULL),
(7, 'CH_schemas_schema_name', 3, 2, NULL, 'schema_name <> '''''),
(8, 'FK_schemas_owner_id', 4, 2, 1, NULL),
-- data_types constraints
(9, 'PK_data_types_data_type_id', 1, 3, NULL, NULL),
(10, 'UQ_data_types_data_type_name', 2, 3, NULL, NULL),
(11, 'CH_data_types_data_type_name', 3, 3, NULL, 'data_type_name <> '''''),
-- tables constraints
(12, 'PK_tables_table_id', 1, 4, NULL, NULL),
(13, 'UQ_tables_table_name', 2, 4, NULL, NULL),
(14, 'CH_tables_table_name', 3, 4, NULL, 'table_name <> '''''),
(15, 'FK_tables_schema_id', 4, 4, 2, NULL),
(16, 'FK_tables_owner_id', 4, 4, 1, NULL),
-- columns constraints
(17, 'PK_columns_column_id', 1, 5, NULL, NULL),
(18, 'UQ_columns_table_id_column_name', 2, 5, NULL, NULL),
(19, 'UQ_columns_table_id_position', 2, 5, NULL, NULL),
(20, 'CH_columns_column_name', 3, 5, NULL, 'column_name <> '''''),
(21, 'CH_columns_position', 3, 5, NULL, 'position >= 1'),
(22, 'FK_columns_table_id', 4, 5, 4, NULL),
(23, 'FK_columns_data_type_id', 4, 5, 3, NULL),
-- constraint_types constraints
(24, 'PK_constraint_types_constraint_type_id', 1, 6, NULL, NULL),
(25, 'UQ_constraint_types_constraint_type_name', 2, 6, NULL, NULL),
(26, 'CH_constraint_types_constraint_type_name', 3, 6, NULL, 'constraint_type_name <> '''''),
-- constraints constraints
(27, 'PK_constraints_constraint_id', 1, 7, NULL, NULL),
(28, 'UQ_constraints_constraint_name', 2, 7, NULL, NULL),
(29, 'CH_constraints_constraint_name', 3, 7, NULL, 'constraint_name <> '''''),
(30, 'FK_constraints_constraint_type_id', 4, 7, 6, NULL),
(31, 'FK_constraints_table_id', 4, 7, 4, NULL),
(32, 'FK_constraints_referenced_table_id', 4, 7, 4, NULL),
-- constraint_columns constraints
(33, 'PK_constraint_columns_constraint_id_column_id', 1, 8, NULL, NULL),
(34, 'CH_constraint_columns_column_order', 3, 8, NULL, 'column_order >= 1'),
(35, 'FK_constraint_columns_constraint_id', 4, 8, 7, NULL),
(36, 'FK_constraint_columns_column_id', 4, 8, 5, NULL),
-- constraint_referenced_columns constraints
(37, 'PK_constraint_referenced_columns_constraint_id_referenced_column_id', 1, 9, NULL, NULL),
(38, 'CH_constraint_referenced_columns_column_order', 3, 9, NULL, 'column_order >= 1'),
(39, 'FK_constraint_referenced_columns_constraint_id', 4, 9, 7, NULL),
(40, 'FK_constraint_referenced_columns_referenced_column_id', 4, 9, 5, NULL),
-- roles constraints
(41, 'PK_roles_role_id', 1, 10, NULL, NULL),
(42, 'UQ_roles_role_name', 2, 10, NULL, NULL),
(43, 'CH_roles_role_name', 3, 10, NULL, 'role_name <> '''''),
-- privilege_types constraints
(44, 'PK_privilege_types_privilege_type_id', 1, 11, NULL, NULL),
(45, 'UQ_privilege_types_privilege_type_name', 2, 11, NULL, NULL),
(46, 'CH_privilege_types_privilege_type_name', 3, 11, NULL, 'privilege_type_name <> '''''),
-- privileges constraints
(47, 'PK_privileges_privilege_id', 1, 12, NULL, NULL),
(48, 'UQ_privileges_privilege_name', 2, 12, NULL, NULL),
(49, 'CH_privileges_privilege_name', 3, 12, NULL, 'privilege_name <> '''''),
(50, 'FK_privileges_privilege_type_id', 4, 12, 11, NULL),
-- system_privileges constraints
(51, 'PK_system_privileges_system_privilege_id', 1, 13, NULL, NULL),
(52, 'UQ_system_privileges_privilege_id', 2, 13, NULL, NULL),
(53, 'FK_system_privileges_privilege_id', 4, 13, 12, NULL),
-- user_roles constraints
(54, 'PK_user_roles_user_id_role_id', 1, 14, NULL, NULL),
(55, 'FK_user_roles_user_id', 4, 14, 1, NULL),
(56, 'FK_user_roles_role_id', 4, 14, 10, NULL),
-- role_privileges constraints
(57, 'PK_role_privileges_role_id_privilege_id', 1, 15, NULL, NULL),
(58, 'FK_role_privileges_role_id', 4, 15, 10, NULL),
(59, 'FK_role_privileges_privilege_id', 4, 15, 12, NULL),
(60, 'FK_role_privileges_table_id', 4, 15, 4, NULL),
-- user_privileges constraints
(61, 'PK_user_privileges_user_id_privilege_id', 1, 16, NULL, NULL),
(62, 'FK_user_privileges_user_id', 4, 16, 1, NULL),
(63, 'FK_user_privileges_privilege_id', 4, 16, 12, NULL),
(64, 'FK_user_privileges_table_id', 4, 16, 4, NULL),
-- user_sessions constraints
(65, 'PK_user_sessions_session_id', 1, 17, NULL, NULL),
(66, 'UQ_user_sessions_session_token', 2, 17, NULL, NULL),
(67, 'CH_user_sessions_logout_time', 3, 17, NULL, 'logout_time IS NULL OR logout_time > login_time'),
(68, 'CH_user_sessions_session_token', 3, 17, NULL, 'session_token IS NULL OR session_token <> '''''),
(69, 'FK_user_sessions_user_id', 4, 17, 1, NULL);

-- 8. Insert into constraint_columns
INSERT INTO constraint_columns (constraint_id, column_id, column_order) VALUES
-- users constraints
(1, 1, 1), -- PK_users_user_id: user_id
(2, 2, 1), -- UQ_users_user_name: user_name
(3, 5, 1), -- UQ_users_email: email
(4, 5, 1), -- CH_users_email: email
-- schemas constraints
(5, 6, 1), -- PK_schemas_schema_id: schema_id
(6, 7, 1), -- UQ_schemas_schema_name: schema_name
(7, 7, 1), -- CH_schemas_schema_name: schema_name
(8, 8, 1), -- FK_schemas_owner_id: owner_id
-- data_types constraints
(9, 9, 1), -- PK_data_types_data_type_id: data_type_id
(10, 10, 1), -- UQ_data_types_data_type_name: data_type_name
(11, 10, 1), -- CH_data_types_data_type_name: data_type_name
-- tables constraints
(12, 12, 1), -- PK_tables_table_id: table_id
(13, 14, 1), -- UQ_tables_table_name: table_name
(14, 14, 1), -- CH_tables_table_name: table_name
(15, 13, 1), -- FK_tables_schema_id: schema_id
(16, 15, 1), -- FK_tables_owner_id: owner_id
-- columns constraints
(17, 17, 1), -- PK_columns_column_id: column_id
(18, 18, 1), -- UQ_columns_table_id_column_name: table_id
(18, 19, 2), -- UQ_columns_table_id_column_name: column_name
(19, 18, 1), -- UQ_columns_table_id_position: table_id
(19, 23, 2), -- UQ_columns_table_id_position: position
(20, 19, 1), -- CH_columns_column_name: column_name
(21, 23, 1), -- CH_columns_position: position
(22, 18, 1), -- FK_columns_table_id: table_id
(23, 20, 1), -- FK_columns_data_type_id: data_type_id
-- constraint_types constraints
(24, 24, 1), -- PK_constraint_types_constraint_type_id: constraint_type_id
(25, 25, 1), -- UQ_constraint_types_constraint_type_name: constraint_type_name
(26, 25, 1), -- CH_constraint_types_constraint_type_name: constraint_type_name
-- constraints constraints
(27, 26, 1), -- PK_constraints_constraint_id: constraint_id
(28, 27, 1), -- UQ_constraints_constraint_name: constraint_name
(29, 27, 1), -- CH_constraints_constraint_name: constraint_name
(30, 28, 1), -- FK_constraints_constraint_type_id: constraint_type_id
(31, 29, 1), -- FK_constraints_table_id: table_id
(32, 30, 1), -- FK_constraints_referenced_table_id: referenced_table_id
-- constraint_columns constraints
(33, 32, 1), -- PK_constraint_columns_constraint_id_column_id: constraint_id
(33, 33, 2), -- PK_constraint_columns_constraint_id_column_id: column_id
(34, 34, 1), -- CH_constraint_columns_column_order: column_order
(35, 32, 1), -- FK_constraint_columns_constraint_id: constraint_id
(36, 33, 1), -- FK_constraint_columns_column_id: column_id
-- constraint_referenced_columns constraints
(37, 35, 1), -- PK_constraint_referenced_columns_constraint_id_referenced_column_id: constraint_id
(37, 36, 2), -- PK_constraint_referenced_columns_constraint_id_referenced_column_id: referenced_column_id
(38, 37, 1), -- CH_constraint_referenced_columns_column_order: column_order
(39, 35, 1), -- FK_constraint_referenced_columns_constraint_id: constraint_id
(40, 36, 1), -- FK_constraint_referenced_columns_referenced_column_id: referenced_column_id
-- roles constraints
(41, 38, 1), -- PK_roles_role_id: role_id
(42, 39, 1), -- UQ_roles_role_name: role_name
(43, 39, 1), -- CH_roles_role_name: role_name
-- privilege_types constraints
(44, 41, 1), -- PK_privilege_types_privilege_type_id: privilege_type_id
(45, 42, 1), -- UQ_privilege_types_privilege_type_name: privilege_type_name
(46, 42, 1), -- CH_privilege_types_privilege_type_name: privilege_type_name
-- privileges constraints
(47, 44, 1), -- PK_privileges_privilege_id: privilege_id
(48, 45, 1), -- UQ_privileges_privilege_name: privilege_name
(49, 45, 1), -- CH_privileges_privilege_name: privilege_name
(50, 46, 1), -- FK_privileges_privilege_type_id: privilege_type_id
-- system_privileges constraints
(51, 48, 1), -- PK_system_privileges_system_privilege_id: system_privilege_id
(52, 49, 1), -- UQ_system_privileges_privilege_id: privilege_id
(53, 49, 1), -- FK_system_privileges_privilege_id: privilege_id
-- user_roles constraints
(54, 51, 1), -- PK_user_roles_user_id_role_id: user_id
(54, 52, 2), -- PK_user_roles_user_id_role_id: role_id
(55, 51, 1), -- FK_user_roles_user_id: user_id
(56, 52, 1), -- FK_user_roles_role_id: role_id
-- role_privileges constraints
(57, 53, 1), -- PK_role_privileges_role_id_privilege_id: role_id
(57, 54, 2), -- PK_role_privileges_role_id_privilege_id: privilege_id
(58, 53, 1), -- FK_role_privileges_role_id: role_id
(59, 54, 1), -- FK_role_privileges_privilege_id: privilege_id
(60, 55, 1), -- FK_role_privileges_table_id: table_id
-- user_privileges constraints
(61, 56, 1), -- PK_user_privileges_user_id_privilege_id: user_id
(61, 57, 2), -- PK_user_privileges_user_id_privilege_id: privilege_id
(62, 56, 1), -- FK_user_privileges_user_id: user_id
(63, 57, 1), -- FK_user_privileges_privilege_id: privilege_id
(64, 58, 1), -- FK_user_privileges_table_id: table_id
-- user_sessions constraints
(65, 59, 1), -- PK_user_sessions_session_id: session_id
(66, 63, 1), -- UQ_user_sessions_session_token: session_token
(67, 61, 1), -- CH_user_sessions_logout_time: login_time
(67, 62, 2), -- CH_user_sessions_logout_time: logout_time
(68, 63, 1), -- CH_user_sessions_session_token: session_token
(69, 60, 1); -- FK_user_sessions_user_id: user_id

-- 9. Insert into constraint_referenced_columns
INSERT INTO constraint_referenced_columns (constraint_id, referenced_column_id, column_order) VALUES
-- schemas FK_schemas_owner_id
(8, 1, 1), -- references users.user_id
-- tables FK_tables_schema_id
(15, 6, 1), -- references schemas.schema_id
-- tables FK_tables_owner_id
(16, 1, 1), -- references users.user_id
-- columns FK_columns_table_id
(22, 12, 1), -- references tables.table_id
-- columns FK_columns_data_type_id
(23, 9, 1), -- references data_types.data_type_id
-- constraints FK_constraints_constraint_type_id
(30, 24, 1), -- references constraint_types.constraint_type_id
-- constraints FK_constraints_table_id
(31, 12, 1), -- references tables.table_id
-- constraints FK_constraints_referenced_table_id
(32, 12, 1), -- references tables.table_id
-- constraint_columns FK_constraint_columns_constraint_id
(35, 26, 1), -- references constraints.constraint_id
-- constraint_columns FK_constraint_columns_column_id
(36, 17, 1), -- references columns.column_id
-- constraint_referenced_columns FK_constraint_referenced_columns_constraint_id
(39, 26, 1), -- references constraints.constraint_id
-- constraint_referenced_columns FK_constraint_referenced_columns_referenced_column_id
(40, 17, 1), -- references columns.column_id
-- privileges FK_privileges_privilege_type_id
(50, 41, 1), -- references privilege_types.privilege_type_id
-- user_roles FK_user_roles_user_id
(55, 1, 1), -- references users.user_id
-- user_roles FK_user_roles_role_id
(56, 38, 1), -- references roles.role_id
-- role_privileges FK_role_privileges_role_id
(58, 38, 1), -- references roles.role_id
-- role_privileges FK_role_privileges_privilege_id
(59, 44, 1), -- references privileges.privilege_id
-- role_privileges FK_role_privileges_table_id
(60, 12, 1), -- references tables.table_id
-- user_privileges FK_user_privileges_user_id
(62, 1, 1), -- references users.user_id
-- user_privileges FK_user_privileges_privilege_id
(63, 44, 1), -- references privileges.privilege_id
-- user_privileges FK_user_privileges_table_id
(64, 12, 1), -- references tables.table_id
-- user_sessions FK_user_sessions_user_id
(69, 1, 1), -- references users.user_id
-- system_privileges FK_system_privileges_privilege_id
(53, 44, 1); -- references privileges.privilege_id

-- 10. Insert into privilege_types (sample)
INSERT INTO privilege_types (privilege_type_id, privilege_type_name, description) VALUES
(1, 'TABLE', 'Privilege for table-level operations'),
(2, 'SYSTEM', 'Privilege for system-level operations'),
(3, 'ROLE', 'Privilege for role management');

-- 11. Insert into roles (sample)
INSERT INTO roles (role_id, role_name, description)
VALUES (1, 'admin_role', 'Administrator role with full access');

-- 12. Insert into privileges (sample)
INSERT INTO privileges (privilege_id, privilege_name, privilege_type_id, description)
VALUES (1, 'SELECT_TABLE', 1, 'Permission to select from tables');

-- 13. Insert into system_privileges (sample)
INSERT INTO system_privileges (system_privilege_id, privilege_id, description)
VALUES (1, 1, 'System-wide select privilege');

-- 14. Insert into user_roles (sample)
INSERT INTO user_roles (user_id, role_id)
VALUES (1, 1);

-- 15. Insert into role_privileges (sample)
INSERT INTO role_privileges (role_id, privilege_id, table_id)
VALUES (1, 1, 1); -- admin_role can SELECT on users table

-- 16. Insert into user_privileges (sample)
INSERT INTO user_privileges (user_id, privilege_id, table_id)
VALUES (1, 1, 1); -- admin can SELECT on users table

-- 17. Insert into user_sessions (sample)
INSERT INTO user_sessions (session_id, user_id, login_time, logout_time, session_token)
VALUES (1, 1, CURRENT_TIMESTAMP, NULL, 'sample_token');