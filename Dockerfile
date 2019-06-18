FROM python:3.7-alpine
#recommended env variable when using python image
ENV PYTHONUNBUFFERED 1 

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app
#create user. -D flag means user only for running applications
RUN adduser -D user
#switches Docker to use user we  created above. for security, better than running with root user
USER user