#!/bin/bash
# Copyright 2015 gocp authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

set -ex

cat << EOF > ~/.bash_profile
[ -r ~/.bashrc ] && . ~/.bashrc
export GOPATH=\$HOME
export GOROOT=\$HOME/go
export PATH=\$PATH:\$GOROOT/bin
EOF

cd $HOME
curl -s https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz | tar vzx
