FROM python:3.13-slim-bookworm@sha256:ac4274977cc5093aa7675b5f39e59403c7b692d0bf7549b49563177ddc02552d

# System deps:
RUN pip install poetry

WORKDIR /src/app

COPY pyproject.toml poetry.lock ./
COPY static ./static
COPY templates ./templates
COPY main.py ./main.py

RUN poetry install

EXPOSE 5000

ENV FLASK_APP=/src/app/main.py

ENTRYPOINT [ "poetry", "run", "python", "-m" , "flask", "run", "--host=0.0.0.0"]