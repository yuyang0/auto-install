function dropbox_setting()
{
    test -d ~/.dropbox-dist || mv ./.dropbox-dist ~/
}
function stardict_setting()
{
    wget -O langdao-ec.tar.bz2 http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
    echo $PASSWORD | sudo -S tar -jxf langdao-ec.tar.bz2 -C /usr/share/stardict/dic
}
function emacs_setting()
{
    test -d ~/.emacs.d || git clone https://github.com/YuYang00/emacs.d.git ~/.emacs.d
}

dropbox_installed=$(which dropbox)
if [ -n $dropbox_installed ];then
    dropbox_setting
fi

stardict_installed=$(which stardict)
if [ -n $stardict_installed ];then
    stardict_setting
fi

emacs_installed=$(which emacs)
if [ -n $emacs_installed ];then
    emacs_setting
fi
