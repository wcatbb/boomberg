from flask_sqlalchemy import SQLAlchemy
from .models import Transaction, mlbplayers_portfolios_bridge

db = SQLAlchemy()
# Define event listener for Transaction creation
@db.event.listens_for(Transaction, 'after_insert')
def update_mlbplayers_portfolios(mapper, connection, target):
    if target.kind == 'buy':
        # Add the record to the bridge table
        connection.execute(
            mlbplayers_portfolios_bridge.insert().values(
                mlbplayer_fgid=target.mlbplayer_fgid,
                portfolio_id=target.portfolio_id
            )
        )
    elif target.kind == 'sell':
        # Remove the record from the bridge table
        connection.execute(
            mlbplayers_portfolios_bridge.delete().where(
                (mlbplayers_portfolios_bridge.c.mlbplayer_fgid == target.mlbplayer_fgid) &
                (mlbplayers_portfolios_bridge.c.portfolio_id == target.portfolio_id)
            )
        )
