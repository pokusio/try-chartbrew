#!/bin/sh

ramdir="/ramfs"
sys_tempdir="/tmp"
mkdir -p ${sys_tempdir}
sql_client_cnf_file="$(mktemp "$sys_tempdir/this-script-name-XXXXX")"
# pw="$(produce_password)"
export CB_DB_USERNAME="chartbrewuser"
export CB_DB_PASSWORD="chartbrewpwd"
export CB_DB_PORT="3306"
export CB_DB_NAME="chartbrew_db"

cat << EOF> $sql_client_cnf_file
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


exit 0

mysql -h 0.0.0.0 --defaults-extra-file="$sql_client_cnf_file" -e 'select 1'

rm "$sql_client_cnf_file"