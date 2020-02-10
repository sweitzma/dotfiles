# TODO
# - how might I trigger rspec tests from within this image?
# - could I connect to Dash API?
# - can I source a local vimrc on the fly?
# - can I persist the undo state?

FROM rust:1.40 as builder
RUN cargo install ripgrep

FROM alpine:latest
COPY --from=builder /usr/local/cargo/bin/rg /usr/local/bin/rg

ENV HOME /root
ENV TERM=""
ENV FZF_DEFAULT_COMMAND="fd --type f --no-ignore-vcs -H"

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
    bash \
    diffutils \
    git \
    fd \
    fzf \
    nodejs \
    npm \
    python \
    vim \
    yarn

WORKDIR $HOME

# Install VimPlug
ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim $HOME/.vim/autoload/plug.vim

WORKDIR $HOME/.vim

RUN mkdir colors plugged undodir
ADD .vim/colors colors
ADD .vim/vimrcdocker vimrc
RUN vim --not-a-term +PlugInstall +qall > /dev/null

WORKDIR /mnt

ENTRYPOINT ["vim"]
