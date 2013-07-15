SOFTWARE_FILE=./lst/software.lst
if [ -z "$APT_GET" ]; then
	APT_GET=apt-get
fi
while read line
do
    #ignore blank line or comment line
    is_valid=$(echo "$line" | grep "^\s*[^# \t].*$")
    if [ -z "$is_valid" ];then
        continue
    fi
    echo $PASSWORD | sudo -S $APT_GET -y install $line || exit_with_msg "install $line error"
done < $SOFTWARE_FILE
