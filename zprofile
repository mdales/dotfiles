# This is called if the shell is a login shell
# Need to build a complete environment here

#echo .zprofile

# Set basic paths

# generate minimal path
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/X11/bin:/bin:/sbin:/usr/sbin

export HISTSIZE=100

# Find out about the machine we're on
HOST=`/bin/hostname`


# Add private stuff
export PATH=$PATH:$HOME/Library/Scripts

export PYTHONSTARTUP=$HOME/Library/dot-files/pystartup.py

# add mysql
export PATH=$PATH:/usr/local/mysql/bin


# use less for more
if [ -x /usr/bin/less ]; then
  alias more=less
  export PAGER=less
fi

# swift
export PATH=/opt/swift-5.1.1-RELEASE-ubuntu18.04/usr/bin:$PATH
