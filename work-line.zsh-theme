# Work Line ⚡️ ZSH Theme

WL_VCS_PROMPT_PREFIX_1="%{$fg[white]%}on%{$reset_color%} "
WL_VCS_PROMPT_PREFIX_2=":%{$fg[blue]%}"
WL_VCS_PROMPT_SUFFIX="%{$reset_color%} "
WL_VCS_PROMPT_DIRTY=" %{$fg[red]%}"
WL_VCS_PROMPT_CLEAN=" %{$fg[green]%}"

local current_dir='${PWD/#$HOME/~}'

function box {
  [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Show Git Information
local git_info='$(git_prompt_info)'
local git_last_commit='$(git log --pretty=format:"%h \"%s\"" -1 2> /dev/null)'

ZSH_THEME_GIT_PROMPT_PREFIX="${WL_VCS_PROMPT_PREFIX_1}git${WL_VCS_PROMPT_PREFIX_2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$WL_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$WL_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$WL_VCS_PROMPT_CLEAN"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local git_branch_color='$(wl_git_branch_color)'
wl_git_branch_color() {
	if [ -d '.hg' ]; then
		echo -n "${WL_VCS_PROMPT_PREFIX_1}hg${WL_VCS_PROMPT_PREFIX_2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$WL_VCS_PROMPT_DIRTY"
		else
			echo -n "$WL_VCS_PROMPT_CLEAN"
		fi
		echo -n "$WL_VCS_PROMPT_SUFFIX"
	fi
}

PROMPT="
%{$fg[blue]%}%n \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}[${current_dir}]%{$reset_color%}\
${hg_info} \
${git_info}
%{$fg[yellow]%}%* \
⚡️  %{$reset_color%}"
