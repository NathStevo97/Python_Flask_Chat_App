FROM python:3.13-slim-bookworm@sha256:9b8102b7b3a61db24fe58f335b526173e5aeaaf7d13b2fbfb514e20f84f5e386

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
