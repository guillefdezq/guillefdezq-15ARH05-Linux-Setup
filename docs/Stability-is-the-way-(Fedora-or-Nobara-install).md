# Installing the ~envy~ nVIDIA

# My custom settings

## My middle mouse button is wasted and I want to resize
> Change the resize button to right button.
```bash
dconf write /org/gnome/desktop/wm/preferences/resize-with-right-button true
```

## Faster downloads
```bash
sudo nano /etc/dnf/dnf.conf
# append:
max_parallel_downloads=10
```

## Gnome Extension Manager
```bash
flatpak install com.mattjakeman.ExtensionManager
```

# Fedora, I like your only free motto, but I have to get my work done
> Sorry, not sorry. I need the non free stuff.

## Enable RPM Fusion Repository
```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## Multimedia Plugins
```bash
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia # append in case of conflicts: --allowerasing
```

# Favourite extensions:
- 'GPU profile selector' by lori_more
- 'Brightness control using ddcutil' by themightydeity
- 'X11 Gestures' by JoseExposito
- 'Logo Menu' by Aryan Kaushik
- 'Wiggle' by mechtifs
- 'Caffeine' by eon
- 'User Theme X' by grroot
- 'Tiling Assistant' by Leleat
- 'User Themes' by fmuellner
- 'AppIndicator and KStatusNotifierItem Support' by 3v1n0
- 'No a11y' by popov895
- 'Steal my focus window'
- 'Battery time'
- 'Battery Usage Wattmeter'

# Lenovo Legion custom drivers
```bash
sudo dnf copr enable mrduarte/LenovoLegionLinux
sudo dnf install dkms-LenovoLegionLinux
sudo dnf install python-LenovoLegionLinux
```
Remember to run from the Activity dashboard with the standard user (not the root one). Also, put the profiles from [here](https://github.com/johnfanv2/LenovoLegionLinux/tree/main/extra/service/profiles) at `/etc/legion_linux`, otherwise when you select a profile, the program will crash.

# References
- https://itsfoss.com/things-to-do-after-installing-fedora/
- https://github.com/johnfanv2/LenovoLegionLinux