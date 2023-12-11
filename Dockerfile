ARG ROS_DISTRO=$ROS_DISTRO

FROM osrf/ros:${ROS_DISTRO}-desktop

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DISPLAY=:0
ENV QT_QPA_PLATFORM=xcb

ENV XDG_RUNTIME_DIR=/run/user/$USER_UID
ENV XDG_SESSION_TYPE=wayland
ENV GDK_BACKEND=wayland
ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_UID/bus

ENV SHELL /bin/bash


# Create the user
RUN groupadd --gid $USER_GID ${USERNAME} \
    && useradd --uid $USER_UID --gid $USER_GID -m ${USERNAME} \
    # Add sudo support
    && apt-get update \
    && apt-get install -y sudo python3-pip \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    # Create runtime dir
    && mkdir -p $XDG_RUNTIME_DIR \
    && chown -R $USER_UID $XDG_RUNTIME_DIR \
    && chmod 0700 $XDG_RUNTIME_DIR

RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/${USERNAME}/.bashrc

USER ${USERNAME}