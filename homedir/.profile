# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/profile.pre.bash"
#############################################################
# Generic configuration that applies to all shells
#############################################################

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
source ~/.iterm2_shell_integration.`basename $SHELL`
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
#source ~/Dropbox/Private/Boxes/osx/.shellaliases

[ -s "/Users/jbuza/.jabba/jabba.sh" ] && source "/Users/jbuza/.jabba/jabba.sh"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/profile.post.bash"
