##!/usr/bin/env bash
cd ~/highfive.edschmalzle.com/current
cp ../shared/production.sqlite3 db/development.sqlite3
/usr/bin/rake highfive:score
cp db/development.sqlite3 ../shared/production.sqlite3
touch tmp/restart.txt