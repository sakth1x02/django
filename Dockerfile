# Use Python 3.11-slim as the base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /backend

# Copy the requirements file to the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN --mount=type=cache,target=/root/.cache/pip pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Add a non-root user for security
RUN adduser --disabled-password --gecos "" --uid "10001" appuser
USER appuser

# Expose the Django default port
EXPOSE 8000

# Set the default command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
