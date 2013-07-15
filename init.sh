read -s -p "Enter your root password:" PASSWORD

# check the password
while true; do
	echo "$PASSWORD" | sudo -S echo "" && break
	echo
	read -s -p "incorrect password($PASSWORD), please try again: " PASSWORD
done


test -d $TMP || mkdir -p $TMP
cp -rf ./lst $TMP
cp -f *.sh $TMP
cd $TMP
