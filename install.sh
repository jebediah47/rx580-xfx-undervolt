#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

chmod +x undervolt
cp undervolt /bin/
cp undervolt.service /etc/systemd/system/
systemctl daemon-reload
sleep 1
systemctl enable --now undervolt.service
sleep 1
systemctl status undervolt.service
