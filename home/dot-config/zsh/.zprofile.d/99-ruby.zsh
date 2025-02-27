#!/bin/zsh
if command -v brew >/dev/null 2>&1; then
  export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
  export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration
fi
