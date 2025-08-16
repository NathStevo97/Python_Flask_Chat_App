FROM python:3.13-slim-bookworm@sha256:9b8102b7b3a61db24fe58f335b526173e5aeaaf7d13b2fbfb514e20f84f5e386

WORKDIR /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]