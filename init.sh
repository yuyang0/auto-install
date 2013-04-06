TMP=~/install_tmp
read -s -p "Enter your root password:" PASSWORD

# check the password
while [[ 1 ]]; do
	echo "$PASSWORD" | sudo -S echo " " && break
	echo
	read -s -p "incorrect password($PASSWORD), please try again: " PASSWORD
done


test -d $TMP || mkdir $TMP
cp -rf ./lst $TMP
cp -f *.sh $TMP
cd $TMP
