from flask import Blueprint, jsonify, abort, request
from ..models import MLBTeam, db

bp = Blueprint('mlbteams', __name__, url_prefix='/mlbteams')

@bp.route('', methods=['GET'])
def index():
    mlbteams = MLBTeam.query.all()
    result = []
    for t in mlbteams:
        result.append(t.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    t = MLBTeam.query.get_or_404(id, "MLBTeam not found")
    return jsonify(t.serialize())
