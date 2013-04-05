TMP=~/install_tmp
read -p "Enter your root password:" PASSWORD

if [ "$PASSWORD" == "" ];then
    echo "you did not enter your root password,the script will exit"
    exit
fi

test -d $TMP || mkdir $TMP
cp -rf ./lst $TMP
cd $TMP
