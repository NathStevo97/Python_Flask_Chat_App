FROM python:3.13-slim-bookworm@sha256:60248ff36cf701fcb6729c085a879d81e4603f7f507345742dc82d4b38d16784

WORKDIR /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]