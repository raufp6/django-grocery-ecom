# Use an official Python runtime as a parent image
FROM python:slim-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Install dependencies
COPY ./requirements.txt .
RUN pip install --upgrade pip

RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /code/
COPY . /code/

# Expose the Django development server port
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]