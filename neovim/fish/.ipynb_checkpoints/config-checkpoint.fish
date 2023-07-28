if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR 'nvim'
alias vi='nivm'
alias vim='nvim'


function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end


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
