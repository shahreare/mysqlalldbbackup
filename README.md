# mysqlalldbbackup V1.0
A shell script that can take backup of all mysql database separately and compress them in a folder

## Installation
Clone or download the scripts to your system. Give the script execution permission. On the top of script set the necessary information in the following variables

````
### This will be the prefix of zipped file
server_name="local"

### Database Username
data_user="dbuser"

### Database Password
data_pass="dbpass"

### FTP Credentials if you use ftppush script
ftp_host='ftp_host'
ftp_user='ftp_user'
ftp_pass='ftp_pass'
````


## Code Example
TO take only backup run the backup script.

````
./backup.sh
````

To push the back up to a ftp server run ftppush.sh

````
./ftppush.sh
````

You put the script in cronjob to schedule regular execution.
 
 ## Contributors

- Report issues
- Open pull request with improvements
- Spread the word
- Reach out to me directly at [A H M Reza Shahreare Khan](http://www.shahreare.me)

## License

MIT © [A H M Reza Shahreare Khan](http://www.shahreare.me)
