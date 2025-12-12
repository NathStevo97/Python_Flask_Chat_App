FROM python:3.13-slim-bookworm@sha256:9b8102b7b3a61db24fe58f335b526173e5aeaaf7d13b2fbfb514e20f84f5e386

ENV FLASK_APP=/src/app/main.py

# System deps:
RUN pip install --no-cache-dir --upgrade poetry

WORKDIR /src/app

# Copy Poetry files
COPY pyproject.toml poetry.lock ./

# Copy CSS files
COPY static ./static

# Copy HTML files
COPY templates ./templates

# Copy app files
COPY main.py ./main.py

# Install project dependencies
RUN poetry install

# Expose the port Flask is running on
EXPOSE 5000

# Set Entrypoint to run the Flask app
ENTRYPOINT [ "poetry", "run", "python", "-m" , "flask", "run", "--host=0.0.0.0"]
