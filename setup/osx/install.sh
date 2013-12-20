echo "system setup for osx..."

xcodetools() {
	XCODECMD="$(pkgutil --pkg-info=com.apple.pkg.DeveloperToolsCLI)"
	if [[ $XCODECMD == "" ]] ; then
		echo "XCode Command Line Utils are required."
		echo "Please install from https://developer.apple.com/downloads/index.action?=command%20line%20tools"
		exit -1
	else
		echo "XCode Command Line Tools installed"
	fi
}

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

xcodetools
homebrew