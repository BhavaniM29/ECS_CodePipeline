FROM public.ecr.aws/docker/library/python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install -r requirements.txt \
    && pip install ddtrace  # ✅ Ensure ddtrace is installed

# Expose port 5000 for Flask
EXPOSE 5000

# Start the Flask application with Datadog tracing
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
