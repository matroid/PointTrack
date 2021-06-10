#!/bin/bash
docker run --rm --network host --runtime nvidia --name pointtrack -p 8888:8888 -p 6006:6006 -v /home/ubuntu:/root/ubuntu -d pointtrack:latest
