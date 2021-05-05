#!/bin/bash

# Usage build.sh [IMAGENAME]
# example:
# ./build.sh sadm/django-todo:test01

{
#try
  git clone https://github.com/shacker/gtd.git
} || {
#catch
  cd gtd
  git pull
  cd ..
}

docker build -f Dockerfile      \
  --build-arg BUILDKIT_INLINE_CACHE=1  \
  -t $1                     \
  .

docker push $1
