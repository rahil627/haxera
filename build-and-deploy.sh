#!/usr/bin/env bash
haxe compile.hxml
cp -f index.html /var/www/vhosts/rahilpatel.com/httpdocs/test.html
cp -f app.js.map /var/www/vhosts/rahilpatel.com/httpdocs/
cp -f app.js /var/www/vhosts/rahilpatel.com/httpdocs/


