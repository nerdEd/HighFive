##!/usr/bin/env bash

cd ~/highfive.edschmalzle.com/current
rake highfive:score RAILS_ENV=production
touch tmp/restart.txt