-- To create the user from the shell console:
--     sudo -u postgres createuser --createdb --no-superuser --no-createrole --pwprompt chartbrewuser
-- Then enter to the psql shell with:
--     sudo -u postgres psql
-- And execute:

CREATE DATABASE chartbrew_db OWNER chartbrewuser;

-- If you don't have access to the 'createuser' command, you can create the user in the
-- in the SQL console as root user with:

CREATE USER chartbrewuser;
--CREATE ROLE
\password chartbrewpwd
--Enter new password: 
--Enter it again:

-- Connect whithin the same console:

\connect chartbrew_db

-- Or connect from another psql shell with: psql chartbrew_db -U chartbrewuser -W

-- Reassign ownership to all elements:

ALTER DATABASE target_database OWNER TO new_onwer;
REASSIGN OWNED BY old_role [, ...] TO new_role;

-- To assign to an existing user total access to the current DB do:

GRANT ALL PRIVILEGES ON DATABASE chartbrew_db TO chartbrewuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO chartbrewuser;

-- Limit privileges to all except DDL ones:

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO chartbrewuser;
