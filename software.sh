read -p "Enter the file which contains the softwares you want to install(default:./lst/software.lst)" SOFTWARE_FILE
if [ "$SOFTWARE_FILE" == "" ];then
    $SOFTWARE_FILE="./lst/software.lst"
fi

while read line
do
    #ignore blank line or comment line
    is_valid=$(echo "$line" | grep "^\s*[^# \t].*$")
    if [ -z "$is_valid" ];then
        continue
    fi
    echo "$PASSWORD"|sudo -S APT-GET -y install "$line"
done < $SOFTWARE_FILE
