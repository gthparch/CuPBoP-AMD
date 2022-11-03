FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Set home environment variable.
ENV HOME=/home/$USERNAME
ENV TZ="America/New_York"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq sudo software-properties-common tzdata \
    && ln -fns "/usr/share/zoneinfo/America/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Add test toolchains repo
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test

# Install utilities.
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        git \
        wget \
        cmake \
        lsb-release \
        zlib1g \
        zlib1g-dev \
        software-properties-common \
        gdb \
        unzip zip \
        python3 python3-pip \
        libnuma-dev

COPY library-scripts/ /usr/local/share/library-scripts/

RUN bash -c "wget -O - https://apt.llvm.org/llvm.sh | sudo bash -s - 14 all" \
    && bash "/usr/local/share/library-scripts/register-llvm.sh" 14 1

RUN pip3 install pandas matplotlib numpy

RUN wget -q -O - https://repo.radeon.com/rocm/rocm.gpg.key | gpg --dearmor -o /usr/share/keyrings/rocm.gpg \
    && echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/debian/ ubuntu main' | sudo tee /etc/apt/sources.list.d/rocm.list \
    && apt-get update \
    && apt-get install -y rocm-dev hipify-clang

RUN bash /usr/local/share/library-scripts/desktop-lite-debian.sh

ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" \
    VNC_RESOLUTION="1920x1080x16" \
    VNC_DPI="96" \
    VNC_PORT="5901" \
    NOVNC_PORT="6080" \
    DISPLAY=":1" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

USER $USERNAME

ENTRYPOINT ["/usr/local/share/desktop-init.sh"]
CMD ["sleep", "infinity"]
