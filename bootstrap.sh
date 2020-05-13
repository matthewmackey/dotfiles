#!/bin/bash

PACKAGES_TO_INSTALL=(
cinnamon
google-chrome-stable
Also install: R Studio (from .deb)
)

#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
setup_trello() {
  curl -L -o /tmp/trello.zip https://github.com/danielchatfield/trello-desktop/releases/download/v0.1.1/Trello-linux-0.1.1.zip

  sudo unzip /tmp/trello.zip -d /opt/trello
  
  cat > ~/.local/share/applications/trello.desktop <<EOF
[Desktop Entry]
Name=Trello
Exec=/opt/trello/Trello
Terminal=false
Type=Application
Icon=/opt/trello/resources/app/static/Icon.ico
EOF

}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
setup_chrome() {
  ln -s ~/mmackey/files/chrome-mmackey.desktop ~/.local/share/applications/chrome-mmackey.desktop
}


#------------------------------------------------------------------------------
# Vagrant recommends NOT installing distro-managed packages and using their package
# directly
#------------------------------------------------------------------------------
setup_vagrant() {
  cd ~/Downloads/debian
  curl -O https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb
  sudo dpkg -i vagrant_1.8.5_x86_64.deb
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
setup_virtualbox() {
  echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install virtualbox-5.1
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
setup_python() {
  # Install python-build (plugin for pyenv for installing python versions)
  # Setup dependencies required to build & install Python versions
  #  -> from: https://github.com/yyuu/pyenv/wiki
  sudo apt-get install -y \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils

  # Install python-build
  cd /tmp
  [ -d pyenv ] && rm -rf pyenv
  git clone git://github.com/yyuu/pyenv.git
  cd pyenv/plugins/python-build 
  sudo PREFIX=/opt/python-build /bin/bash -c './install.sh -v'
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
setup_python_version() {

  # When I tried running this for 2.7.12 on 18.04,
  local version=$1

  /opt/python-build/bin/python-build "$version" ~/pythons/"$version"
  ~/pythons/"$version"/bin/pip install virtualenvwrapper
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
install_docker() {
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt-get update

  sudo apt-get purge lxc-docker

  sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    ca-certificates \
    apt-transport-https \
    docker.io

  sudo usermod -aG docker mmackey
  echo "Note: you must logout and log back in to be able to run docker commands without sudo"
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
install_docker_compose() {
  COMPOSE_VERSION=1.9.0
  INSTALL_DEST=/usr/local/bin/docker-compose

  sudo curl -L \
    -o "$INSTALL_DEST" \
    https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m`
  sudo chmod +x "$INSTALL_DEST"
  sudo curl -L \
		-o /etc/bash_completion.d/docker-compose \
	  https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
}


#------------------------------------------------------------------------------
# The Squirrel SQL jar was manually downloaded via sourceforge and then the 'java -jar'
# command bleow was run.  I then selected the install dir (in /opt) and a bunch of plugins
# to install via the installer GUI.  At the end of the install, it asked if I wanted to 
# generate an automated installer script.  I said "Yes" and 
# squirrel_sql_auto_installer_script.xml was what was output.
#
#  TODO: figure out how to use the auto_installer XML file to run an
#        automated install
#
# NOTE: it seems that Squirrel SQL stores some config / prefs in: ~/.java/.userPrefs/prefs.xml 
#------------------------------------------------------------------------------
install_squirrel_sql() {
 # Installer XML file: 
 #   files/squirrel_sql_auto_installer_script.xml

 #curl -O squirrel.jar http://*
  sudo java -jar squirrel.jar
  cp ~/mmackey/files/squirrel_sql.desktop ~/.local/share/applications/
  echo "NOTE: it seems that Squirrel SQL stores some config / prefs in: ~/.java/.userPrefs/prefs.xml"


  # The following section is pseudocode and would need to be formalized:
  # http://jtds.sourceforge.net/
#  cd /opt/squirrel-XXXX
#  sudo mkdir downloaded_drivers
#  sudo curl -O jtds.zip http://downloads.sourceforge.net/project/jtds/jtds/1.3.1/jtds-1.3.1-dist.zip
#  unzip jtds.zip -d jtds
#  echo "NOTE: you must setup the MSSQL driver in the Squirrel GUI to use this driver"
#  echo "      the jdbc URL is of the form: jdbc:jtds:sqlserver://127.0.0.1:41433/<DB_NAME>"
#  echo "      in the GUI you must set the driver Class name as: net.sourceforge.jtds.jdbc.Driver"
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
install_ambient_noise() {
	sudo add-apt-repository ppa:costales/anoise
	sudo apt-get update
	sudo apt-get install anoise
}

#------------------------------------------------------------------------------
# default remmina version in 16.04 repos had segfault bug so updated
# to latest version using PPA
#------------------------------------------------------------------------------
install_remmina() {
  sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
  sudo apt-get update
  sudo apt-get install remmina remmina-plugin-rdp libfreerdp-plugins-standard
}


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
setup_roxterm() {
  if [ -e ~/.config/roxterm.sourceforge.net ]; then
    mv ~/.config/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net.ORIG
  fi
  ln -s ../mmackey/files/.config/roxterm.sourceforge.net ~/.config/roxterm.sourceforge.net
}


#------------------------------------------------------------------------------
# Power applet in Settings throws segfault when launched; below is fix
# that was modified from:
#   https://github.com/linuxmint/Cinnamon/issues/5410
#------------------------------------------------------------------------------
fix_cinnamon_power_applet() {
  sudo sed -i \
    '101s/Client()/Client.new()/' \
    /usr/share/cinnamon/cinnamon-settings/modules/cs_power.py
}

#------------------------------------------------------------------------------
# From: http://ubuntuhandbook.org/index.php/2014/04/enable-hibernate-ubuntu-14-04/
#       http://askubuntu.com/questions/768136/how-can-i-hibernate-on-ubuntu-16-04
#       http://ubuntuhandbook.org/index.php/2016/05/ubuntu-16-04-shutdown-hibernate-your-laptop-lid-closed/
#------------------------------------------------------------------------------
enable_hibernate() {
  # enable hibernate on system (probably does multiple things but one for sure is it enables
  # an hibernate option in Cinnamon "Quit" gui)
  sudo ln -s ~/mmackey/files/enable-hibernate.pkla /etc/polkit-1/localauthority/50-local.d/enable-hibernate.pkla
  sudo service polkitd restart

  # Enable hibernate on lid shut
  sudo sed -i 's/.*HandleLidSwitch=.*/HandleLidSwitch=hibernate/' /etc/systemd/logind.conf
  sudo systemctl restart systemd-logind.service
}

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
install_adobe_air() {
	# Install Adobe AIR first (2.6 was latest Linux-supported version)
	## Add Updates repo to APT config (figured out by trial and error for pkg list below):
	#echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main universe" >> /etc/apt/sources.lit
	sudo apt-get update

	# Packages to install were from:
  #  https://www.reddit.com/r/linux_gaming/comments/4pd4nz/adobe_air_on_ubuntu_1604/
	sudo apt-get install libxt6:i386 libnspr4-0d:i386 libgtk2.0-0:i386 libstdc++6:i386 \
		libnss3-1d:i386 libnss-mdns:i386 libxml2:i386 libxslt1.1:i386 \
		libcanberra-gtk-module:i386 gtk2-engines-murrine:i386

  # To avoid error:
  #  "Adobe AIR could not be installed. Install either Gnome Keyring or KDE KWallet
  #   before installing Adobe AIR."
	sudo ln -s /usr/lib/x86_64-linux-gnu/libgnome-keyring.so.0 /usr/lib/libgnome-keyring.so.0
	sudo ln -s /usr/lib/x86_64-linux-gnu/libgnome-keyring.so.0.2.0 /usr/lib/libgnome-keyring.so.0.2.0

	AIR_INSTALLER=~/Downloads/tools/AdobeAIRInstaller.bin
	curl -L -o $AIR_INSTALLER http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin
	chmod +x $AIR_INSTALLER

  # Note:
  #  * you will see a lot of Gtk-related errors/warnings; this is ok; just wait & installer
  #    will load
	$AIR_INSTALLER

	sudo rm /usr/lib/libgnome-keyring.so.0
	sudo rm /usr/lib/libgnome-keyring.so.0.2.0
}

