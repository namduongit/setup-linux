# Linux Setup - README.md

## Table of Contents

1. [Prepare User Folders](#prepare-user-folders)
2. [Install Oh My Posh](#install-oh-my-posh)
3. [Install IBus-Bamboo](#install-ibus-bamboo)
4. [Install Orchis Theme and Icons](#install-orchis-theme-and-icons)
5. [Install Graphics Card Drivers](#install-graphics-card-drivers)
6. [Download Third-Party Software](#download-third-party-software)
7. [Replace NitroSense with NBFC-Linux](#replace-nitrosense-with-nbfc-linux)
8. [Install Plank Dock](#install-plank-dock)
9. [System Tree Structure](#system-tree-structure)
10. [Basic Notes About Directories](#basic-notes-about-directories)

---
## You can refer to the shell directory for more information.
---

---

## Prepare User Folders

```bash
mkdir -p ~/.themes ~/.icons ~/.fonts ~/.poshthemes
```

---

## Install Oh My Posh

```bash
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh 
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O themes.zip
mv oh-my-posh ~/.local/bin/
chmod +x ~/.local/bin/oh-my-posh
unzip -o themes.zip -d ~/.poshthemes
rm themes.zip
mv -f ~/Downloads/*.ttf ~/.fonts/
```

> Edit \~/.bashrc to add your theme:

```bash
if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init bash --config ~/.poshthemes/YOUR_THEME.omp.json)"
fi
```

---

## Install IBus-Bamboo

```bash
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']"
gsettings set org.gnome.desktop.input-sources sources "[(\'xkb\', \'us\'), (\'ibus\', \'Bamboo\')]"
```

> Chạy `ibus-daemon -drx` nếu không thấy hoạt động.

---

## Install Orchis Theme and Icons

* Truy cập: [Orchis XFCE Theme](https://www.xfce-look.org/s/XFCE/p/1357889/)
* Truy cập: [Tela Icon theme](https://www.pling.com/p/1279924/)
* Cài Themes theo hướng dẫn của trang đó.

---

## Install Graphics Card Drivers

```bash
sudo driver-manager
lspci | grep -i nvidia
sudo apt install nvidia-driver-xxx
sudo reboot
nvidia-smi
sudo apt install nvidia-prime
sudo prime-select nvidia  # hoặc intel
```

---

## Download Third-Party Software

```bash
cd ~/Downloads
tar -xzf file-name.tar.gz
sudo mv file-name /opt/
/opt/android-studio/bin/studio.sh
```

Tạo shortcut:

```bash
sudo nano /usr/share/applications/android-studio.desktop
```

Nội dung:

```
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Exec=/opt/android-studio/bin/studio.sh
Icon=/opt/android-studio/bin/studio.png
Categories=Development;IDE;
Terminal=false
```

---

## Replace NitroSense with NBFC-Linux

```bash
sudo apt update
sudo apt install dotnet-sdk-7.0 libhidapi-dev libusb-1.0-0-dev libsystemd-dev git build-essential
sudo apt install libcurl4-openssl-dev libssl-dev
make
sudo make install
ls /usr/share/nbfc/configs | grep -i nitro
sudo nbfc config --apply "Acer Nitro AN515-57"
sudo nbfc start
sudo systemctl enable nbfc_service
nbfc status
```

### Control Fans:

```bash
sudo nbfc set -s 100             # All fans
sudo nbfc set -s 100 -f 0        # CPU fan
sudo nbfc set -s 100 -f 1        # GPU fan
sudo nbfc set -a -f 0            # Auto CPU
sudo nbfc set -a -f 1            # Auto GPU
```

---

## Install Plank Dock

```bash
sudo apt update
sudo apt install plank
plank --preferences &
mkdir -p ~/.config/autostart
cp /usr/share/applications/plank.desktop ~/.config/autostart/
```

---

## System Tree Structure

```
/ (root)
├── bin/                    -> Lệnh thiết yếu cho người dùng (ls, cp, ...)
├── opt/                    -> Phần mềm bên ngoài (.zip .tar.gz)
├── sbin/                   -> Lệnh quản trị (reboot, shutdown, ...)
├── etc/                    -> Cấu hình hệ thống
├── dev/                    -> Thiết bị phần cứng
├── proc/                   -> Tiến trình đang chạy
├── var/                    -> Logs, cache...
├── tmp/                    -> File tạm
├── lib/                    -> Thư viện cho /bin /sbin
├── boot/                   -> File khởi động hệ thống
├── mnt/                    -> Gắn ổ đĩa ngoài
├── usr/
│   ├── bin/                -> Chương trình người dùng
│   ├── lib/                -> Thư viện
│   └── share/              -> Dữ liệu chung (fonts, icons...)
└── home/
    └── your_username/
        ├── Desktop/
        ├── Documents/
        ├── Downloads/
        └── .local/bin/     -> Phần mềm bạn tự cài
```

---

## Basic Notes About Directories

* `~/` : Thư mục home cá nhân
* `/`  : Gốc hệ thống
* `/opt` : Nên đặt phần mềm tải thủ công (VD: Android Studio, VS Code bản .tar.gz)
* `~/.local/bin/` : Cài phần mềm chỉ dùng cho người dùng hiện tại (như oh-my-posh)
