test -e "/Library/Application Support/Sinch/profile.zsh" && source "/Library/Application Support/Sinch/profile.zsh"

# Init fnm after other PATH mutations so its Node shims take priority.
eval "$(fnm env --use-on-cd --shell zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


alias cols='colima start --cpu 6 --memory 12 --network-address'
alias gpf='git push --force-with-lease'
gs(){
  git stash $@
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
autoload -Uz compinit
compinit
eval "$(fnm completions --shell zsh)"
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Google Cloud SDK
if [[ -f /opt/homebrew/share/google-cloud-sdk/path.zsh.inc ]]; then
  source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
fi
if [[ -f /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc ]]; then
  source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
fi

eval "$(atuin init zsh)"

eval "$(zoxide init zsh)"

