#!/bin/bash

# add packages required to run clients
/bin/bash ./pacakages/install.sh

# add the needed sound modules
cp -f ./kernel_modules/modules /etc/modules
cp ./kernel_modules/modprobe.d/sound.conf /etc/modprobe.d/sound.conf
modprobe snd-aloop
modprobe snd-dummy

# add sound device configurations and effects processing
cp ./alsa/asound.conf /etc/asound.conf
cp ./alsa/asound.state /var/lib/alsa/asound.state
alsactl restore
alsactl nrestore

# add patching service from USB input to effect processors
cp ./alsaloop/config/alsaloop.conf /etc/alsaloop.conf
cp ./alsaloop/systemd/alsaloop.service /lib/systemd/system/alsaloop.service
systemctl enable alsaloop.service
systemctl alsaloop start

# add KHConf SIP client service scripts and template configuration
mkdir -p /var/lib/khconf
cp ./khconf/scripts/* /var/lib/khconf/
chmod +x /var/lib/khconf/*
mkdir -p /var/lib/khconf/config
cp ./khconf/config/template.conf /var/lib/khconf/config/template.conf

# add KHStreamer client service scripts and template configuration
mkdir -p /var/lib/khstreamer
cp ./khstreamer/scripts/* /var/lib/khstreamer/
chmod +x /var/lib/khstreamer/*
mkdir -p /var/lib/khstreamer/config
cp ./khstreamer/config/template.conf /var/lib/khstreamer/config/template.conf

# add meeting scheduler service
mkdir -p /var/lib/meeting_scheduler
cp ./meeting_scheduler/scripts/*.py /var/lib/meeting_scheduler/
cp ./meeting_scheduler/systemd/meeting_scheduler.service /lib/systemd/system/meeting_scheduler.service
systemctl enable meeting_scheduler.service
systemctl start meeting_scheduler.service

# add the configuration Web interface
mkdir -p /var/lib/configuration_app
cp ./configuration_app/app.py /var/lib/configuration_app/app.py
mkdir -p /var/lib/configuration_app/templates
cp ./configuration_app/configuration_app/templates/status.html /var/lib/configuration_app/templates/status.html
cp ./configuration_app/configuration_app/templates/config.html /var/lib/configuration_app/templates/config.html
mkdir -p /var/lib/configuration_app/static/stylesheets
cp ./configuration_app/static/stylesheets/app.css /var/lib/configuration_app/static/stylesheets/app.css
cp ./configuration_app/systemd/khaudioconfig.service /lib/systemd/system/khaudioconfig.service
systemctl enable khaudioconfig.service
systemctl start khaudioconfig.service

