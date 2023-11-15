#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/robgloudemans/.zprofile
  eval "$(/usr/local/bin/brew shellenv)"
fi

# # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# # Update Homebrew recipes
brew update

# # Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# # Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'secret'; FLUSH PRIVILEGES;"

# # Install PHP extensions with PECL
pecl install imagick redis sqlsrv pdo_sqlsrv

# # Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# # Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# # Create a Sites directory
mkdir $HOME/Sites

# # Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# # Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
