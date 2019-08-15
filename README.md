## KHAudio Streaming Device ##

The KHAudio Streaming Device is a Raspberry Pi software appliance which takes an audio feed from your mixer and allows for manual or scheduled initiation of mp3 audio streams to *khstreamer.org* and SIP VOIP (voice over IP - Internet based phone calls) calls to *khconf.com* phone conferencing.

The appliance uses a USB audio interface to take input from your mixer. The input signal is then redirected to the output of the USB audio inteface such that in can be used locally by another application, like FM broadcast transmission.

![KHAudio internal functional diagram](./resources/khaudio_diagram.png)

The input signal from the mixer is internally sent through a chain of digial signal processing to enhance audibility over low bandwidth mp3 streaming and phone conferencing.

The effected signal is then made available to the internal mp3 streaming and SIP VOIP client applications for communications to *khstreaming* and *khconf* services. You can use one or both services.

Obviously you will need Internet access and the KHAudio appliance will need access to the services through your firewall.

A scheduling application, running on the KHAudio appliance, monitors any configured meeting times and will automatically start and then stop enabled service client applications, thus removing the need to manually connect a phone or a mp3 streaming client to your configured services.

The KHAudio appliance can be configured to support multiple congregation meeting schedules. The KHAudio appliance hosts a web user interface to schedule meetings, manually start or stop mp3 streams and SIP VOIP calls, and retrieve *khconf* caller counts (if a *khconf* count user is configured).

A single KHAudio appliance can have one mp3 and one SIP VOIP client running at a time. A single congregation can use both mp3 streaming and phone conferencing for the same meeting, but if you want to simultaneously connect to multiple mp3 streams or multiple phone conferences for the same meeting, you will need to build mulitple KHAudio appliances.

### What Hardware to Buy ###

The image builds were designed to work on a Raspberry Pi 3b+ with an Sabrent AU-MMSA USB Audio Interface.

You can get a Raspberry PI from various resellers on the Internet. Buying a kit which includes a case and a proper power supply is the easiest way to make sure you'll get what you need.

[Raspberry Pi 3b+ Kit on Amazon](https://www.amazon.com/CanaKit-Raspberry-Premium-Clear-Supply/dp/B07BC7BMHY)

The Sabrent AU-MMSA USB Audio Interface is also widely available. It is a very affordable device (less then 10 USD).

[Sabrent AU-MMSA USB Audio Interface Interface on Amazon](https://www.amazon.com/gp/product/B00IRVQ0F8)

You'll need a microSD card, 8GB or larger suggested.

[A Cheap microSD card on Amazon](https://www.amazon.com/Sandisk-Ultra-Micro-UHS-I-Adapter/dp/B073K14CVB)

Assembly is pretty obvious :smile:

![Assembled KHAudio](./resources/khaudiopi.jpg)

### Qucikstart Installation ###

There are two disk image variants available for KHAudio.

[Download disk image for use with Wifi networking](https://www.dropbox.com/s/225kfyo86321opv/khaudio_wifi.img?dl=1)

[Download disk image for wired Ethernet networking](https://www.dropbox.com/s/5rm9dstu340z8jq/khaudio_wired.img?dl=1)

Once you download one of the disk images, simply follow the [Raspberry Pi Foundation's instructions](https://www.raspberrypi.org/documentation/installation/installing-images/) for *Writing an image to the SD card*.

Once the disk image has been downloaded and written to your microSD card, insert the microSD card into your Raspberry Pi and plug it in!

If you chose to use wired Ethernet networking, you'll want to plug in the Ethernet cable to your Raspberry Pi as well.

### Connecting the Raspberry Pi to your Wifi Network ###

If you wrote the [disk image to use with Wifi networking](https://www.dropbox.com/s/225kfyo86321opv/khaudio_wifi.img?dl=1), when you power up the KHAudio appliance you eventually see a Wifi SSID labeled `KH Audio Wireless Setup`. Connect to this Wifi access point, then open a web browser to the following address:

[http://10.0.0.1](http://10.0.0.1)

You will be presented with an interface that will let you provision your Wifi networking.

![KHAudio Wifi Setup](resources/khaudio_wifisetup.png)

### Discovering the KHAudio device on your Network ###

The KHAudio device will request a DHCP lease with the name `khaudio`. If you DHCP and DNS services are tied together (common for Internet service provider DHCP/DNS services), you might simply be able to open a browser and go the following address:

[http://khaudio](http://khaudio)

If not, you will can get the address allocated by your network by looking at your DHCP service connected clients/leases list. Look for `khaudio`. You can then open a web brower to that address. As an example if your DHCP service shows the `khaudio` device on address `192.168.1.45` you would open a browser to the following address:

`http://192.168.1.45`


### Using the Web User Interface ###

The Web user inteface has two screens, one to display the current appliance status, the other to configure meeting times and service parameters. To refesh each page, simply click the status or config buttons on the top of the interface.

#### The Status Page ####

![Status Page](./resources/khaudio_status.png)

The status page can be used to see if *khconf* phone conferencing or *khstreamer* streaming are active. You can optionally start or stop client applications manually.

#### The Configuration Page ####

![Config Page](./resources/khaudio_config.png)

The configuration page allows you to configure start and stop schedules for multiple congregations. You can then configure and enable *khconf* or *khstreaming* services.

### Troubleshooting Issues ###

Please make sure you have allowed access for your KHAudio device through your firewall. It will optionally need access to your *khstreamer.org* audio streaming host as well as *reports.khconf.com* and *sipgw.khconf.com*.

If you are experiencing other issues, please fill out a github issue in this repository.
