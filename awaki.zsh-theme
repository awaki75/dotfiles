PROMPT='${_host}:${_dir}$(git_prompt_info)$ '

local _host="%{$fg[cyan]%}%m%{$reset_color%}"
local _dir="%{$fg[green]%}%~%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
