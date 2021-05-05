FROM python:3.9.2-buster as base

# add requirements

RUN pip install pipenv

ARG UID=20000
ARG GID=20000
ENV UID=${UID}
ENV GID=${GID}
RUN groupadd --gid ${GID} app &&\
    useradd --uid ${UID} --gid app --shell /bin/bash --create-home -d /app app

USER app

COPY gtd /app/gtd
RUN cd /app/gtd && pipenv install

WORKDIR /app/gtd


# run server
CMD pipenv manage.py runserver 0.0.0.0:80

