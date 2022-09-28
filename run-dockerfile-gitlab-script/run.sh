#!/bin/bash

#Build gitlab/gitlab-ce image

docker build -t gitlab/gitlab-ce:rhombus $(PWD)
