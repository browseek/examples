#!/bin/bash

GECKO_DRIVER_VERSION=$(curl -sS https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4)
echo $GECKO_DRIVER_VERSION
DOWNLOAD_DIR=/tmp
FILE=geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
wget -N https://github.com/mozilla/geckodriver/releases/download/$GECKO_DRIVER_VERSION/$FILE -P $DOWNLOAD_DIR/
ls -la $DOWNLOAD_DIR
tar -xzf $DOWNLOAD_DIR/$FILE -C $DOWNLOAD_DIR/
if [ $? -ne 0 ]; then
    echo "Error: Failed to extract the Edge WebDriver."
    exit 1
fi
rm $DOWNLOAD_DIR/$FILE
TARGET_DIR=/usr/local/bin/geckodriver
sudo mv -f $DOWNLOAD_DIR/geckodriver $TARGET_DIR
if [ $? -ne 0 ]; then
    echo "Error: Failed to move the Edge WebDriver."
    exit 1
fi
sudo chown root:root $TARGET_DIR
sudo chmod 0755 $TARGET_DIR
ls -la $DOWNLOAD_DIR

echo "EdgeDriver $FILE has been installed on: $TARGET_DIR"
