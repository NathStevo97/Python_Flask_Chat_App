FROM python:3.13-slim-bookworm@sha256:f3614d98f38b0525d670f287b0474385952e28eb43016655dd003d0e28cf8652

WORKDIR /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]