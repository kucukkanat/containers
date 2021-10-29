FROM ubuntu

# Install apt packages
RUN apt update
RUN apt install tmux vim wget curl jq git -y

# Copy bash before starting to install deps and add to path 
COPY .bash_profile /root/.bash_profile

# Install FZF
RUN apt install fzf
RUN echo "export FZF_DEFAULT_COMMAND='find .'" >> $HOME/.bash_profile

# Install NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash
RUN apt install nodejs -y
RUN npm i -g yarn

# Install Golang
WORKDIR /downloads
# RUN wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz -O go.tar.gz
RUN wget https://golang.org/dl/go1.17.2.linux-arm64.tar.gz -O go.tar.gz
RUN tar -xzf go.tar.gz
    # Go binaries
RUN echo "export PATH=\$PATH:/downloads/go/bin" >> $HOME/.bash_profile
    # Go libraries
RUN echo "export PATH=\$PATH:$HOME/go/bin" >> $HOME/.bash_profile
RUN echo "export LSCOLORS=gxfxcxdxbxegedabagacad" >> $HOME/.bash_profile

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
COPY .vimrc /root/.vimrc
# Configure Tmux
COPY .tmux.conf /root/.tmux.conf

ENTRYPOINT [ "bash", "-l" ]