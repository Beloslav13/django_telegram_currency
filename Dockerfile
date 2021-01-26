# pull official base image
FROM python:3.8

RUN mkdir /app \
          /var/log/app
# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# todo: update package
RUN apt-get update && \
    apt-get install -y \
        git \
        gettext \
        python3-dev \
        nano

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

#COPY config/supervisor.conf /etc/supervisor/conf.d/django_telegram_currency.conf

# copy project
COPY . /app
COPY ./build /app/build
