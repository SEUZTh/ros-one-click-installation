#!/bin/bash

## Author: 宇宙爆肝锦标赛冠军
## Time: 2021.07.25
## ROS Gazebo: http://wiki.ros.org/kinetic/Installation/Ubuntu

mypassword="$1"

## 1.2 Setup your sources.list
echo 'mypassword' |sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## 1.3 Set up your keys
sudo apt -y install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

## 1.4 Installation
sudo apt update
sudo apt-get -y install ros-noetic-desktop-full

## 1.5 Environment setup
rossource="source /opt/ros/noetic/setup.bash"
if grep -Fxq "$rossource" ~/.bashrc; then echo ROS setup.bash already in .bashrc;
else echo "$rossource" >> ~/.bashrc; fi
eval $rossource

## 1.6 Dependencies for building packages
echo 'mypassword' |sudo -S apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update
