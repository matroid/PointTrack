# PyTorch GPU
FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-devel

# Port 8888 for Jupyter lab; 6006 for Tensorboard
EXPOSE 8888 6006

# Set working directory
WORKDIR /root

# Install apt-get packages
RUN apt-get -y update \
    && apt-get -y install vim less \
    && apt-get -y install libglib2.0-0 libgl1-mesa-glx \
    && apt-get -y install libsm6 libxext6 libxrender-dev \
    && apt-get -y install ffmpeg

# Install Jupyter lab and configure
RUN pip install -U pip \
    && pip install -U cython \
    && pip install -U jupyterlab \
    && cd /root && jupyter lab -y --generate-config \
    && sed -i "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" /root/.jupyter/jupyter_lab_config.py \
    && sed -i "s/#c.NotebookApp.open_browser = True/c.NotebookApp.open_browser = False/g" /root/.jupyter/jupyter_lab_config.py \
    && sed -i "s/#c.NotebookApp.terminado_settings = {}/c.NotebookApp.terminado_settings = {'shell_command': ['bash']}/g" /root/.jupyter/jupyter_lab_config.py

# Install PointTrack dependencies
COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

# Set bash as shell (for Jupyter lab)
ENV SHELL=/bin/bash

# Start Jupyter lab
CMD jupyter lab --allow-root
