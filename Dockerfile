# Development enviornment in Ubuntu 22.10 image

# Setup directory
FROM ubuntu:latest
WORKDIR /setup

# Install packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    python3 \
    python3-pip \
    cmake \
    gcc \
    g++ \
    clang \
    vim \
    git \
    exuberant-ctags \
    cscope \
    zsh \
    curl \
    wget \
    default-jdk \
    default-jre

# Add user
RUN useradd -ms /bin/zsh muddavi 

# Setup dev environment
RUN git clone https://github.com/muddavi/devenv.git
RUN cp devenv/git-prompt.sh /home/muddavi/.git-prompt.sh && chown -R muddavi:muddavi /home/muddavi/.git-prompt.sh
RUN cp devenv/gitconfig /home/muddavi/.gitconfig && chown -R muddavi:muddavi /home/muddavi/.gitconfig
RUN cp devenv/vimrc /home/muddavi/.vimrc && chown -R muddavi:muddavi /home/muddavi/.vimrc
RUN cp devenv/zshrc /home/muddavi/.zshrc && chown -R muddavi:muddavi /home/muddavi/.zshrc
RUN cp -r devenv/config /home/muddavi/.config && chown -R muddavi:muddavi /home/muddavi/.config
RUN cp -r devenv/git_template /home/muddavi/.git_template && chown -R muddavi:muddavi /home/muddavi/.git_template
RUN mkdir -p /usr/local/share/zsh/plugins
RUN cp -r devenv/zsh-plugins/* /usr/local/share/zsh/plugins

USER muddavi
RUN python3 devenv/vim-plugins.py

# Remove devenv repo
USER root
RUN rm -rf devenv

# Make ZSH the default shell for the current user in the container
RUN chsh -s ~/.zshrc

# Run zsh on container start
CMD [ "zsh" ]

# Establish environment
WORKDIR /home/muddavi
USER muddavi


