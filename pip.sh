#!/bin/bash
# Time-stamp: <2013-01-15 11:27:21 by Yu Yang>
#===============================================================================
#      Filename:  pip.sh
#       Created:  2013-07-03 17:20:53
#
#   DESCRIPTION:  use pip to install some python packages
#
#        Author:  Yu Yang
#         Email:  yy1990cn@gmail.com
#===============================================================================
set -o nounset
REQUIREMENTS = ./lst/requirements.txt
test -e $REQUIREMENTS && echo $PASSWORD | sudo -S pip install -r $REQUIREMENTS
