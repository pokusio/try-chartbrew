#!/bin/sh

ramdir="/ramfs"
sys_tempdir="/tmp"
mkdir -p ${sys_tempdir}
sql_client_cnf_file="$(mktemp "$sys_tempdir/this-script-name-XXXXX")"
sql_client_cnf_file_admin="$(mktemp "$sys_tempdir/this-script-name-XXXXX")"
# pw="$(produce_password)"
export CB_DB_USERNAME="chartbrewuser"
export CB_DB_PASSWORD="chartbrewpwd"
export CB_DB_PORT="3306"
export CB_DB_NAME="chartbrew_db"

cat <<EOF > $sql_client_cnf_file_admin
[client]
user=root
password=""
EOF

cat <<EOF > $sql_client_cnf_file
[client]
user=${CB_DB_USERNAME}
password="${CB_DB_PASSWORD}"
EOF

echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
cat -n $sql_client_cnf_file
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"
# -----------------------------------------
#
# cat >"$sql_client_cnf_file" <<EOF
# [client]
# user=${CB_DB_USERNAME}
# password="${CB_DB_PASSWORD}"
# EOF

echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
echo "# -- -- -- Executing SELECT test command"
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"

mysql --defaults-extra-file="$sql_client_cnf_file" -h 0.0.0.0 -e 'select 1' -D ${CB_DB_NAME}



echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
echo "# -- -- -- Showing all MySQL Users"
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"

# mysql --defaults-extra-file="$sql_client_cnf_file" -h 0.0.0.0 -e 'select * from mysql.user;'
mysql --defaults-extra-file="$sql_client_cnf_file_admin" -h 0.0.0.0 -e 'select * from mysql.user;'

echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
echo "# -- -- -- Showing all MySQL Databases"
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"

mysql --defaults-extra-file="$sql_client_cnf_file" -h 0.0.0.0 -e 'SHOW DATABASES;'



echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
echo "# -- -- -- Showing all tables in [${CB_DB_NAME}] SELECT test command"
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"

mysql --defaults-extra-file="$sql_client_cnf_file" -h 0.0.0.0 -e 'SHOW TABLES;' -D ${CB_DB_NAME}




echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # --- # --- # --- # --- #"
echo "# --- # --- # --- # "
echo "# --- # --- # "
echo "# -- -- -- Password encryption test : encrypting an example password"
echo "# --- # --- # "
echo "# --- # --- # --- # "
echo "# --- # --- # --- # --- # --- # --- # --- #"

export EXAMPLE_ENC_MYSQL_USR_PSSWD="DAA21282DD0A7AEC5695AB058DAFD50DB58264F7"
export EXAMPLE_CLEAR_MYSQL_USR_PSSWD=""
export EXAMPLE_CLEAR_MYSQL_USR_PSSWD="chartbrewpwd"
# export EXAMPLE_DECRYPTED_MYSQL_USR_PSSWD=""

mysql --defaults-extra-file="$sql_client_cnf_file" -h 0.0.0.0 -e "SELECT UNHEX(MD5('${EXAMPLE_CLEAR_MYSQL_USR_PSSWD}')) AS Encr_test_passwd;"


exit 0

rm "$sql_client_cnf_file"