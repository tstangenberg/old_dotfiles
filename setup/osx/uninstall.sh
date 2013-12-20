
xcode_tools(){
	# just forget that the package is there...
	sudo pkgutil --forget com.apple.pkg.DeveloperToolsCLI
}

homebrew() {
	cd `brew --prefix`
	rm -rf Cellar
	brew prune
	rm `git ls-files`
	rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions
	rm -rf .git
	rm -rf ~/Library/Caches/Homebrew
}

homebrew
xcode_tools