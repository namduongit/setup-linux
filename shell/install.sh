# Initialize the interface folders for the current user.
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/.fonts
mkdir -p ~/.poshthemes

# ---------------------------------------- | Install Oh My Posh | ---------------------------------------- #
# Download the program's brain and rename it.
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh 
# Download the theme pack corresponding to the program
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O themes.zip
# Move that program to the area of the specific user who executed this command, and only that person can use it.
mv oh-my-posh ~/.local/bin/
# Grant execution rights to the program (important)
chmod +x ~/.local/bin/oh-my-posh
# Extract the themes into that folder.
unzip -o themes.zip -d ~/.poshthemes
# Remove zip file 
rm themes.zip
# You can manually configure the theme by editing the file ~/.bashrc.
# if command -v oh-my-posh &> /dev/null; then
#     # Trỏ đến thư mục theme mà chúng ta đã tạo thủ công
#     eval "$(oh-my-posh init bash --config ~/.poshthemes/file_theme.omp.json)"
# fi
# It will check if it can run and print all sdtrr and stdout, discarding whatever can be printed.
# If it runs, it will point to the theme and install it for the shell.
# You must install the Nerd Font font pack. Move .ttf file into .fonts
mv -f ~/Downloads/*.ttf ~/.fonts/
# Restart the system to recognize the font set.
# fc-cache -fv
# ---------------------------------------- | Install Oh My Posh | ---------------------------------------- #


# ---------------------------------------- | Install Ibus-Bamboo | ---------------------------------------- #
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart
# Set ibus-bamboo as the default input method
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"# ---------------------------------------- | Install Ibus-Bamboo | ---------------------------------------- #
# Fix the error can't connect ibus-bamboo if it doesn't run.
# ibus-daemon -drx
# Config 
# ibus-setup
# It is recommended that you choose Shift + ~ to select input method 3 or 4 for the most stability.
# ---------------------------------------- | Install Orchis Theme and Icon | ---------------------------------------- #
https://www.xfce-look.org/s/XFCE/p/1357889/
# Icon

# ---------------------------------------- | Install Orchis Theme and Icon | ---------------------------------------- #


# ---------------------------------------- | Install Graphics Card | ---------------------------------------- #
# Check the type of graphics card being used.
sudo driver-manager
lspci | grep -i nvidia
# You can download in the package using the command.
sudo apt install nvidia-driver-xxx
# Reboot the system
sudo reboot
# If you install Nvidia, check if it has been recognized yet.
nvidia-smi
# If the system has both Intel and Nvidia, then it should be installed additionally to switch the graphics card.
sudo apt install nvidia-prime
# Change nvidia or intel graphics card
sudo prime-select nvidia
sudo prime-select intel
# ---------------------------------------- | Install Graphics Card | ---------------------------------------- #



# ---------------------------------------- | Download software from third parties | ---------------------------------------- #
# Download the .zip or .tar.gz files and they are located in the downloads folder.
cd ~/Downloads
tar -xzf file-name.tar.gz
# Move to the /opt directory because this location is used to install software via other methods.
sudo mv file-name /opt/
# If you download Android Studio, you can follow these steps.
/opt/android-studio/bin/studio.sh
# Create Android Studio Shortcut
sudo nano /usr/share/applications/android-studio.desktop
# Paste this command line into the file you just created.
# [Desktop Entry]
# Version=1.0
# Type=Application
# Name=Android Studio
# Exec=/opt/android-studio/bin/studio.sh
# Icon=/opt/android-studio/bin/studio.png
# Categories=Development;IDE;
# Terminal=false
# ---------------------------------------- | Download software from third parties | ---------------------------------------- #



# ---------------------------------------- | Replace the Nitrosense software | ---------------------------------------- #
sudo apt update
# If the machine reports that there is no dotnet-sdk-7.0, you can replace it with dotnet-sdk-6.0 or another version.
sudo apt install dotnet-sdk-7.0 libhidapi-dev libusb-1.0-0-dev libsystemd-dev git build-essential
sudo apt install libcurl4-openssl-dev
sudo apt install libssl-dev
# Translate and install nbfc.
make
sudo make install
# List the machine models that you can apply. You can check the letter with one of the commands.
nbfc config list
sudo ec_probe
nbfc get-model-name
# 0: Acer Aspire E15
# 1: Acer Nitro AN515-54
# 2: Lenovo Y50-70
# ...
# Check if nbfc-linux supports this model.
ls /usr/share/nbfc/configs | grep -i your_model
# Apply according to the machine model
sudo nbfc config --apply "Acer Nitro AN515-57"
# Start the nbfc service
sudo nbfc start
# Allow to start with the system
sudo systemctl enable nbfc_service
# View information
nbfc status

# General control
sudo nbfc set -s 100
sudo nbfc set -a

# Control the private ratio
sudo nbfc set -s 100 -f 0   # Only CPU fan
sudo nbfc set -s 100 -f 1   # Only GPU fan

# Private automatic control
sudo nbfc set -a -f 0       # Only CPU fan
sudo nbfc set -a -f 1       # Only GPU fan
# ---------------------------------------- | Replace the Nitrosense software | ---------------------------------------- #


# ---------------------------------------- | Install Plank | ---------------------------------------- #
sudo apt update
sudo apt install plank
# Open the configuration interface
plank --preferences &
# Let Plank run with the system (auto start)
mkdir -p ~/.config/autostart
cp /usr/share/applications/plank.desktop ~/.config/autostart/
# ---------------------------------------- | Install Plank | ---------------------------------------- #
