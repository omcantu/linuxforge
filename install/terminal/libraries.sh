#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
sudo $PKG_MGR install -y \
  build-essential pkg-config autoconf bison clang rustc \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips imagemagick libmagickwand-dev mupdf mupdf-tools gir1.2-gtop-2.0 gir1.2-clutter-1.0 \
  redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common
else
sudo $PKG_MGR install -y \
  @development-tools pkgconfig autoconf bison clang rust \
  openssl-devel readline-devel zlib-devel libyaml-devel readline-devel ncurses-devel libffi-devel gdbm-devel jemalloc \
  vips ImageMagick ImageMagick-devel mupdf mupdf-devel mupdf-libs libgtop2-devel clutter-devel \
  redis sqlite sqlite-devel mariadb-devel postgresql-devel postgresql
fi