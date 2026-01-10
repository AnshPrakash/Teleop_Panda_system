
# Install Ros humble pacakages -> creta "ros_humble" conda environment
bash ./dependencies/install_ros_humble.sh




echo '' >> ~/.bashrc
echo '# CUDA and locale environment variables' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda-12.6' >> ~/.bashrc
echo 'export PATH=$CUDA_HOME/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH:/home/vignesh/.local/lib' >> ~/.bashrc
echo 'export LC_NUMERIC=en_US.UTF-8' >> ~/.bashrc


# Install franka description
# bash ./dependencies/install_franka_description.sh

# Install libfranka


# Install franka ros2
# bash ./dependencies/install_franka_ros2.sh
