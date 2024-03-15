from flask import Blueprint, jsonify, abort, request
from ..models import MLBPlayer, db

bp = Blueprint('mlbplayers', __name__, url_prefix='/mlbplayers')

@bp.route('', methods=['GET'])
def index():
    mlbplayers = MLBPlayer.query.all()
    result = []
    for p in mlbplayers:
        result.append(p.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    p = MLBPlayer.query.get_or_404(id, "MLB Player not found")
    return jsonify(p.serialize())