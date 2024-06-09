from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from cars.auth import login_required
from cars.db import get_db

bp = Blueprint('blog', __name__)

@bp.route('/')
def index():
    db = get_db()
    cars = db.execute(
        'SELECT c.car_id, name, model, year, fuel_type, km, transmission, color, price, pic, created, posted_by, username'
        ' FROM car c JOIN user u ON c.posted_by = u.user_id'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('cars/index.html', cars=cars)

