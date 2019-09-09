# PSEUDOCODE - DO NOT RUN

# Decide where
CS_INSTALL_DIR="/opt/code-server"
# or CS_INSTALL_DIR="~/.code-server"

# Become sudo
sudo su

# Clone repo
git clone https://repo.git
cd repo

# Unpack stuff
tar -xzf executables.tar.gz ./bin

# Move to /opt/
# mv ~/code-server $CS_INSTALL_DIR
# chown -R $(whoami) $CS_INSTALL_DIR

# Ensure it's executable
chmod +x $CS_INSTALL_DIR/bin/code-server
if [ -f $CS_INSTALL_DIR/bin/code-server2 ]; then
    chmod +x $CS_INSTALL_DIR/bin/code-server2
fi

# Install extension via VSIX - REQUIRE CODE 2 PREVIEW
for extension in $CS_INSTALL_DIR/vsix/*
do
  $CS_INSTALL_DIR/bin/code-server2 --extensions-dir $CS_INSTALL_DIR/extensions --install-extension --force $CS_INSTALL_DIR/vsix/$extension
done

# Install Git 2.18 via RHEL Software Collection
yum-config-manager --enable rhel-server-rhscl-7-rpms -y && yum install rh-git218 -y

# Back to normal user
exit

# Set the user shell to load the autoloader
if [ -n "$ZSH_VERSION" ]; then
   # assume Zsh
   SHELL_FILE=".zshrc"
elif [ -n "$BASH_VERSION" ]; then
   # assume Bash
   SHELL_FILE=".bashrc"
else
   # default
   SHELL_FILE=".bashrc"
fi

# Install in the init
echo '# Code Server init' >>$HOME/$SHELL_FILE
echo 'export CS_PATH="$CS_INSTALL_DIR"' >>$HOME/$SHELL_FILE
echo 'source $CS_PATH/code-autoload' >>$HOME/$SHELL_FILE
echo '# Sets the a custom password. Requires -P [--password] argument' >>$HOME/$SHELL_FILE
echo '# PASSWORD="P4$$w0Rd"' >>$HOME/$SHELL_FILE