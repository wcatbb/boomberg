from flask import Blueprint, jsonify, abort, request
from ..models import User, db
import hashlib
import secrets
import traceback

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET'])
def index():
    users = User.query.all()
    result = []
    for u in users:
        result.append(u.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id, "User not found")
    return jsonify(u.serialize())

@bp.route('', methods=['POST'])
def create():
    if not all(key in request.json for key in ['username', 'password', 'name', 'email']):
        return abort(400)
    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)
    u = User(
        username=request.json['username'],
        password=scramble(request.json['password']),
        name=request.json['name'],
        email=request.json['email']
    )
    db.session.add(u)
    db.session.commit()
    return jsonify(u.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id, "User not found")
    try:
        db.session.delete(u)
        db.session.commit()
        return jsonify(True)
    except Exception as e:
        # Log the exception message for debugging purposes
        traceback.print_exc()
        # Return the exception message as part of the JSON response
        return jsonify(error=str(e)), 500  # Return HTTP status code 500 for internal server error
    
@bp.route('/<int:id>', methods=['PATCH'])
def update(id: int):
    u = User.query.get_or_404(id)
    if not all(key in request.json for key in ['username', 'password']):
        return abort(400)
    if 'username' in request.json:
        if len(request.json['username']) < 3:
            return abort(400)
        u.username = request.json['username']
    if 'password' in request.json:
        if len(request.json['password']) < 8:
            return abort(400)
        u.password = scramble(request.json['password'])
    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)
