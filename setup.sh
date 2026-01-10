
# Install Ros humble pacakages -> creta "ros_humble" conda environment
bash ./dependencies/install_ros_humble.sh




# CUDA and locale environment variables
export CUDA_HOME=/usr/local/cuda-12.6
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH:/home/vignesh/.local/lib
export LC_NUMERIC=en_US.UTF-8

# Install libfranka

# Install franka description
# bash ./dependencies/install_franka_description.sh



# Install franka ros2
# bash ./dependencies/install_franka_ros2.sh
