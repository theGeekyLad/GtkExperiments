# GTK Experiments
Hey there! I've got something really interesting for the Linux enthusiast in you.

***Disclaimer:** If you're not a Linux fanboy and aren't running Gnome (or any GTK-based Linux desktop environment), you might want to hit Ctrl + L now and continue surfing!*

## Introduction

Among rivals, Linux is undoubtedly the OS that steals the show. I can vouch that outright - it's **open source**. Nothing beats the degree of customisation that it offers.

Well well well...let's not forget a worthwhile point here that getting things done without a graphical interface is something that those ex-Windows users aren't really aware of (come on, when have you even fired up the command prompt).

If you've been living underground as a Linux fanboy, well then hey...Linux is heavily **terminal** based and getting a bunch of those beautiful themes and icon packs installed would require a wee bit of heads up on the bad boy - `/usr/bin/bash`. How you'd wish you had a GUI for everything just like in Windows!

GTK Experiments aims to fill in the gaps which the commendable community of Linux developers have missed out on, as the GUI based projects here, could help you get some (rather messy) things done without having to look up a bunch of forums or even the official documentation. It's not just a single, but a bunch of projects under one hood *(with just one at the moment)*.

_**Note:** All project screenshots are in their respective directories._

## GTK ... ?

Though I personally am a **KDE** fanboy, **GTK** makes for neat GUIs and hence this project is based on the essential GTK libraries which if even in case you're running a Qt based desktop environment (KDE for instance), can be installed as dependencies.

## Index

1. GRUB 2 Wallpaper Picker
2. Screen Orientation Manager

_**Note:** You're requested to have the latest version of Python 3 and GTK libraries installed for best results._

## [1] GRUB 2 Wallpaper Picker

### Description

Right after your first Linux install, you'd have noticed the high contrast screen that appears after your BIOS and right before Linux boots in. For reference, it's a _dark pink screen_ on a typical **Ubuntu** installation with some options. That's GRUB 2, the latest edition of your favourite bootloader.

High contrast is definitely not nice and here's a handy tool that lets you add some colour to your bootloader by choosing a custom wallpaper image of your choice, the only constraint being _png_ and _jpg_ images to choose from among. 

### Usage

* Clone this repository
* Extract the downloaded ZIP to say `GtkExperiements`
* Navigate to `GtkExperiements/Grub2WallPicker`
* Fire up a terminal in here and `python Grub2WallPicker.py`

### Downsides
It performs 4 different superuser tasks and hence asks for your login password 4 times. 4 times is cheesy I know besides, that'll be fixed over an update. 

## [2] Screen Orientation Manager

### Description

Though Linux as such is just shell, GUI packages bring with it all the frills. Well, those frills don't really include a _solid screen orientation manager_. The ones that come pre-bundled with the GUI are mostly crude for reasons explained as so. The biggest problem here is that these primitive orientation managers don't really rotate your touchpad or touchscreen (in case you have one) along with the actual screen rotation which makes it impractical to use such input devices as the orientations between them and the screen mismatch. If you've been using GNOME or KDE on a convertible for a while now, you're sure to decry!

Here's a little WYSIWYG tool that extends the screen's orientation to even the touchpad and (if present) the touchscreen.

### Usage

* Clone this repository
* Extract the downloaded ZIP to say `GtkExperiements`
* Navigate to `GtkExperiements/ScreenOrientationManager`
* Fire up a terminal in here and `python ScreenOrientationManager.py`

_**Note:** The `bin` directory contains vital files required for execution. Deleting it will fail the program. Also, there's a little manual included within just in case you're lost.`_

### Downsides
You're required to be on an **Xorg** session for results as unfortunately _Wayland_ isn't supported at the moment. Probably down the road, yeah!

### Credits

Thanks to @rub077, for this project builds upon his shell script.