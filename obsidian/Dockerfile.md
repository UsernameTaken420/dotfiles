Text-based file that contains the script to build a single [[Docker]] image. 
*For more complex deployments, see [[Docker Compose]]*

```Dockerfile
FROM busybox // what image to start from
// MAINTAINER Firstname lastname <email@example.com>
RUN echo "building simple docker image" // run command through shell, save result
ADD [file] [filePath] // saves the file at the specified path in the container
ENV DB_HOST=db.prod.example.com // set environment variable
CMD echo "Hello container"
EXPOSE [port] // exposes a container port
VOLUME [dirname] // defines a path for persisting container data
WORKDIR /path/to/workdir // sets working directory for RUN, CMD, ENTRYPOINT, etc
COPY . /opt/source-code // copy everything on dockerfile level to source-code folder
USER <user>[:<group>] // sets user name and group to use as default (none set defaults to root)
ENTRYPOINT FLASK_APP = /opt/source-code/app.py flask run // defines what to run by default on startup
```

```Dockerfile
FROM python:3.6
RUN pip install flask
COPY . /opt/
EXPOSE 8080
ENTRYPOINT ["python", "app.py"]
```

```Dockerfile
ENTRYPOINT ["sleep"]
CMD ["5"] // if nothing is set when calling the container, parameter for sleep will be 5 by default
```
