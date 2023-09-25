# Use Kali Linux as the base image
FROM kalilinux/kali-rolling

# Install necessary packages for GUI and VNC server
RUN apt-get update && \
    apt-get install -y kali-desktop-xfce tightvncserver && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set root password for VNC server
RUN mkdir /root/.vnc && \
    echo "VNCPASSWD" | vncpasswd -f > /root/.vnc/passwd

# Set permissions for VNC password file
RUN chmod 600 /root/.vnc/passwd

# Expose VNC server port
EXPOSE 5901

# Start VNC server to access Kali Linux GUI
CMD ["vncserver", ":1", "-geometry", "1280x800", "-fg"]
