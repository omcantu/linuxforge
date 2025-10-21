#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
run_pkg_mgr install \
  build-essential pkg-config autoconf bison clang rustc \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips imagemagick libmagickwand-dev mupdf mupdf-tools gir1.2-gtop-2.0 gir1.2-clutter-1.0 \
  redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common
elif [ "$OS_NAME" = "Fedora" ]; then
run_pkg_mgr install \
  @development-tools pkgconfig autoconf bison clang rust \
  openssl-devel readline-devel zlib-devel libyaml-devel readline-devel ncurses-devel libffi-devel gdbm-devel jemalloc \
  vips ImageMagick ImageMagick-devel mupdf mupdf-devel mupdf-libs libgtop2-devel clutter-devel \
  redis sqlite sqlite-devel mariadb-devel postgresql-devel postgresql
else
run_pkg_mgr install \
  base-devel bash-completion bat btop cargo clang dust eza fastfetch fd ffmpegthumbnailer fontconfig fzf github-cli gum imagemagick  \
  imv jq lazydocker lazygit libsecret libvips libyaml libreoffice llvm localsend luarocks mariadb-libs mise ncurses noto-fonts noto-fonts-cjk \
  noto-fonts-emoji noto-fonts-extra nvim obs-studio obsidian openssl plocate postgresql-libs power-profiles-daemon python-gobject \
  python-poetry-core redis readline rust ripgrep signal-desktop tree-sitter-cli ttf-cascadia-mono-nerd \
  ttf-jetbrains-mono-nerd unzip woff2-font-awesome xmlstarlet xournalpp zoxide sqlite postgresql clutter
fi
