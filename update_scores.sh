##!/usr/bin/env bash

export PATH=~/.gems/bin:$PATH

export GEM_HOME=$HOME/.gems
export GEM_PATH=$GEM_HOME:/usr/lib/ruby/gems/1.8

cd ~/highfive.edschmalzle.com/current
/usr/bin/rake highfive:score
cp db/development.sqlite3 db/production.sqlite3
touch tmp/restart.txt