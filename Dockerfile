FROM python:3.13-slim-bookworm@sha256:d97b595c5f4ac718102e5a5a91adaf04b22e852961a698411637c718d45867c8

WORKDIR /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]