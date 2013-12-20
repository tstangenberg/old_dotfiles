echo "system setup for osx..."

MY_FULL_NAME="Thorben Stangenberg"
MY_EMAIL="thorben@stangenberg.net"

xcodetools() {
	# just check if gcc is available...
	GCC="$(which gcc)"
	if [[ $GCC == "" ]] ; then
		echo "XCode Command Line Utils are required."
		echo "Please install from https://developer.apple.com/downloads/index.action?=command%20line%20tools"
		exit -1
	else
		echo "XCode Command Line Tools installed / GCC available"
	fi
}

# Install Homebrew - http://brew.sh/
homebrew() {
	BREW="$(which brew)"
	if [[ $BREW == "" ]] ; then
		ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	fi
	echo "Homebrew installed ... starting update ..."
	brew update
	brew doctor
	# sudo chown -R thorben:admin /usr/local
}

# installs the given formula (1st parameter) with brew
brew_install() {
	FORMULA=$1
	CHECK=$(brew info $FORMULA)
	if [[ $CHECK == *Not* ]] ; then		
		brew install $FORMULA
	fi
}

# Install Git - http://git-scm.com/
git() {
	brew_install "git"
	/usr/local/bin/git config --global user.name $MY_FULL_NAME
	/usr/local/bin/git config --global user.email $MY_EMAIL
}

# Install cask addon for brew - https://github.com/tstangenberg/homebrew-cask
brew_cask() {	
	if [[ $(brew tap) != *tstangenberg/cask* ]] ; then
		brew tap tstangenberg/cask
	fi
	if [[ $(brew tap) != *caskroom/versions* ]] ; then
		brew tap caskroom/versions
	fi
	brew_install "brew-cask"
}

# installs the given formula (1st parameter) with brew cask
cask_install() {
	FORMULA=$1
	CHECK=$(brew cask info $FORMULA)
	if [[ $CHECK == *Not* ]] ; then		
		brew cask install $FORMULA
	fi
}

# Install chrome browser - https://www.google.com/chrome
chrome() {
	cask_install "google-chrome"
}

# Install vagrant - https://www.vagrantup.com
vagrant() {
	cask_install "vagrant"
}

# Install Alfred - http://www.alfredapp.com/
alfred() {
	cask_install "alfred"
}

# Installs the multi purpose editor sublime-text
editor() {
	cask_install "sublime-text3"
}

# Installs the download manager speedtao
download_manager() {
	cask_install "speedtao"
}


xcodetools
homebrew
git
brew_cask
chrome
vagrant
alfred
editor
download_manager
