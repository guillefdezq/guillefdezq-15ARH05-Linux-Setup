Just for the record, I: 
- Download the ArchLinux ISO and execute the commands from this reference so the USB doesn't beep when booting up:
  - https://wiki.archlinux.org/title/PC_speaker#Arch_Linux_live_ISO
  - `cat archlinux.iso | perl -pe 's/^play (([0-9]+ ?)+)/#lay \1/g' > archlinux-nobeep.iso`
- use Arch Install script with both boot and root partitions loaded up so the script can auto setup it.
- use the templates/options:
  - Desktop > GNOME
  - Nvidia (Propietary)
    - This doesn't really seem to work. Next setup, I'll try to install with "All open-source" and then install the `nvidia-beta` package, as it apparently works with ffmpeg for the h264_nvenc codec. (this sentence is not gramatically correct, but I know what I'm saying)
      - Follow indications on [the Arch wiki](https://wiki.archlinux.org/title/NVIDIA#Installation)
    - Note: in theory, you can make sure if you installed everything right if you got these packages: `nvidia nvidia-utils nvidia-settings`
  - PipeWire

> From here, better use the [post install script](https://github.com/lucidtyper/LucidTypist-s-15ARH05-Linux-Guide/blob/main/ArchPostInstall.sh).

- Quick install *yay*:
```bash
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si # copied from https://github.com/Jguer/yay
```
- Enable bluetooth (damn, why it is not enabled by default?):
```bash
sudo systemctl enable --now bluetooth
```
- Disable annoying beeps on TTY (prefer use the oneliner):
```bash
echo -e "blacklist pcspkr\nblacklist snd_pcsp" > sudo /etc/modprobe.d/nobeep.conf
```

```bash
sudo nano /etc/modprobe.d/nobeep.conf
# Inside nano:
blacklist pcspkr
blacklist snd_pcsp
```
- Install the packages:
  - [envycontrol](https://github.com/bayasdev/envycontrol) or [optimus-manager](https://github.com/Askannz/optimus-manager)
  - pamac-full & pamac-all (it's ~one of them~ the second one, but I'm lazy to figure it out)
  - ibus-libpinyin (yeah, I know a little of Chinese) and also fonts for Chinese display `noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra` (about [Noto](https://fonts.google.com/noto))
  - ntfs-3g drivers for NTFS partitions
  - touchegg (for the X11 gestures extension)
  - timeshift (for keeping a backup in case I mess up; this is a real life saver, I'm not joking, remember to enable cronie)
  - Microsoft Edge (yeah, I still need to get rid of this browser; again, I'm lazy)
  - Extensions Manager* (idk why it isn't included by default on the GNOME package)
  - Some CLI tools I always use & find useful:
    - `btop`: a pretty htop/top alternative with a beautiful user interface.
    - `fzf`: quick search everything in your file system.
    - `ncdu`: a ncurses disk utility.
    - `vim`: well, I don't like the standard vi.
    - `yt-dlp`: for downloading yt videos and others
  - Other things: `dccutil xournalpp dropbox megasync okular cpupower cpupower-gui`
```bash
yay -S envycontrol pamac-all ibus-libpinyin ntfs-3g touchegg timeshift extension-manager microsoft-edge-stable-bin noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra btop fzf ncdu vim --noconfirm
```