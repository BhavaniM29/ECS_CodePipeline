FROM public.ecr.aws/docker/library/python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy application files into the container
COPY . /app

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir ddtrace  # ✅ Install ddtrace

# Expose port 5000 for Flask
EXPOSE 5000

# Start the Flask application with Datadog tracing
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
