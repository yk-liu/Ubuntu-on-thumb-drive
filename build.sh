###################################################################
#                           IMPORTANT                             #
#                INSTALL ENGLISH VERSION!!!!!!!!!                 #
#           To Run This, go to build.sh directory                 #
#              (you can do it by dragging build.sh to terminal)   #
#                        sudo chmod 777 build.sh                  #
#                        sudo ./build.sh                          #
###################################################################

#联网之前关闭系统自动更新！！！！！
#如果报错先检查系统更新是否关闭
cd ~
read -p "You are now setting up the system ... Press any key to continue." var
read -p "You are now adding PPA ... Press any key to continue." var
#######################remove to speed up update#########
#remove useless build-in packages
sudo apt-get autoremove unity-lens-shopping -y
sudo apt-get remove unity-webapps-common -y
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install -y
sudo apt-get remove onboard deja-dup -y

#####################ADD PPA##########################
#for syspeek
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
#sublime(text editor)
sudo add-apt-repository ppa:webupd8team/sublime-text-3   

#LYX(latex)
# sudo add-apt-repository -y ppa:lyx-devel/release 

read -p "You are now beginning to UPDATE and UPGRADE ...This will take a while Press any key to continue." var

#optional 
#for LAMMPS(Molecule dynamic)
#sudo add-apt-repository ppa:gladky-anton/lammps

#TLP(power saving)(not useful)
# sudo add-apt-repository -y ppa:linrunner/tlp 
#for caffeine
# sudo add-apt-repository ppa:caffeine-developers/ppa

####################PPA UPDATE########################
sudo apt-get update
sudo apt-get upgrade

read -p "You are now UPDATED and UPGRADED Press any key to continue." var
read -p "You are now beginning to install essential packages Press any key to continue." var
#####################ESSENTIAL#########################

#vim
sudo apt-get install vim -y
#exfat format
sudo apt-get install exfat-fuse exfat-utils -y
#flash
sudo apt-get install flashplugin-installer -y
#syspeek
sudo apt-get install syspeek -y
#python pip (so you can install packages using pyCharm)
sudo apt-get install python-pip python-dev build-essential -y
pip install --upgrade pip
sudo pip install --upgrade virtualenv
#OpenGL
sudo apt-get install freeglut3-dev -y
#lsb (for COMSOL)
sudo apt-get install lsb -y
#synaptic and gdebi(package management)
sudo apt-get install synaptic -y
sudo apt-get install gdebi -y
#sublime(text editor)
sudo apt-get install sublime-text
#clipboard
sudo apt-get install clipit
#preload(preload app to speed up PC, good for non-SSD PC)
sudo apt-get install preload

# sublime setup
# https://packagecontrol.io/installation 安装package control
# https://github.com/seanliang/ConvertToUTF8/blob/master/README.zh_CN.md 安装中文支持

read -p "You are have installed essential packages Press any key to continue." var
read -p "You are now beginning to install research programs Press any key to continue." var
#firewall(who need that?)
# sudo apt-get install gufw -y
#for flash (OUTDATED)
#sudo add-apt-repository ppa:webupd8team/java
#TLP(not useful)
#sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-tools
#indicator-multiload
#sudo apt-get install indicator-multiload
#atom(NOT as good as sublime)
#sudo apt-get install atom -y
#caffeine(useless)
#sudo apt-get install caffeine -y
# unity folder
# http://unity-folders.exceptionfound.com/
#privacy protector
#http://www.florian-diesch.de/software/indicator-privacy/index.html
# #VLC(video player)(error may occur during installation)
# sudo apt-get install vlc -y
# #LYX(latex)
# sudo apt-get install lyx -y


########################RESEARCH###################
#LAMMPS and OVITO and VMD
sudo apt-get install ovito -y
sudo apt-get install lammps-daily -y
sudo apt-get install lammps-daily-doc -y
#VMD
# cd ~/Downloads
# sudo tar xzf VMD*
# see README


read -p "You are now beginning to install [deb] packages Press any key to continue." var
######################PACKAGES###################
cd #your location of the following packages
sudo dpkg -i sogoupinyin*
sudo tar xzf CLion* -C /opt/
sudo tar xzf pycharm* -C /opt/
cd /opt/pycharm*/bin
./pyhcarm.sh
cd /opt/clion*/bin
./clion.sh
cd ~

#read -p "You are now beginning to tweak system Press any key to continue." var
#####################TWEAK SYS######################
#close animation
sudo apt-get install compizconfig-settings-manager
##Run: ccsm &#In the effects category, untick all of the boxes.#In the accessibility tab, untick all of the boxes.
#indicator locate bottom(use ccsm)
# gsettings set com.canonical.Unity.Launcher launcher-position Bottom
#indicator on click minimize
# gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
#remove warnings
sudo rm /var/crash/*
# for media
sudo apt-get install ubuntu-restricted-extras openjdk-8-jdk -y

########################FINISHING UP####################################
#clean up
#sudo apt autoremove
sudo apt-get -y autoremove 
sudo apt-get -y autoclean 
sudo apt-get -y clean


################################MANUEL###################################
#
# gksu gedit /etc/default/apport
# 设置0表示禁用Apportw，或者1开启它。
# 你可以用下面的命令暂时关闭它：
# sudo service apport start force_start=1
# enabled=1
#把enabled=1改为enabled=0。保存并关闭文件。完成之后你就再也不会看到弹窗报告错误了。

#############MANUAL WORK########################
#到下载文件夹 双击deb包即可
#到ubuntu商店搜索unity tweak tools, lyx(latex), tweak tools,zim,texstudio(better latex) vlc
#   unity tweak tools ccsm关闭窗口动画
#先安装MATLAB
#再安装COMSOL


#关闭系统自动更新

###########THENE
sudo add-apt-repository ppa:noobslab/icons
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get install arc-theme
sudo apt-get install arc-icons

###########
#如果出现N: Ignoring file '20auto-upgrades.ucf-dist' in directory '/etc/apt/apt.conf.d/' as it has an invalid filename extension
# sudo rm -rf /etc/apt/apt.conf.d/20auto-upgrades.ucf-dist

###############
#安装完了sougou拼音输入法再去安装语言包
#安装完sougou之后 点右上角键盘图标 配置 增加输入法 勾选“非本语言输入法” 切到最后面找到搜狗

#sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
#sed is a stream editor. Allow me to explain the above command.

#-i is short for –in-place. That means sed will edit files in place.
#s/NoDispaly=true/NoDisplay=false means sed will search the NoDisplay=true regular expression and replace it with NoDisplay=false.
#/etc/xdg/autostart/*.desktop means all .desktop files under /etc/xdg/autostart directory.
