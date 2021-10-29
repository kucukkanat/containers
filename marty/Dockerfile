FROM ubuntu

ENV HOME=/root

# Install apt packages
RUN apt update
RUN apt install tmux vim wget curl jq git -y

# Copy bash before starting to install deps and add to path 
COPY .bash_profile $HOME/.bash_profile

# Install FZF
RUN apt install fzf
RUN echo "export FZF_DEFAULT_COMMAND='find .'" >> $HOME/.bash_profile

# Install NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash
RUN apt install nodejs -y
RUN npm i -g yarn

# Install Golang
WORKDIR /downloads
COPY install_golang install_golang
RUN ./install_golang arm

# Install LF
COPY install_lf install_lf
RUN ./install_lf

# Install Vim extensions
COPY install_vim_plugins install_vim_plugins
RUN ./install_vim_plugins

# Install Bash Git Prompt
COPY install_git_prompt install_git_prompt
RUN ./install_git_prompt

# Install Lazygit
RUN /downloads/go/bin/go get github.com/jesseduffield/lazygit

# Install Lazydocker
RUN /downloads/go/bin/go get github.com/jesseduffield/lazydocker

# Configure Vim
COPY .vimrc $HOME/.vimrc
# Configure Tmux
COPY .tmux.conf $HOME/.tmux.conf

ENTRYPOINT [ "bash", "-l" ]