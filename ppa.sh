PPA_FILE=./lst/ppa.lst

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
echo $PASSWORD | sudo -S apt-get -y  upgrade
echo $PASSWORD | sudo -S apt-get -y install wget aria2 apt-fast
# check if apt-fast is installed
apt_fast_installed=$(which apt-fast)
APT_GET=apt-fast
if [ -z "$apt_fast_installed" ];then
    APT_GET=apt-get
fi

