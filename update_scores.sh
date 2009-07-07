##!/usr/bin/env bash
cd ~/highfive.edschmalzle.com/current
/usr/bin/rake highfive:score
cp db/development.sqlite3 db/production.sqlite3
touch tmp/restart.txt