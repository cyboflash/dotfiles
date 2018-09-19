# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=~/myfs/opt/Postman/app:~/myfs/bin:$PATH
export PS1="[\u@\h \W]\n\$ "

if [ -f ~/.bashrc_private ]; then
	. ~/.bashrc_private
fi
