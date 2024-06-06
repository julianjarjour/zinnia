#!/bin/bash
# ~/.bashrc

[[ "$-" != *i* ]] && return

PS1='\[\e[31m\]\u\[\e[37m\]@\[\e[31m\]\h \[\e[33m\]\W \[\e[90m\]λ \[\e[39m\]'

HISTFILESIZE=10000
HISTCONTROL='erasedups'
HISTIGNORE=' *:..:~:ls:history:exit:clear:fg:fg *:s reboot:s poweroff'
PROMPT_COMMAND='history -a'
shopt -s histappend
shopt -s autocd

alias vi='nvim'
alias ls='ls --color=auto'
alias lsa='ls -A'

s(){ su -c "${*@Q}"; }

g() {
  case "$1" in 
    a) git add "${@:2}" ;;
    b) git branch "${@:2}" ;;
    c) git commit "${@:2}" ;;
    d) case "$2" in 
      s) git diff --staged "${@:3}" ;; 
      n) git diff --no-index "${@:3}" ;; 
      *) git diff "${@:2}"
    esac ;;
    h) git stash "${@:2}" ;;
    i) git init "${@:2}" ;;
    k) git checkout "${@:2}" ;;
    l) git pull "${@:2}" ;;
    m) git merge "${@:2}" ;;
    n) git clone --depth 1 "${@:2}" ;;
    o) git log --oneline -n 20 --graph "${@:2}" ;;
    p) git push "${@:2}" ;;
    r) git reset "${@:2}" ;;
    s) git status -s "${@:2}" ;;
    t) git remote "${@:2}" ;;
    v) git revert "${@:2}" ;;
    w) git show "${@:2}" ;;
    *) git "$@"
  esac
}

bash_history_file=$(mktemp "$USER"_bash_historyXXXXXX)
tac "$HOME/.bash_history" | awk '!x[$0]++' | tac > "$bash_history_file"
mv "$bash_history_file" "$HOME/.bash_history"
unset bash_history_file
