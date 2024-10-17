#!/bin/bash

GECKO_DRIVER_VERSION=$(curl -sS https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4)
wget -N https://github.com/mozilla/geckodriver/releases/download/$GECKO_DRIVER_VERSION/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz -P ~/
tar -xzf ~/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz -C ~/
rm ~/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
sudo mv -f ~/geckodriver /usr/local/bin/geckodriver
sudo chown root:root /usr/local/bin/geckodriver
sudo chmod 0755 /usr/local/bin/geckodriver
