from flask import Blueprint, jsonify, abort, request
from ..models import Portfolio, db

bp = Blueprint('portfolios', __name__, url_prefix='/portfolios')

@bp.route('', methods=['GET'])
def index():
    portfolios = Portfolio.query.all()
    result = []
    for t in portfolios:
        result.append(t.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    p = Portfolio.query.get_or_404(id, "Portfolio not found")
    return jsonify(p.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'user_id' not in request.json or 'name' not in request.json:
        return abort(400)
    p = Portfolio(
        user_id=request.json['user_id'],
        name=request.json['name'],
    )
    db.session.add(p)
    db.session.commit()
    return jsonify(p.serialize())

#@login_required
@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    p = Portfolio.query.get_or_404(id, "Portfolio not found")
    try:
        db.session.delete(p)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH'])
def update(id: int):
    p = Portfolio.query.get_or_404(id)
    if not all(key in request.json for key in ['id', 'user_id', 'name']):
        return abort(400)
    if 'id' in request.json and int(request.json['id']) != p.id:
        return abort(400)
    if 'user_id' in request.json and int(request.json['user_id']) != p.user_id:
        return abort(400)
    if 'name' in request.json:
        if len(request.json['name']) < 3:
            return abort(400)
        p.name = request.json['name']
    try:
        db.session.commit()
        return jsonify(p.serialize())
    except:
        return jsonify(False)
