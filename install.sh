# PSEUDOCODE - DO NOT RUN

# Decide where 
# TODO: add prompt
CS_REPO="https://github.com/elgandoz/mg-code-server.git"
CS_INSTALL_DIR="/opt/code-server"
# or CS_INSTALL_DIR="~/.code-server"

# Become sudo, bringing the installation vars
sudo CS_REPO=$CS_REPO CS_INSTALL_DIR=$CS_INSTALL_DIR su

# Clone repo
git clone --depth=1 $CS_REPO $CS_INSTALL_DIR
cd $CS_INSTALL_DIR

# Unpack binaries
mkdir -p $CS_INSTALL_DIR/bin
tar -xzf $CS_INSTALL_DIR/releases/code-server-releases.tar.gz -C $CS_INSTALL_DIR/bin/

# Ensure right ownership
chown -R $(whoami). $CS_INSTALL_DIR .

# Ensure it's executable
chmod +x $CS_INSTALL_DIR/bin/*

# Temporary source the required libstdc++ for CENTOS/RHEL 7
export LD_LIBRARY_PATH=$CS_INSTALL_DIR/lib64:$LD_LIBRARY_PATH
# Install extension via VSIX - REQUIRE CODE 2 PREVIEW
mkdir -p $CS_INSTALL_DIR/extensions
for extension in $CS_INSTALL_DIR/vsix/*
do
  $CS_INSTALL_DIR/bin/code-server2 --install-extension $CS_INSTALL_DIR/$extension --force --extensions-dir $CS_INSTALL_DIR/extensions
done

# Install Git 2.18 via RHEL Software Collection, if not already
if ! rpm -q rh-git218
then
   yum-config-manager --enable rhel-server-rhscl-7-rpms -y && yum install rh-git218 -y
fi

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
echo '\n\n# Code Server init' >>$HOME/$SHELL_FILE
echo 'export CS_PATH="'$CS_INSTALL_DIR'"\nsource $CS_PATH/code-autoload' >>$HOME/$SHELL_FILE
echo '# Sets code-server custom password. Requires -P [--password] argument' >>$HOME/$SHELL_FILE
echo '# PASSWORD="P4$$w0Rd"' >>$HOME/$SHELL_FILE

