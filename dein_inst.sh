INSTALL_DIR=$HOME/.cache/dein
if [ -e $INSTALL_DIR ]; then
	exit 0
fi

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
sudo apt-get install -y curl
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $INSTALL_DIR

