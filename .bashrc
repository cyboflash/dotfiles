# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export MINICOM="-m -w -s -c on"
PATH=~/myfs/bin:$PATH
PATH=~/myfs/opt/ocarina/bin:$PATH
PATH=~/myfs/opt/vim/bin:$PATH
PATH=~/myfs/opt/Xilinx/SDK/2017.4/bin:$PATH
export PATH
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\[$bldwht\][\w]\\n\[$bldylw\]\u\[$bldwht\]@\[$bldpur\]\H\\n\[$bldcyn\]\$git_branch\[$bldred\]\$git_dirty\[$bldgrn\]\$\[$txtrst\] "
# export PS1="\s \V\\$ "


if [ -f ~/.bashrc_private ]; then
	. ~/.bashrc_private
fi

