source ./dependencies/deactivate_conda.sh -verbose
unset CMAKE_PREFIX_PATH

# Activate virtual environment
source ./venv/bin/activate

# CUDA and locale environment variables
export CUDA_HOME=/usr/local/cuda-12.6
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH:/home/vignesh/.local/lib
export LC_NUMERIC=en_US.UTF-8

source /opt/ros/humble/setup.bash
source /home/vignesh/poseidon_ws/install/setup.bash



# rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro humble -y --skip-keys ament_python

# use the --symlinks option to reduce disk usage, and facilitate development.
# colcon build --symlink-install \
#   --cmake-args \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DPython_EXECUTABLE=$CONDA_PREFIX/bin/python \
#     -DPython3_EXECUTABLE=$CONDA_PREFIX/bin/python \
#     -DPython3_FIND_STRATEGY=LOCATION \
#     -DPython_FIND_STRATEGY=LOCATION

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release 

source install/setup.bash