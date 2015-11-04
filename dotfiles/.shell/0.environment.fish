set fish_greeting "Hello"
set -x FISH_CLIPBOARD_CMD pbcopy
set -x TERM screen-256color
set -x GITHUB_USER richardrowe

# Vim
set -x EDITOR vim

# Virtualenv
if command -v virtualenv > /dev/null
  set -x PATH ./env/bin $PATH
end

# Home bin
set -x PATH $HOME/bin $PATH
# ./bin should take precedence
set -x PATH ./.bin $PATH
set -x PATH ./bin $PATH

# Browser testing
set -x CHROME_BIN /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
