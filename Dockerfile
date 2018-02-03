from python:3.6

RUN mkdir -p /opt/mdzhang/flask-hello-world
WORKDIR /opt/mdzhang/flask-hello-world

RUN pip3 install --upgrade pip
COPY requirements*.txt ./
RUN pip3 install -r requirements.txt

COPY . ./

LABEL maintainer="Michelle D Zhang <zhang.michelle.d@gmail.com>"
LABEL source="https://github.com/mdzhang/flask-hello-world"
ARG commit
LABEL commit="$commit"

ENV PORT 5000
ENV FLASK_APP app.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["flask", "run", "--host=0.0.0.0"]
