set fish_user_abbreviations $fish_user_abbreviations 'l=ls'
set fish_user_abbreviations $fish_user_abbreviations 'g=git'
set fish_user_abbreviations $fish_user_abbreviations 'gs=git status'
set fish_user_abbreviations $fish_user_abbreviations 'gd=git diff'
set fish_user_abbreviations $fish_user_abbreviations 'gdc=git diff --cached'
set fish_user_abbreviations $fish_user_abbreviations 'gc=git commit -m'
set fish_user_abbreviations $fish_user_abbreviations 'gi=git issues'
set fish_user_abbreviations $fish_user_abbreviations 'gl=git log'
set fish_user_abbreviations $fish_user_abbreviations 'gca=git commit -am'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'
set fish_user_abbreviations $fish_user_abbreviations 'ga=git add'
set fish_user_abbreviations $fish_user_abbreviations 'gaa=git add -A'
set fish_user_abbreviations $fish_user_abbreviations 'gp=git push'
set fish_user_abbreviations $fish_user_abbreviations 'gim=git issues milestone'

if command -v tmuxinator > /dev/null
  set fish_user_abbreviations $fish_user_abbreviations 'mux=tmuxinator'
end

alias git="hub"
