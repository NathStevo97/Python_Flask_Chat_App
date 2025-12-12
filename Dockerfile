FROM python:3.14-slim-bookworm@sha256:404ca55875fc24a64f0a09e9ec7d405d725109aec04c9bf0991798fd45c7b898

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
