#!/bin/bash
# Time-stamp: <2013-01-15 11:27:21 by Yu Yang>
#===============================================================================
#      Filename:  main.sh
#       Created:  2013-04-04 16:38:35
#
#   DESCRIPTION:  系统安装脚本，全自动的安装我需要的软件
# 
#        Author:  Yu Yang
#         Email:  yy1990cn@gmail.com
#===============================================================================
set -o nounset

. ./init.sh
. ./ppa.sh
. ./software.sh
. ./url.sh
. ./configure.sh

cd ~
# remove the temp dir
rm -rf $TMP
