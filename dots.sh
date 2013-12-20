echo "Thorben's Dotfile Setup"
source sysinfo.sh
printProfile

#locate the dotfiles directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTSDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [[ $OS == mac ]] ; then
	echo "MACI - $DOTSDIR"
	$DOTSDIR/setup/osx/install.sh
else
	echo "System not supported..."
fi

echo "Setup Finished"

