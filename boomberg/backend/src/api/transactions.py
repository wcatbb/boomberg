from flask import Blueprint, jsonify, abort, request
from ..models import Transaction, db
from datetime import datetime

bp = Blueprint('transactions', __name__, url_prefix='/transactions')
current_datetime = datetime.now()


@bp.route('', methods=['GET'])
def index():
    Transactions = Transaction.query.all()
    result = []
    for t in Transactions:
        result.append(t.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    t = Transaction.query.get_or_404(id, "Transaction not found")
    return jsonify(t.serialize())

@bp.route('', methods=['POST'])
def create():
    if not all(key in request.json for key in ['portfolio_id', 'mlbplayer_fgid', 'kind', 'dollars']):
        return abort(400)
    t = Transaction(
        date=current_datetime.isoformat(),
        portfolio_id=request.json['portfolio_id'],
        mlbplayer_fgid=request.json['mlbplayer_fgid'],
        kind=request.json['kind'],
        dollars=request.json['dollars']
    )
    db.session.add(t)
    db.session.commit()
    return jsonify(t.serialize())
