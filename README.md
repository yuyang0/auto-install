# 自动化软件安装脚本
## desciption
一个使用shell编写的自动化软件安装工具，尤其适合在重装系统后使用，在lst文件夹是配置文件
* lst/ppa.lst     :需要添加的ppa，一行一个ppa，#开头为注释
* lst/software.lst:能够使用官方仓库或者ppa安装的软件，一行一个软件名，或者一行多个软件名（必须用空格分割）,#开头为注释
* lst/url.lst     :需要手动下载的软件，如果是deb文件会自动安装，tar文件会自动解压缩，每一行的格式：filename  url,\#开头为注释

## Requirements
必须是使用debian包管理系统的发行版，红帽系不支持

## Support / issues
有任何问题，请提交issue
Yu Yang
