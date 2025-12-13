"""
Docstring for main
"""

import os
from flask import Flask
from flask_socketio import SocketIO
from dotenv import load_dotenv

from routes import bp as main_bp
from socket_handlers import register_socket_handlers

load_dotenv()

app = Flask(__name__)
app.config["SECRET_KEY"] = os.getenv("SECRET_KEY")
socketio = SocketIO(app)

rooms = {}

# Register Blueprints
app.register_blueprint(main_bp)

# Register SocketIO Handlers
app.register_socket_handlers = register_socket_handlers(socketio)

if __name__ == "__main__":
    socketio.run(app, port=5000, host="0.0.0.0")
