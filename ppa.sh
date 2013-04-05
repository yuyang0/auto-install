read -p "Enter the file which cntained ppa(default:./lst/ppa.lst):" PPA_FILE
if [ "$PPA_FILE" == "" ];then
    PPA_FILE=./lst/ppa.lst
fi

while read line
do
    #ignore blank line or comment line
    is_valid=$(echo "$line" | grep "^\s*[^# \t].*$")
    if [ -z "$is_valid" ];then
        continue
    fi
    echo $PASSWORD | sudo -S add-apt-repository -y $line
done < $PPA_FILE
# install apt-fast
echo $PASSWORD | sudo -S add-apt-repository -y ppa:apt-fast/stable
echo $PASSWORD | sudo -S apt-get -y update
echo "$PASSWORD"|sudo -S apt-get -y install wget aria2 apt-fast
# check if apt-fast is installed
apt-fast-installed=$(which apt-fast)
APT-GET=apt-fast
if [ -z $apt-fast-installed ];then
    APT-GET=apt-get
fi
echo $PASSWORD | sudo -S APT-GET -y  upgrade
