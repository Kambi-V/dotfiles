if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR 'nvim'
alias vi='nivm'
alias vim='nvim'
alias python=python3

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Flutter directory installed with snapd
set -gx PATH $PATH /snap/bin/flutter

# android command-lite-tools
set -x ANDROID_HOME ~/Android
set -x PATH $ANDROID_HOME/cmdline-tools/9.0/bin $PATH
# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/home/kambi/.cache/coursier/arc/https/github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz/jdk8u292-b10"
set -gx PATH "$PATH:/home/kambi/.cache/coursier/arc/https/github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz/jdk8u292-b10/bin"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/kambi/.local/share/coursier/bin"
# <<< coursier install directory <<<
set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

#conda linked to fish
source /home/kambi/miniconda3/etc/fish/conf.d/conda.fish

 # traverses project tree till .nvmrc is located
function find_up
    set path (pwd)
    while test $path != "/"
        and not test -e "$path/$argv[1]"
        set path (dirname $path)
    end
    if test -e "$path/$argv[1]"
        echo $path
    else
        echo ""
    end
end
function __check_nvm --on-variable PWD
    if status --is-command-substitution
        return
    end
    set nvm_path (find_up ".nvmrc" | tr -d '[:space:]')
    if test "$nvm_path" != ""
        set nvmrc_node_version (nvm version (cat "$nvm_path/.nvmrc") '; 2>1')
        if test "$nvmrc_node_version" = "N/A"
            echo "Installing node version "(cat "$nvm_path/.nvmrc")
            nvm install
            set nvm_node_version (nvm version)
        else if test "$nvmrc_node_version" != (nvm version)
            echo "Changing node version to $nvmrc_node_version"
            nvm use
            set nvm_node_version (nvm version)
        end
        echo "$nvm_path/.nvmrc"
    else if test (nvm version) = "none"
        nvm use default --silent
    else if test (nvm version) != (nvm version default)
        echo "Reverting node version to default"
        nvm use default
    end
end
__check_nvm

bass source ~/.nvm/nvm.sh > /dev/null ^ /dev/null;

# sdkman configs
function sdk
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end


# set -gx NVM_DIR "$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
