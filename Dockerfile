FROM ros:melodic-ros-core

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt -y install \
    ros-melodic-cv-bridge \
    ros-melodic-tf \
    python-pip python-matplotlib \
    && rm -rf /var/lib/apt/lists/*
COPY . /kitti2bag
RUN pip install -e /kitti2bag

WORKDIR /data

ENTRYPOINT ["/kitti2bag/docker_entrypoint.sh"]

