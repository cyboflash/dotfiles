# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=~/myfs/bin:$PATH
# export PS1="${PS1::-3}\n$ "
export PS1="[\u@\h \W]\n\$ "
