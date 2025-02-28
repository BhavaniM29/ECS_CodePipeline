from flask import Flask
import os
from ddtrace import patch_all, tracer

# Enable Datadog tracing for all supported libraries
patch_all()

# Configure the Datadog tracer to send traces to the correct host
tracer.configure(
    settings={"agent_url": "http://127.0.0.1:8126"}
)
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Flask! This is your first app running on AWS with Datadog APM."

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
