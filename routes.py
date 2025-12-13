"""Routes for the Flask application."""

from flask import Blueprint, render_template, request, session, redirect, url_for
from utils import generate_unique_code
from models import rooms


bp = Blueprint("main", __name__)


@bp.route("/", methods=["POST", "GET"])
def home():
    """
    Docstring for home
    """
    session.clear()
    if request.method == "POST":
        name = request.form.get("name")
        code = request.form.get("code")
        join = request.form.get("join", False)
        create = request.form.get("create", False)

        if not name:
            return render_template(
                "home.html", error="Please enter a name.", code=code, name=name
            )

        if join is not False and not code:
            return render_template(
                "home.html", error="Please enter a room code.", code=code, name=name
            )

        room = code
        if create is not False:
            room = generate_unique_code(4)
            rooms[room] = {"members": 0, "messages": []}
        elif code not in rooms:
            return render_template(
                "home.html", error="Room does not exist.", code=code, name=name
            )

        session["room"] = room
        session["name"] = name
        return redirect(url_for("main.room"))

    return render_template("home.html")


@bp.route("/room")
def room():
    """
    Docstring for room
    """
    room_id = session.get("room")
    if room_id is None or session.get("name") is None or room_id not in rooms:
        return redirect(url_for("main.home"))

    return render_template(
        "room.html", code=room_id, messages=rooms[room_id]["messages"]
    )
