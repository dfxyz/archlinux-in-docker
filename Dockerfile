FROM archlinux:base-devel

RUN ["pacman", "-Syu", "--noconfirm", "zsh", "python", "vim", "git", "docker", "docker-compose"]
RUN ["rm", "-rf", "/var/cache/pacman/pkg/*"]

WORKDIR /root
RUN ["git", "clone", "https://github.com/dfxyz/dotfiles.git"]
WORKDIR /root/dotfiles
RUN ["git", "submodule", "update", "--init"]
RUN ["./mklink.sh"]

COPY res/entrypoint.sh /entrypoint.sh
COPY res/exports_local /root/.exports_local

WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
