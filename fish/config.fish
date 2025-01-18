if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -U fish_greeting ""

alias g='git'
alias vi='nvim'
alias vim='nvim'
alias python=python3
alias icat='kitty +kitten icat'
alias v='npx vitest run'
alias fd='fdfind'
alias rg='rgrep'

kubectl completion fish | source

set -gx GPG_TTY (tty)

# android command-lite-tools
set -x ANDROID_HOME ~/Android

# sdkman configs
function sdk
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/kambi/.local/share/coursier/bin"
# <<< coursier install directory <<<
#
# set PATH $PATH (find ~/.sdkman/candidates/maven/current/bin -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/maven/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/Android/platform-tools/adb" -maxdepth 0)

# set PATH $PATH (find ~/.sdkman/candidates/kotlin/current/bin -maxdepth 0)
# set PATH $PATH (find ~/.sdkman/candidates/java/current/bin -maxdepth 0)

set -x JAVA_HOME $HOME/.sdkman/candidates/java/current
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# pyenv(python version manager) path
set -x PATH $HOME/.pyenv/bin $PATH
status --is-interactive; and . (pyenv init -|psub)

# modular path
set -xg MODULAR_HOME "$HOME/.modular"
set -xg PATH "$MODULAR_HOME/pkg/packages.modular.com_mojo/bin" $PATH


#conda linked to fish
source /home/kambi/miniconda3/etc/fish/conf.d/conda.fish

# traverses project tree till .nvmrc is located
# function find_up
#     set path (pwd)
#     while test $path != /
#         and not test -e "$path/$argv[1]"
#         set path (dirname $path)
#     end
#     if test -e "$path/$argv[1]"
#         echo $path
#     else
#         echo ""
#     end
# end
# function __check_nvm --on-variable PWD
#     if status --is-command-substitution
#         return
#     end
#     set nvm_path (find_up ".nvmrc" | tr -d '[:space:]')
#     if test "$nvm_path" != ""
#         set nvmrc_node_version (nvm version (cat "$nvm_path/.nvmrc") '; 2>1')
#         if test "$nvmrc_node_version" = N/A
#             echo "Installing node version "(cat "$nvm_path/.nvmrc")
#             nvm install
#             set nvm_node_version (nvm version)
#         else if test "$nvmrc_node_version" != (nvm version)
#             echo "Changing node version to $nvmrc_node_version"
#             nvm use
#             set nvm_node_version (nvm version)
#         end
#         echo "$nvm_path/.nvmrc"
#     else if test (nvm version) = none
#         nvm use default --silent
#         # else if test (nvm version) != (nvm version default)
#         # echo "Reverting node version to default"
#         # nvm use default
#     end
# end
# __check_nvm
#
# bass source ~/.nvm/nvm.sh >/dev/null ^ /dev/null



# set -gx NVM_DIR "$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# pnpm
set -gx PNPM_HOME "/home/kambi/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# deno
set -x DENO_INSTALL /home/kambi/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
#end deno

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opam configuration
source /home/kambi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kambi/.ghcup/bin $PATH # ghcup-env

set -gx PATH $PATH /home/kambi/.local/bin
