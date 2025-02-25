# app.py
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Flask! This is your first app running on AWS."

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    debug_mode = os.environ.get("FLASK_DEBUG", "False") == "True"
    app.run(host='0.0.0.0', port=port, debug=debug_mode)
