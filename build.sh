echo "\n\
Before you run this scipt, make sure: \n\n\
1) You have installed the english version, if not, run \"gedit ~/.config/user-dirs.dirs\" in bash and replace names to english names, save, and run \"xdg-user-dirs-update\" in bash and restart.\n\
2) Shut down auto updates in \"settings-software and updates-updates\" and select \"never\" for auto-check etc.\n\
3) You run it with \"#sudo chmod 777 build.sh && sudo ./build.sh\"\n\n\
If not, press [ctrl]+c or +z to kill this script, or you may see errors.\n" 
cd ~
read -p "You are now setting up the system... Press any key to continue." var


echo "Removing redundant packages..."
sudo apt-get autoremove unity-lens-shopping webbrowser-app -y
sudo apt-get remove unity-webapps-common thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install onboard deja-dup -y


echo "Adding PPAs..."
#syspeek
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
#theme PPA 
sudo add-apt-repository ppa:noobslab/icons
sudo add-apt-repository ppa:noobslab/themes
#notepadqq
sudo add-apt-repository ppa:notepadqq-team/notepadqq
#typora
sudo add-apt-repository 'deb https://typora.io linux/'
#lyx
sudo add-apt-repository ppa:lyx-devel/release
# other denpendence
sudo add-apt-repository ppa:webupd8team/java



read -p "You are now ready to UPDATE and UPGRADE... This will take a while, make sure you have decent Internet or have chosen your mirror.\n\
To do that, in \"settings-software and updates-Ubuntu Software-download from\" drop list select Chinese mirrors. I chose aliyun.\n\
You can go and do that, I will be here waiting for you. When you come back, press any key to continue.\n\n\
!!And you might see a strange-looking UI about whether or not to upgrade your kernal or something. In my opinion, keep the way it is, don't upgrade.\n" var
sudo apt-get update
sudo apt-get upgrade


read -p "You are now beginning to install essential packages. Press any key to continue.\n" var
#vim
sudo apt-get install vim -y
#exfat format
sudo apt-get install exfat-fuse exfat-utils -y
#syspeek
sudo apt-get install syspeek -y
#pip (needed by pyCharm)
sudo apt-get install python-pip python-dev build-essential -y
pip install --upgrade pip
sudo pip install --upgrade virtualenv
#synaptic and gdebi(package management)
sudo apt-get install synaptic -y
sudo apt-get install gdebi -y
#clipboard
sudo apt-get install clipit
#VLC(video player)(error may occur during installation)
sudo apt-get install vlc -y
#Themes
sudo apt-get install arc-theme -y
sudo apt-get install arc-icons -y
sudo apt-get install ultra-flat-icons -y
sudo apt-get install flatabulous-theme -y
# LATEX
sudo apt-get install texlive texstudio  -y # for latex 
sudo apt-get install texlive-full -y  # for full texlive packages
sudo apt-get install xzdec     -y    # for tlmgr
sudo apt-get install lyx  -y #lyx
#notepadqq
sudo apt-get install notepadqq -y
#git
sudo apt-get install git -y
# zsh (needs git)
sudo apt-get install zsh  -y
sudo chsh -s /bin/zsh
# oh my zsh
# optinal
#typora
sudo apt-get install typora
#restricted-extras for media (slow)
sudo apt-get install ubuntu-restricted-extras openjdk-8-jdk -y

echo "Final tweaking..."
#Close animation
sudo apt-get install compizconfig-settings-manager
read -p "Go on, open ccsm to close animations. In ccsm, 1)In the effects category, untick all of the boxes.\n2) In the accessibility tab, untick all of the boxes.\n\
When you come back, press any key to continue." var
# indicator on click minimize
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true


echo "cleaning up..."
sudo apt-get -y autoremove 
sudo apt-get -y autoclean 
sudo apt-get -y clean


echo "some manual work is demanded\n\
A update error\n\
when you apdate, you might see somethings like this: \n\
N: Ignoring file '20auto-upgrades.ucf-dist' in directory '/etc/apt/apt.conf.d/' as it has an invalid filename extension\n\
just run \"sudo rm -rf /etc/apt/apt.conf.d/20auto-upgrades.ucf-dist\"\n\
B remove warnings\n\
run:\"sudo rm /var/crash/*\"\
run:\"cd /etc/default/ && sudo sed \"s/enabled=1/enabled=0/g -i apport\"\
There will no more bug reports\n\
C more softwares\n\
search in Ubuntu app store: unity tweak tools, tweak tools, texstudio\n\
serach notepadqq, zsh, oh-my-zsh and add all the things you added in ~/.bashrc such as \"export PATH=\"/home/water/anaconda3/bin:\$PATH\"\"\n\
to the end of ~/.zshrc such as \
# added by Anaconda3 4.4.0 installer\
export PATH=\"/home/water/anaconda3/bin:\$PATH\"\
addition note for zsh: sudo chsh -s /bin/zsh\
D sunpinyin configuration (NO NEED OF SOUGO)\n\
# keyborad im system: fcitx\
# fcitx settings: on your status bar, upper right corner\
# add language（+ sign on the lower left) untick “only show current language”\
# find sunpinyin （look for column 2）\
# default hot key for CN-EN IM switch is [shift]\
# if you want it so bad, install sougou first\
\n\
#ZSH theme\
vi ~/.zshrc\
#ZSH_THEME=\"af-magic\" and goto edit-profileperference-textcolor change that to #77B33A\
E(optional)\n\
#sublime(text editor)\
sudo apt-get install sublime-text\
# sublime setup\
# https://packagecontrol.io/installation 安装package control\
# https://github.com/seanliang/ConvertToUTF8/blob/master/README.zh_CN.md 安装中文支持\
#lsb (for COMSOL)\
sudo apt-get install lsb -y\
#preload(preload app to speed up PC, good for non-SSD PC)\
sudo apt-get install preload\n\"


export LANG=en_US
xdg-user-dirs-gtk-update
	  
read -p "You are ready to install [deb] packages. Press any key to continue." var
cd - #or replace "-" with your location of the packages
cd debs 
sudo tar xzf CLion* -C /opt/
sudo tar xzf pycharm* -C /opt/
cd /opt/pycharm*/bin
./pycharm.sh
cd /opt/clion*/bin
./clion.sh
cd ~
echo "more are availible in /debs folder, use gdebi pakage to install deb packages"

#this solves errors with wps
sudo unzip wps_symbol_fonts.zip -d /usr/share/fonts/wps-office