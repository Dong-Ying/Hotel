#!/bin/bash

function load_rvm {
  [[ -s /usr/local/rvm/scripts/rvm ]] && . /usr/local/rvm/scripts/rvm
  [[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
}

function install_rvm {
  log "installing rvm"
  curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
  echo 'export rvm_project_rvmrc=1' >> $HOME/.rvmrc
  load_rvm
}

function log {
  echo "*** $1"
}

function check_rvm {
  load_rvm
  hash rvm || install_rvm
  log "rvm installed"
}


function rvm_environment {
    check_rvm && \
    rvm install $RUBY_VERSION && \
    rvm use $RUBY_VERSION && \
    rvm gemset --create use $RUBY_VERSION@hotel
    hash rvm 2>&1 > /dev/null || gem install bundler
}

function ruby_environment {
    rvm_environment
    bundle install
}

function set_ruby_version {
    RUBY_VERSION=`cat .ruby-version`
    RUBY_VERSION=${RUBY_VERSION:5}
}

function main {
    set_ruby_version
    ruby_environment
}

main $@

