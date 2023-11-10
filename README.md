# mycobot_docker
Uses docker to run mycobot_ros package for ROS Noetic

The main repository can be found ![here](https://github.com/elephantrobotics/mycobot_ros/tree/noetic)

**The docker runs Ubuntu 20.04 with Nvidia Cuda 11.4.2**

# prerequisite
### Docker

Installing docker
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```bash
# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Follow these steps to run docker without 'sudo'
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Verify that docker works
```bash
docker run hello-world
```

# Instructions to run mycobot_ros package
1. Pull the docker image

```bash
docker pull rohan132/mycobot_280:noetic
```
2. Clone the github repo
```bash
git clone https://github.com/rohan-khaire25/mycobot_docker.git
```
3. Run the docker script and execute a roslaunch file
```bash
# go into the cloned directory
cd mycobot_docker
# You will enter into the docker container using this command
./run_docker.sh
# Now we run a roslaunch file
# Use the usb port connected to mycobot (/dev/ttyUSB0 or /dev/ttyACM0)
roslaunch mycobot_280 simple_gui.launch port:=/dev/ttyACM0
```

## Running Moveit with the real mycobot
**Make sure that you are inside the docker container**
1. Run the following launch file
```bash
roslaunch mycobot_280_moveit mycobot_moveit.launch
```
2. Open a new terminal
```bash
# Go into the cloned directory
cd mycobot_docker
# This will take you inside the docker container
./get_shell.sh
```
3. Run the following command in this new terminal
```bash
# Make sure that the port is the proper one
rosrun mycobot_280_moveit sync_plan.py _port:=/dev/ttyACM0 _baud:=115200
```

Now you can control your robot using moveit!
