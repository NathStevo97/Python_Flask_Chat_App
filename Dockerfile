FROM --platform=linux/amd64 python:3.11.3

workdir /src/app

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

EXPOSE 5000

ENV FLASK_APP /src/app/main.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]