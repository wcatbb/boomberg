from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import relationship
from datetime import datetime

db = SQLAlchemy()

class MLBTeam(db.Model):
    __tablename__ = "mlbteams"
    id = db.Column(db.Integer, primary_key=True)
    fg_id = db.Column(db.SmallInteger, unique=True, nullable=False)
    short_name = db.Column(db.Text, unique=True, nullable=False)
    abb_name = db.Column(db.Text, unique=True, nullable=False)
    league = db.Column(db.Text, nullable=False)
    division = db.Column(db.Text, nullable=False)
    W = db.Column('W', db.SmallInteger, nullable=False)
    L = db.Column('L', db.SmallInteger, nullable=False)
    GB = db.Column('GB', db.Numeric, nullable=False)
    xW = db.Column('xW', db.SmallInteger, nullable=False)
    xL = db.Column('xL', db.SmallInteger, nullable=False)
    payroll = db.Column(db.Integer, nullable=False)
    win_spend = db.Column(db.Integer, nullable=False)

    # constructor
    def __init__(
        self,
        fg_id: int,
        short_name: str,
        abb_name: str,
        league: str,
        division: str,
        W: int,
        L: int,
        GB: float,
        xW: int,
        xL: int,
        payroll: int,
        win_spend: int,
    ):
        self.fg_id = fg_id
        self.short_name = short_name
        self.abb_name = abb_name
        self.league = league
        self.division = division
        self.W = W
        self.L = L
        self.GB = GB
        self.xW = xW
        self.xL = xL
        self.payroll = payroll
        self.win_spend = win_spend

    def serialize(self):
        return {
            'fg_id': self.fg_id,
            'short_name': self.short_name,
            'abb_name': self.abb_name,
            'league': self.league,
            'division': self.division,
            'W': self.W,
            'L': self.L,
            'GB': self.GB,
            'xW': self.xW,
            'xL': self.xL,
            'payroll': self.payroll,
            'win_spend': self.win_spend
        }

mlbplayers_portfolios_bridge = db.Table(
    "mlbplayers_portfolios",
    db.Column("mlbplayer_fgid", db.Integer, db.ForeignKey("mlbplayers.fg_id"), primary_key=True),
    db.Column("portfolio_id", db.Integer, db.ForeignKey("portfolios.id", ondelete="CASCADE"), primary_key=True),
)

class MLBPlayer(db.Model):
    __tablename__ = "mlbplayers"
    id = db.Column(db.Integer, primary_key=True)
    fg_id = db.Column(db.Integer, unique=True)
    name = db.Column(db.Text, nullable=False)
    role = db.Column(db.Text, nullable=False)
    position = db.Column(db.Text, nullable=False)
    jnum = db.Column(db.SmallInteger)
    bats = db.Column(db.Text, nullable=False)
    throws = db.Column(db.Text, nullable=False)
    age = db.Column(db.Numeric, nullable=False)
    injury = db.Column(db.Text)
    dollars = db.Column(db.Numeric, nullable=False)
    WAR = db.Column('WAR', db.Numeric)
    xWAR = db.Column('xWAR', db.Numeric)
    salary = db.Column(db.Numeric)
    team_id = db.Column(db.Integer, db.ForeignKey("mlbteams.fg_id"))
    portfolios = db.relationship(
        "Portfolio",
        secondary=mlbplayers_portfolios_bridge,
        lazy="subquery",
        backref=db.backref("players_portfolios", lazy=True),
        overlaps="players_portfolios,portfolios",
        viewonly=True,
    )

    # constructor
    def __init__(
        self,
        fg_id: int,
        name: str,
        role: str,
        position: str,
        jnum: int,
        bats: str,
        throws: str,
        age: float,
        injury: str,
        WAR: float,
        xWAR: float,
        salary: float,
        team_id: int,
        dollars: float = 0,
    ):
        self.fg_id = fg_id
        self.name = name
        self.role = role
        self.position = position
        self.jnum = jnum
        self.bats = bats
        self.throws = throws
        self.age = age
        self.injury = injury
        self.dollars = dollars
        self.WAR = WAR
        self.xWAR = xWAR
        self.salary = salary
        self.team_id = team_id

    def serialize(self):
        return {
            'fg_id': self.fg_id,
            'name': self.name,
            'role': self.role,
            'position': self.position,
            'jnum': self.jnum,
            'bats': self.bats,
            'throws': self.throws,
            'age': self.age,
            'injury': self.injury,
            'dollars': self.dollars,  
            'WAR': self.WAR,
            'xWAR': self.xWAR,
            'salary': self.salary,
            'team_id': self.team_id,
        }

