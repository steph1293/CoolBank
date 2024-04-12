# CoolBank

This document provides instructions on how to run the CoolBank Django project. You can run the project using Docker (recommended for consistency across different environments) or manually if you prefer direct management of your development environment.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker (for Docker setup)
- Python 3.11 (for manual setup)
- Pipenv (for manual setup)

## Running the Project with Docker

Using Docker simplifies setup and ensures consistency across different development environments.

### 1. Install Docker

You can download docker from the official website or using your package manager.
```bash
brew install --cask docker
```

### 2. Build the Docker Image

Navigate to the root directory of the project where the `Dockerfile` is located and run the following command to build your Docker image:

```bash
docker build -t coolbank .
```

### 3. Run the Docker Container

Once the image is built, you can run the container using the following command:

```bash
docker run -p 8000:8000 coolbank
```

This will start the Django server and make it accessible on port 8000 of your local machine.

## Running the Project Manually

If you prefer to manage your development environment manually, you can follow these steps:

### 1. Install Python 3.11

You can download Python from the official website or using your package manager.
```bash
brew install python@3.11
```

### 2. Create a Virtual Environment

I use pipenv for managing my virtual environments. But a requirements.txt file is also provided for other tools.

```bash
pipenv shell
```

### 3. Install Dependencies

```bash
pipenv install
```

### 4. Migrations and Database

For this setup, sqlite is used as the database. Theres no need to install any other database engines. Before running the application, migrations need to be applied:

```bash
python manage.py migrate
```

### 5. Run the Server

```bash
python manage.py runserver
```

This will start the Django server and make it accessible on port 8000 of your local machine.
