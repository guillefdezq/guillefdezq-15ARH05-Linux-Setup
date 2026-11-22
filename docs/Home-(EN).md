$$\Huge{\text{Welcome to the LucidTypist-s-15ARH05-Linux-Guide wiki!}}$$

$$\textit{A unified Setup Guide and tricks used for installing Linux over Lenovo Legion 5 laptop (15ARH05)}$$


# A little notice
- This repo is being written using several guides over GitHub and other Wikis. References will be added for more information.
- It will mainly be focused on (but could apply to other):
  - Arch based distros (_ArchLinux_, _Endeavour_ and _Manjaro_), _Fedora_ and Ubuntu based distros (_Pop_OS_!).
  - Gnome Desktop Environment ([So I see you're using Gnome](https://youtu.be/FQM5fU7V-MM)).
  - Lenovo Legion 5 laptop, 15ARH05 model, meaning:
    - It uses Ryzen 7 4800H CPU with Radeon Graphics
    - Nvidia Geforce GTX 1650 (TI?/for laptops)
- **Non-free software will be used**, just for the [NVIDIA drivers](https://youtu.be/_36yNWw_07g?t=10)...
- Sections or paragraphs with:
  - a 📝 memo emoji means writing is on the way.
  - a 🛂 passport control emoji means that the docs should be revised.
  - a 🚨 police car light emoji means that the information could be inaccurate or needs revision.
- I will try make to get a smile whilst doing all this process.
- Please [open threads in the issues section by clicking here](https://github.com/lucidtyper/LucidTypist-s-15ARH05-Linux-Guide/issues/new) if you find any problems, typos, have suggestions, or want to discuss/debate anything you want.

# Let's get down to it
If you're reading this post, I'm pretty sure you have some experience using computers, so I understand that there's no need for me to explain how to put a Linux system image on a flash drive and install it on a computer. The installation procedure is the same as on a regular computer, although it is recommended that you boot the computer and install it using the "hybrid mode" for the graphical resources; in "discrete mode" it will work as well, but it is very likely that when you finish the installation you will be missing drivers for the integrated graphics card. Also disable secure boot and fast boot if you also use Windows and want to look at its partitions from Linux.

# Why is the video on the external display seizing up?
> 📝 You need to install the drivers that make you envious.
Until you install the envy drivers, the display is going to do weird things. I recommend you install the non-free drivers. I'm going to show how to install them on the systems I usually use. 
> 🚨 Oh, by the way: X11 works best for selecting the driver you want to use and for displays with different refresh rates.

## Ubuntu 🚨
If I recall correctly, you have to make use of the "Software and Drivers" section (or something like that).

## Pop_OS!
Just make use of the image they provide with the Nvidia edition.

## Fedora
Ensure you are using the latest Linux kernel by putting in the following command and rebooting:
```bash
sudo dnf update -y # and reboot if you are not on the latest kernel
```

Now, open two terminals. In the first one insert the following to install the drivers:
```bash
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
```

And in the second one insert the following to reboot when the installation is finished successfully:

```bash
watch -g modinfo -F version nvidia; sleep 10; reboot
```

> 🛂 See the [original documentation](https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla) for the reason for typing all these commands.

## Arch Linux 🚨
If you use the official archinstall script, select nvidia (proprietary).

## Manjaro 📝
Use Manjaro settings to install drivers from here: you have to select only the non-free nvidia driver (only the one that says Nvidia, no prime, no amd or whatsoever) and all the free AMD drivers that appear.

## Endeavour 📝
> 💭 I think I read that the OS itself has its wizards to install it without having to touch the keyboard. I have yet to try it out. 🧙🏻

# I miss Lenovo Vantage / Lenovo Legion Toolkit.... and other software
Check out the following guides:
- To limit the battery charge:
   - https://github.com/cszach/linux-on-lenovo-legion?tab=readme-ov-file#battery-conservation-mode
   - https://github.com/cszach/linux-on-lenovo-legion/blob/main/src/battery-conservation
- Software to customize keyboard illumination](https://github.com/4JX/L5P-Keyboard-RGB)
- [Software to modify fan speed curves](https://github.com/johnfanv2/LenovoLegionLinux)

# The brightness of the internal display does not change when I try to lower the intensity.
As of today, using kernel 6.6 and up, this problem should not occur. In any case, the problem should be solved by updating the Linux kernel. If this is not possible, you may want to consult the following guides:
- [cszach/linux-on-lenovo-legion#Brightness](https://github.com/cszach/linux-on-lenovo-legion?tab=readme-ov-file#brightness)
- [antony-jr/lenovo-legion5-15arh05-scripts/AMDGPUFIX](https://github.com/antony-jr/lenovo-legion5-15arh05-scripts/tree/main/AMDGPUFIX)

# Odd cases and more documentation
In the following repositories that I list, there are some extra cases that should be reviewed, and I would like to mention that they are great resources that have helped me over the years to install Linux:
- https://github.com/cszach/linux-on-lenovo-legion
- https://github.com/wottreng/Linux-Mint-on-Lenovo-Legion-5
- https://github.com/antony-jr/lenovo-legion5-15arh05-scripts