class Portfolio(db.Model):
    __tablename__ = "portfolios"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, unique=True, nullable=False)
    size = db.Column(db.SmallInteger)
    trades = db.Column(db.SmallInteger)
    dollars = db.Column(db.Numeric, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"))
    players = db.relationship(
        "MLBPlayer",
        secondary=mlbplayers_portfolios_bridge,
        lazy="subquery",
        backref=db.backref("portfolios_players", lazy=True),
        overlaps="players_portfolios,portfolios",
        viewonly=True,
    )


    # constructor
    def __init__(
        self,
        user_id: int,
        name: str,
        size: int = 0,
        trades: int = 0,
        dollars: float = 0,
    ):
        self.user_id = user_id
        self.name = name
        self.size = size
        self.trades = trades
        self.dollars = dollars

    def serialize(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'name': self.name,
            'size': self.size,
            'trades': self.trades,
            'dollars': self.dollars
        }

class Transaction(db.Model):
    __tablename__ = "mlbplayers_portfolios_transactions"
    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)
    mlbplayer_fgid = db.Column(db.Integer, db.ForeignKey("mlbplayers.fg_id"))
    portfolio_id = db.Column(db.Integer, db.ForeignKey("portfolios.id", ondelete="SET NULL"))
    kind = db.Column(db.Text, nullable=False)
    dollars = db.Column(db.Numeric, nullable=False)

    # constructor
    def __init__(
        self,
        date: datetime,
        mlbplayer_fgid: int,
        portfolio_id: int,
        kind: str,
        dollars: float,
    ):
        self.date = date
        self.mlbplayer_fgid = mlbplayer_fgid
        self.portfolio_id = portfolio_id
        self.kind = kind
        self.dollars = dollars

    def serialize(self):
        return {
            "id": self.id,
            "date": self.date.isoformat(),
            "mlbplayer_fgid": self.mlbplayer_fgid,
            "portfolio_id": self.portfolio_id,
            "kind": self.kind,
            "dollars": self.dollars,
        }

class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=False)
    username = db.Column(db.Text, unique=True, nullable=False)
    password = db.Column(db.Text, nullable=False)
    fav_team = db.Column(db.Text)
    portfolios = db.relationship(
        "Portfolio",
        backref="user",
        cascade="all,delete"
    )

    # constructor
    def __init__(
        self,
        name: str,
        email: str,
        username: str,
        password: str,
        fav_team: str,
    ):
        self.name = name
        self.email = email
        self.username = username
        self.password = password
        self.fav_team = fav_team

    def serialize(self):
        return {
            "id": self.id,
            "username": self.username,
        }

class PortfolioValueHistory(db.Model):
    __tablename__ = "portfolio_value_history"
    id = db.Column(db.Integer, primary_key=True)
    portfolio_id = db.Column(db.Integer, db.ForeignKey("portfolios.id"), nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    dollars = db.Column(db.Numeric, nullable=False)

    def __init__(
        self,
        portfolio_id: int,
        date: datetime.date,
        dollars: float = 0,
    ):
        self.portfolio_id = portfolio_id
        self.date = date
        self.dollars = dollars

    def serialize(self):
        return {
            "id": self.id,
            "portfolio_id": self.portfolio_id,
            "date": self.date.isoformat(),
            "dollars": self.dollars
        }

class MLBPlayerValueHistory(db.Model):
    __tablename__ = "mlbplayer_value_history"
    id = db.Column(db.Integer, primary_key=True)
    mlbplayer_id = db.Column(db.Integer, db.ForeignKey("mlbplayers.fg_id"), nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    WAR = db.Column('WAR', db.Numeric, nullable=False)
    dollars = db.Column(db.Numeric, nullable=False)
    salary = db.Column(db.Numeric, nullable=False)

    def __init__(
        self,
        mlbplayer_id: int,
        date: datetime.date,
        WAR: float = 0,
        dollars: float = 0,
        salary: float = 0,
    ):
        self.mlbplayer_id = mlbplayer_id
        self.date = date
        self.WAR = WAR
        self.dollars = dollars
        self.salary = salary

    def serialize(self):
        return {
            "id": self.id,
            "mlbplayer_id": self.mlbplayer_id,
            "date": self.date.isoformat(),
            "WAR": self.WAR,
            "dollars": self.dollars,
            "salary": self.salary
        }

class MLBTeamValueHistory(db.Model):
    __tablename__ = "mlbteam_value_history"
    id = db.Column(db.Integer, primary_key=True)
    team_id = db.Column(db.Integer, db.ForeignKey("mlbteams.fg_id"), nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    wins = db.Column(db.Numeric, nullable=False)
    dollars = db.Column(db.Numeric, nullable=False)
    payroll = db.Column(db.Numeric, nullable=False)

    def __init__(
        self,
        team_id: int,
        date: datetime.date,
        dollars: float = 0,
    ):
        self.team_id = team_id
        self.date = date
        self.dollars = dollars

    def serialize(self):
        return {
            "id": self.id,
            "team_id": self.team_id,
            "date": self.date.isoformat(),
            "dollars": self.dollars
        }