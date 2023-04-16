FROM ros:noetic

# Install sudo and create a non-root user called 'dev'
RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -m -G sudo -s /bin/bash dev

# Allow the 'dev' user to run sudo commands without a password
RUN echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev

# Switch to the 'dev' user
USER dev

# Set the working directory
WORKDIR /home/dev

# Create ros_ws/src directory and set ownership to dev user
RUN mkdir -p /home/dev/ros_ws/src && \
    chown -R dev:dev /home/dev/ros_ws

# Source the ROS environment in the user's bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/dev/.bashrc
