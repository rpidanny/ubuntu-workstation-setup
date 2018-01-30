# pre-installation actions
echo "pre-installation actions"
sudo apt-get install linux-headers-$(uname -r)

# install cuda
echo "Installing cuda"
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update && sudo apt-get install cuda

# install cuda performance upgrade
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb

# install cudnn
sudo dpkg -i libcudnn6_6.0.21-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn6-dev_6.0.21-1+cuda8.0_amd64.deb

# install cuda profile tool interface
# sudo apt-get install cuda-command-line-tools

# setting env variables
echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH='/usr/local/cuda/lib64'
export CUDA_HOME=/usr/local/cuda
" >> $HOME/.zshrc