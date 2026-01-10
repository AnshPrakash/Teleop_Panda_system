virtualenv -p python3 ./venv # Make a virtual env and activate it
source ./venv/bin/activate
touch ./venv/COLCON_IGNORE # Make sure that colcon does not try to build the venv