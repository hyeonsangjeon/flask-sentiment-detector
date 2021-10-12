FROM tensorflow/tensorflow:2.3.0-gpu
MAINTAINER your_name "wingnut0310@gmail.com"

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt




COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

EXPOSE 8080

#ENTRYPOINT ["python"]
CMD ["python", "/app/cpu_sentiment_flask.py"]
