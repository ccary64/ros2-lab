https://docs.ros.org/en/iron/How-To-Guides/Setup-ROS-2-with-VSCode-and-Docker-Container.html
https://docs.ros.org/en/iron/How-To-Guides/Visualizing-ROS-2-Data-With-Foxglove-Studio.html
https://containers.dev/guide/prebuild


Update VSCode user settings
"dev.containers.mountWaylandSocket": false
```bash
mkdir -p ./volumes/loki
sudo chown 10001:10001 ./volumes/loki

mkdir -p ./volumes/grafana
sudo chown 472:472 ./volumes/grafana

mkdir -p ./volumes/ros/build
mkdir -p ./volumes/ros/install
```