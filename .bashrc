# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=~/myfs/opt/Postman/app:~/myfs/bin:$PATH
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\[$txtylw\]\u\[$txtrst\]\[$bldwht\]@\[$txtrst\]\[$txtgrn\]\h\[$txtrst\]\[$txtrst\] \W\\n\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "


if [ -f ~/.bashrc_private ]; then
	. ~/.bashrc_private
fi

