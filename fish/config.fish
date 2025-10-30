if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -U fish_greeting ""

alias pn='pnpm'
alias g='git'
alias ga='git add'
alias gasp='git add . && czg && git pull && git push'
alias gs='czg'
alias vi='nvim'
alias vim='nvim'
alias python=python3
alias icat='kitty +kitten icat'
alias kth='kitten themes'
alias v='npx vitest run'
alias fd='fdfind'
alias rg='rgrep'
alias pip='pip3'
alias docker='podman'

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

#fish_add_path (find "$HOME/.sdkman/candidates/maven/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
#fish_add_path (find "$HOME/Android/platform-tools/adb" -maxdepth 0)

set -x JAVA_HOME $HOME/.sdkman/candidates/java/current
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# pyenv(python version manager) path
#set -x PATH $HOME/.pyenv/bin $PATH
#status --is-interactive; and . (pyenv init -|psub)

# modular path
set -xg MODULAR_HOME "$HOME/.modular"
set -xg PATH "$MODULAR_HOME/pkg/packages.modular.com_mojo/bin" $PATH


#conda linked to fish
#source /home/kambi/miniconda3/etc/fish/conf.d/conda.fish

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

# docker
set -Ux DOCKER_HOST unix:///run/user/1000/podman/podman-machine-default-api.sock
set -x TESTCONTAINERS_RYUK_DISABLED true

# infisical
# set -x INFISICAL_PROJECT_ID 1589d614-ca97-409d-82dd-bb16b4686dc4

# opam configuration
source /home/kambi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kambi/.ghcup/bin $PATH # ghcup-env

set -gx PATH $PATH /home/kambi/.local/bin
set -x USERNAME Kambi-V

set -gx PATH $PATH /home/kambi/.local/bin
starship init fish | source
