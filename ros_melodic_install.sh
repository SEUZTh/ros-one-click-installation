#!/bin/bash

## Author: ZTh
## ROS Gazebo: http://wiki.ros.org/kinetic/Installation/Ubuntu

mypassword="$1"

## 1.2 Setup your sources.list
echo 'mypassword' |sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## 1.3 Set up your keys
sudo apt -y install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

## 1.4 Installation
sudo apt update
sudo apt-get -y install ros-melodic-desktop-full

## 1.5 Environment setup
rossource="source /opt/ros/melodic/setup.bash"
if grep -Fxq "$rossource" ~/.bashrc; then echo ROS setup.bash already in .bashrc;
else echo "$rossource" >> ~/.bashrc; fi
eval $rossource

## 1.6 Dependencies for building packages
echo 'mypassword' |sudo -S apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
