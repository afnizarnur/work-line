# Work Line Zsh Theme

VIRTUAL_ENV_DISABLE_PROMPT=true

PROMPT='
$(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version)
%{$fg[$CARETCOLOR]%}⚡️%{$resetcolor %} '
