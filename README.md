# macOS Setup

Quickly configure a new Mac with the tools and settings used by this project.

## Setup

1. Install [Homebrew](https://brew.sh/) if it is not already installed:

	```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```

2. Clone the repository:

	```sh
	git clone <repository-url> ~/macos-setup
	cd ~/macos-setup
	```

3. Review the setup scripts and make any necessary changes.

4. Run the setup script:

	```sh
	./setup.sh
	```

	If macOS blocks execution, make it executable first:

	```sh
	chmod +x setup.sh
	```

Restart Terminal or your Mac when setup finishes so all changes take effect.