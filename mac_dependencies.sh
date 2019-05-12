for x in snappy leveldb gflags glog szip hdf5 lmdb opencv;
do
    brew uninstall $x;
    brew install --fresh -vd $x;
done
brew uninstall --force protobuf; brew install --build-from-source --with-python -vd protobuf
brew uninstall boost boost-python; brew install --build-from-source -vd boost boost-python

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
