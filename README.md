# Repository with docker build and helm chart for GTD:

[GTD](https://github.com/shacker/gtd) GTD: Container/stub site for django-todo

[Django-todo](https://github.com/shacker/django-todo) is a reusable app that can be plugged into any
running Django project.

## Installation

`clone` the repository

0. Install docker, kubectl and helm3 at your runner server.
1. Log in your docker registry (docker login).
2. Run `build.sh` with [IMAGENAME] parameter.
```
   example ./build.sh sadm/django-todo:test01
```
   Ensure that your docker image is pushed into your registry.
3. Run `deploy.sh` with [namespace] [url] [image name] parameters
```
   example:
     ./deploy.sh django-todo django-todo.yourk8singress.x5.ru sadm/django-todo:test01
```
   Open [url] to work with application.
