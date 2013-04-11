URL_FILE=./lst/url.lst

while read line
do
    #ignore blank line or comment line
    is_valid=$(echo "$line" | grep "^\s*[^# \t].*$")
    if [ -z "$is_valid" ];then
        continue
    fi
    name=$(echo "$line" | awk '{print $1}')
    url=$(echo "$line" | awk '{print $2}')
    test -e $name || wget -O $name $url || continue

    # is deb file
    is_deb=$(echo $name | grep '\.deb$')
    if [ -n "$is_deb" ]; then
        test -e $name && echo "$PASSWORD" | sudo -S dpkg -i $name
        continue
    fi

    is_tar=$(echo $name | egrep '\.tar\.(gz|bz2)$')
    if [ -n "$is_tar" ];then
        test -e $name && tar -xf $name
        continue
    fi
done < $URL_FILE
