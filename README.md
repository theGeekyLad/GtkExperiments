# GTK Experiments
Hey there! I've got something really interesting for the Linux enthusiast in you.
<br /><br />
***Disclaimer:** If you're not a Linux fanboy and aren't running Gnome (or any GTK-based Linux desktop environment), you might want to hit Ctrl + L now and continue surfing!*

## Introduction

Among rivals, Linux is undoubtedly the OS that steals the show. I can vouch that outright - it's **open source**. Nothing beats the degree of customisation that it offers.
<br /><br />
Well well well...let's not forget a worthwhile point here that getting things done without a graphical interface is something that those ex-Windows users aren't really aware of (come on, when have you even fired up the command prompt).
<br /><br />
If you've been living underground as a Linux fanboy, well then hey...Linux is heavily **terminal** based and getting a bunch of those beautiful themes and icon packs installed would require a wee bit of heads up on the bad boy - `/usr/bin/bash`. How you'd wish you had a GUI for everything just like in Windows!

## Projects

GTK Experiments aims to fill in the gaps which the commendable community of Linux developers have missed out on, as the GUI based projects here, could help you get some (rather messy) things done without having to look up a bunch of forums or even the official documentation. It's not just a single, but a bunch of projects under one hood *(with just one at the moment)*.
<br /><br />
I'm personally a **Gnome** fanboy and hence this project is presently based on the essential GTK libraries which if even in case you're running a Qt based desktop environment (KDE for instance), can be installed as dependencies.
<br /><br />
You can find all project screenshots in their respective directories.
<br /><br />
Hope you have fun!

### 1. GRUB 2 Wallpaper Picker

#### Description

Right after your first Linux install, you'd have noticed the high contrast screen that appears after your BIOS and right before Linux boots in. For reference, it's a **dark pink screen** on a typical **Ubuntu installation** with some options. That's GRUB 2, the latest edition of your favourite bootloader.
<br /><br />
High contrast is definitely not nice and here's a handy tool that lets you add some colour to your bootloader by choosing a custom wallpaper image of your choice, the only constraint being `png` and `jpg` images to choose from among. 

#### Usage

* Head into `.../GtkExperiments/Grub2WallPicker/` and download `Grub2WallPicker.py`
* Fire up a terminal in your downloads directory and `python Grub2WallPicker.py`

#### Downsides
It performs 4 different superuser tasks and hence asks for your login password 4 times. 4 times is cheesy I know besides, that'll be fixed over an update. 
