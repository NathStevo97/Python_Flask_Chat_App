FROM python:3.13-slim-bookworm@sha256:4c2cf9917bd1cbacc5e9b07320025bdb7cdf2df7b0ceaccb55e9dd7e30987419

WORKDIR /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]