rosdep update
rosdep install --from-paths src --ignore-src --rosdistro humble -y

# use the --symlinks option to reduce disk usage, and facilitate development.
colcon build --symlink-install \
  --cmake-args \
    -DCMAKE_BUILD_TYPE=Release \
    -DPython_EXECUTABLE=$CONDA_PREFIX/bin/python \
    -DPython3_EXECUTABLE=$CONDA_PREFIX/bin/python \
    -DPython3_FIND_STRATEGY=LOCATION \
    -DPython_FIND_STRATEGY=LOCATION
