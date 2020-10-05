# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo " [${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	behind=`echo -n "${status}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
	diverged=`echo -n "${status}" 2> /dev/null | grep "have diverged" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${ahead}" == "0" ]; then
		bits="▲${bits}"
	fi
	if [ "${behind}" == "0" ]; then
		bits="▼${bits}"
	fi
	if [ "${diverged}" == "0" ]; then
		bits="⑂${bits}"
	fi
	if [ "${renamed}" == "0" ]; then
		bits="🏷️${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="🆕${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="❓${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="👻${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="❗${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo -e " \033[31m${bits}\033[032m"
	fi
}

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[¯\_(ツ)_/¯ $RETVAL] "
}

export PS1="\[\033[31m\]\`nonzero_return\`\[\033[m\]\[\033[2m\]\T\[\033[m\]\[\033[32m\]\`parse_git_branch\` \[\033[m\]\[\033[36;40m\]\w\[\033[m\]\n\[\033[33m\] ⮀⮀⮀⮀⮀ \[\033[m\]"
