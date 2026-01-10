

# Pre-requiste: Install mamba
# curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# bash Miniforge3-$(uname)-$(uname -m).sh


conda create -n ros_humble -c conda-forge -c robostack-humble ros-humble-desktop

# activate it
mamba activate ros_humble

# add conda-forge and RoboStack channels
conda config --env --add channels conda-forge
conda config --env --add channels robostack-humble

# optionally also:
conda config --env --add channels robostack
conda config --env --add channels robostack-experimental

# remove defaults (avoid conflicts)
conda config --env --remove channels defaults

# mamba install ros-humble-desktop-full -y

mamba install -c conda-forge ros-dev-tools

# build tools
mamba install colcon-common-extensions cmake ninja pkg-config -y


mamba install gazebo -y   # if available on channels

