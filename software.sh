SOFTWARE_FILE=./lst/software.lst

while read line
do
    #ignore blank line or comment line
    is_valid=$(echo "$line" | grep "^\s*[^# \t].*$")
    if [ -z "$is_valid" ];then
        continue
    fi
    echo "$PASSWORD"|sudo -S APT-GET -y install "$line"
done < $SOFTWARE_FILE
