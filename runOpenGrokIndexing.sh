#!/bin/sh

sudo /var/opengrok/bin/OpenGrok clearHistory
sleep 1
sudo /var/opengrok/bin/OpenGrok deploy
sleep 1
sudo /var/opengrok/bin/OpenGrok index $1
