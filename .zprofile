export PATH=~/.npm-global/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
alias vim='echo -ne "\033]0;vim\007" && nvim'
alias svim="NVIM_APPNAME=nvim-shopify nvim"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/kayodyer/.dotnet/tools"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH

alias ghostty_config=vim\ $HOME/Library/Application\\\ Support/com.mitchellh.ghostty/config

source ~/.zshrc

