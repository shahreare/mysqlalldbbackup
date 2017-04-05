#!/bin/bash


### Backup file prefix
server_name="local"

### Database Username
data_user="dbuser"

### Database Password
data_pass="dbpass"

### FTP Credentials
ftp_host='ftp_host'
ftp_user='ftp_user'
ftp_pass='ftp_pass'
#ftp_folder = 'backup'

curr_time="$(date +%Y%m%d%H%M%S)"
location=$curr_time

### Getting all database name from mysql
all_db="$(mysql -u $data_user -h localhost -p$data_pass -Bse 'show databases')"

### creating a directry with date as name
mkdir $location
for database in $all_db
do
### putting databases which i do not need to take backup 
if [ $database == "mysql" ] || [ $database == "information_schema" ] || [ $database == "phpmyadmin" ] || [ $database == "performance_schema" ]
then
continue
fi

mysqldump -u $data_user -h localhost -p$data_pass $database | gzip -9 > $location/$database.$curr_time.sql.gz
done

### compressing directory 
tar zcvf "$server_name"_"$curr_time".tar.gz $location/

### removing created directory
rm -r $location

ftp -n $ftp_host <<END_SCRIPT
quote USER $ftp_user
quote PASS $ftp_pass
binary
#cd $ftp_folder
put "$server_name"_"$curr_time".tar.gz
quit
END_SCRIPT
exit 0