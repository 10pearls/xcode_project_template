#!/bin/bash

mkdir /usr/local/bin

cd /usr/local/bin

curl -O http://10.0.0.192/git/xcode_project_template/raw/master/Scripts/xcode-seed

chmod 700 xcode-seed
