# Noninteractive tzdata installation : https://www.cyberciti.biz/faq/explain-debian_frontend-apt-get-variable-for-ubuntu-debian/
export DEBIAN_FRONTEND=noninteractive

# Git shortcuts
alias gpush="git push origin HEAD"
alias gc="git commit -m"
alias ga="git add ."
alias gpull="git pull origin (git rev-parse --abbrev-ref HEAD)"

# To avoid git commit signing error
export GPG_TTY=$(tty)

# Git ignore
function gi() { curl -sL https://www.gitignore.io/api/\$@ ;}

# Teleport to directory 
tp(){
  cd $(dirname $(fzf));
}

lg () {
    lazygit
}

ld () {
    lazydocker
}

