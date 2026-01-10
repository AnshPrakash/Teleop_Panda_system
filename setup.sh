
# Install Ros humble pacakages -> creta "ros_humble" conda environment
# bash ./dependencies/install_ros_humble.sh


# to make sure script runs conda free
env -i \
  HOME="$HOME" \
  USER="$USER" \
  LOGNAME="$LOGNAME" \
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
  bash --noprofile --norc ./dependencies/install_venv.sh



# CUDA and locale environment variables
export CUDA_HOME=/usr/local/cuda-12.6
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH:/home/vignesh/.local/lib
export LC_NUMERIC=en_US.UTF-8

