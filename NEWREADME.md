# CoolBank

This document provides instructions on how to run the CoolBank Django project along with Elastic SIEM for log monitoring. You can run the project using Docker Compose, which simplifies the setup and ensures consistency across different environments.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker
- Docker Compose

## Running the Project with Docker Compose

Using Docker Compose simplifies the setup and allows you to run both the Django project and Elastic SIEM components together.

### 1. Install Docker and Docker Compose

You can download Docker and Docker Compose from the official website or using your package manager.

```bash
# For macOS
brew install --cask docker

# For Linux (Ubuntu)
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
```

### 2. Clone the Repository

Clone the project repository to your local machine

```bash
git clone https://github.com/steph1293/CoolBank.git
cd CoolBank
```

### 3. Configure the Docker Compose File
The docker-compose.yml file in the project root directory contains the configuration for both the Django project and Elastic SIEM services. Review the file and make any necessary adjustments, such as updating the Elasticsearch password or changing port mappings.

### 4. Build and Start the Containers
Run the following command to build and start the containers:

```bash
docker-compose up --build
```

This command will build the Docker images for the Django project and Elastic SIEM services, and then start the containers.

### 5. Access the Applications
Once the containers are up and running, you can access the applications:

Django application: http://localhost:8000
Kibana (Elastic SIEM): http://localhost:5601

### 6. Stop the Containers
To stop the containers, press Ctrl+C in the terminal where you started the containers, or run the following command in a separate terminal:

```bash
docker-compose down
```

This will stop and remove the containers.

## Logging
The Django project is configured to send logs to Elasticsearch using the django-elasticsearch-logging library. The logs can be viewed and analyzed in Kibana, which is accessible at http://localhost:5601.

## Customization
If you need to customize the Django project or Elastic SIEM configuration, you can modify the respective files:

## Django project: Update the Dockerfile, docker-compose.yml, and Django settings as needed.
Elastic SIEM: Update the docker-compose.yml file and the configuration files in the ELK directory.
Make sure to rebuild the containers using docker-compose up --build after making any changes.

## Troubleshooting
If you encounter any issues while running the project, here are a few things to check:

Ensure that Docker and Docker Compose are properly installed and running on your system.
Check the logs of the containers using docker-compose logs to identify any error messages.
Verify that the ports specified in the docker-compose.yml file are not already in use by other applications.
Ensure that the Elasticsearch password and other sensitive information are correctly configured in the docker-compose.yml file and Django settings.
If you need further assistance, please consult the project documentation or reach out to the project maintainers.

