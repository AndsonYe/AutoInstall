#!/bin/bash

#This script is used for installing and configuring customized software for a newlly installed Ubuntu. Some operations are based on the backup files.
#Put cuda installation package in Downloads before running this script

#Necessary software for daily use.
#install chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#sudo apt-get update
#sudo apt-get install google-chrome-stable -y

#install latex
#sudo apt-get install texlive texlive-science texlive-pictures -y

#install rar, git gnome and some dependencies
sudo apt-get install rar git libgnome2-bin ctags build-essential cmake python-dev python3-dev libx11-dev libxtst-dev ruby-dev liblua5.1-0-dev libgtk2.0-dev libncurses5-dev -y

#vim configuration
#git clone https://github.com/wklken/k-vim.git
#unzip vim.zip -d $HOME/
#mv vim/.[!.]* $HOME/
#rm -rf vim

#tmux configuration, can use vim like operation after go to scroll mode
sudo apt-get install tmux -y
echo "unbind C-b">>$HOME/.tmux.conf
echo "set -g prefix C-a">>$HOME/.tmux.conf
echo "bind -n M-Left select-pane -L">>$HOME/.tmux.conf
echo "bind -n M-Right select-pane -R">>$HOME/.tmux.conf
echo "bind -n M-Up select-pane -U">>$HOME/.tmux.conf
echo "bind -n M-Down select-pane -D">>$HOME/.tmux.conf
echo "set -g monitor-activity on">>$HOME/.tmux.conf
echo "set -g visual-activity on">>$HOME/.tmux.conf
echo "set-window-option -g window-status-current-bg yellow">>$HOME/.tmux.conf
echo "set-option -g mouse-select-pane on">>$HOME/.tmux.conf
echo "set -g status-bg black">>$HOME/.tmux.conf
echo "set -g status-fg white">>$HOME/.tmux.conf
echo "set -g pane-active-border-fg colour129">>$HOME/.tmux.conf
echo "set -g pane-border-fg colour93">>$HOME/.tmux.conf
echo "set -g history-limit 90000">>$HOME/.tmux.conf
echo "bind D source-file ~/.tmux/dev">>$HOME/.tmux.conf
echo "setw -g mode-keys vi">>$HOME/.tmux.conf
echo "bind-key -t vi-copy 'v' begin-selection">>$HOME/.tmux.conf
echo "bind-key -t vi-copy 'y' copy-selection">>$HOME/.tmux.conf
echo "bind -t vi-copy y copy-pipe "xclip -sel clip -i"">>$HOME/.tmux.conf

#install skype
#sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#sudo apt-get update
#sudo apt-get install skype -y
#sudo apt-get install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 sni-qt:i386 -y

#install teamviewer
#wget http://download.teamviewer.com/download/teamviewer_i386.deb
#sudo dpkg --add-architecture i386
#sudo apt-get update
#sudo dpkg -i teamviewer_i386.deb
#sudo apt-get install -f -y

#install Nvidia driver, CUDA and CUDNN
#sudo add-apt-repository ppa:xorg-edgers/ppa -y
#sudo apt-get update
#sudo apt-get install nvidia-346 -y
##CUDA installation package should exist in downloads
#sudo dpkg -i $HOME/Downloads/cuda-repo-ubuntu1404-7-0-local_7.0-28_amd64.deb
#sudo apt-get update
#sudo apt-get install cuda -y

#echo "export PATH=/usr/local/cuda-7.0/bin:\$PATH">>$HOME/.bashrc
#echo "export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:\$LD_LIBRARY_PATH">>$HOME/.bashrc
#source $HOME/.bashrc
#mkdir $HOME/CUDA
#cuda-install-samples-7.0.sh $HOME/CUDA

#tar xvf $HOME/Downloads/cudnn-6.5-linux-x64-v2.tgz -C ~/CUDA
#echo "export LD_LIBRARY_PATH=$HOME/CUDA/cudnn-6.5-linux-x64-v2:\$LD_LIBRARY_PATH">>~/.bashrc
#sudo ln -s $HOME/CUDA/cudnn-6.5-linux-x64-v2/*.h /usr/local/cuda/include
#sudo ln -s $HOME/CUDA/cudnn-6.5-linux-x64-v2/*.so* /usr/local/cuda/lib64
#source $HOME/.bashrc

#install opencv
#sudo apt-get update
#sudo apt-get remove ffmpeg x264 libx264-dev
#sudo apt-get install ocl-icd-libopencl1 build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils
#mkdir $HOME/opencv && cd $_ && wget -O OpenCV-2.4.10.zip http://fossies.org/linux/misc/opencv-2.4.10.zip && unzip Opencv-2.4.10.zip
#mkdir $HOME/opencv/Opencv-2.4.10/Release && cd $_ 
## cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_TIFF=ON -D BUILD_EXAMPLES=ON -D CUDA_GENERATION=Kepler -D BUILD_NEW_PYTHON_SUPPORT=ON ..
#cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D CUDA_ARCH_BIN="3.0" -D BUILD_NEW_PYTHON_SUPPORT=ON ..
#make -j $(nproc)
#sudo make install
#sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
#echo "export PYTHONPATH=/usr/local/lib/python2.7/site-packages:\$PYTHONPATH">>$HOME/.bashrc
#sudo ldconfig
#sudo apt-get install python-opencv

#install caffe
#sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler -y
#sudo apt-get install --no-install-recommends libboost-all-dev -y
#sudo apt-get install libatlas-base-dev -y
#sudo apt-get install the python-dev python-pip -y
#sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev -y
#git clone https://github.com/BVLC/caffe.git $HOME/github/caffe
#for req in $(cat $HOME/github/caffe/python/requirements.txt); do sudo pip install $req; done
#pip install easydict protobuf

#Anaconda installation, not suggested
#bash $HOME/DeepLearning/Anaconda-2.3.0-Linux-x86_64.sh
#echo "export LD_LIBRARY_PATH=$HOME/anaconda/lib:\$LD_LIBRARY_PATH">>~/.bashrc
#echo "export PYTHONPATH=$HOME/github/caffe/python:\$PYTHONPATH">>~/.bashrc
#source $HOME/.bashrc
#echo "Now install the Matlab first manually and then finish the caffe configuration and make"
