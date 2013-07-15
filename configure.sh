#!/bin/bash
# this file has some special configuration

function dropbox_setting()
{
    test -d ~/.dropbox-dist || mv ./.dropbox-dist ~/
}

function stardict_setting()
{
    DICT_DIR = ~/.stardict/dic
    test -d $DICT_DIR || mkdir -p $DICT_DIR
    if [ "$(ls -A $DICT_DIR)" ];then
        echo "the directory $DICT_DIR is not empty, it already has dicts"
    else
        wget -O langdao-ec.tar.bz2 http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
        wget -O oxford-gb.tar.bz2 http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-oxford-gb-2.4.2.tar.bz2

        tar -jxf langdao-ec.tar.bz2 -C $DICT_DIR
        tar -jxf oxford-gb.tar.bz2 -C $DICT_DIR
    fi
}

function emacs_setting()
{
    # configure chinese input method of emacs
    echo $PASSWORD | sudo -S mv /usr/bin/emacs /usr/bin/emacs.raw

    echo $PASSWORD | sudo -S echo '#!/bin/bash' >> /usr/bin/emacs
    echo $PASSWORD | sudo -S echo 'export LC_CTYPE=zh_CN.utf-8' >> /usr/bin/emacs
    echo $PASSWORD | sudo -S echo '/usr/bin/emacs.raw "$@"' >> /usr/bin/emacs

    echo $PASSWORD | sudo -S chmod a+x /usr/bin/emacs

    # emacs configuration
    test -d ~/.emacs.d || git clone https://github.com/yuyang0/emacs.d.git ~/.emacs.d
}

dropbox_installed=$(which dropbox)
if [ -n "$dropbox_installed" ];then
    dropbox_setting
fi

stardict_installed=$(which stardict)
if [ -n "$stardict_installed" ];then
    stardict_setting
fi

# emacs_installed=$(which emacs)
# if [ -n "$emacs_installed" ];then
#     emacs_setting
# fi
