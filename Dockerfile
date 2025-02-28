FROM public.ecr.aws/docker/library/python:3.9-slim

WORKDIR /app

# Install ddtrace first
RUN pip install ddtrace

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

# Using ENTRYPOINT with ddtrace-run
ENTRYPOINT ["ddtrace-run"]
CMD ["python", "app.py"]
