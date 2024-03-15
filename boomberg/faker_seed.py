import random
import string
import hashlib
import secrets
import datetime
from faker import Faker
from src.models import User, Portfolio, MLBTeam, MLBPlayer, db
from src.data.mlbdata_scraper import mlbteam_scraper, mlbplayer_scraper
from src.data.replacements import build_replacement_players
from src import create_app

# DATABASE SEEDING TAKES 15s

USER_COUNT = 50
PORTFOLIO_COUNT = 50

def random_passhash():
    """Get hashed and salted password of length N | 8 <= N <= 15"""
    raw = "".join(
        random.choices(
            string.ascii_letters + string.digits + "!@#$%&",  # valid pw characters
            k=random.randint(8, 15),  # length of pw
        )
    )

    salt = secrets.token_hex(16)
    return hashlib.sha512((raw + salt).encode("utf-8")).hexdigest()

def truncate_tables():
    """Delete all rows from database tables"""
    MLBPlayer.query.delete()
    MLBTeam.query.delete()
    Portfolio.query.delete()
    User.query.delete()
    db.session.commit()

def main():
    """Main driver function"""
    app = create_app()
    app.app_context().push()
    truncate_tables()
    fake = Faker()

    user_ids = [] # List to store user IDs
    for _ in range(USER_COUNT):
        fake_username = fake.unique.first_name().lower() + str(random.randint(1, 150))
        fake_name = fake.name()
        fake_email = fake.unique.email()
        fake_password = random_passhash()

        new_user = User(
            username=fake_username,
            name=fake_name,
            email=fake_email,
            password=fake_password,
            fav_team= None,
        )
        db.session.add(new_user)
        db.session.commit()  # Commit to generate user IDs
        user_ids.append(new_user.id)

    new_portfolio = None
    for _ in range(PORTFOLIO_COUNT):
        fake_name = f"{fake.word()} {fake.word()}s"
        fake_user_id = random.choice(user_ids)
        fake_size = fake.random_int(min=15, max=26)
        fake_trades = fake.random_int(min=10, max=100)
        fake_dollars = fake.random_int(min=75, max=250) * 1000000

        new_portfolio = Portfolio(
            name=fake_name,
            user_id=fake_user_id,
            size=fake_size,
            trades=fake_trades,
            dollars=fake_dollars,
        )
        db.session.add(new_portfolio)
        db.session.commit()

    # Insert MLB teams data
    mlbteam_data = mlbteam_scraper()
    if mlbteam_data is not None:
        mlbteam_data.to_sql('mlbteams', db.engine, if_exists='append', index=False)
        
    # TODO: Determine Replacements Team Payroll
    replacements_team = MLBTeam(
        fg_id=0,  # Example ID for replacements team
        short_name="Replacements",
        abb_name="REP",
        league="AL",
        division="W",
        W=48,
        L=114,
        GB=0,
        xW=48,
        xL=114,
        payroll=0,
        win_spend=0,
    )
    db.session.add(replacements_team)
    db.session.commit()

    # Insert MLB player data
    mlbplayer_data = mlbplayer_scraper()
    if mlbplayer_data is not None:
        for player_info in mlbplayer_data:
            # Create a new Player object
            player = MLBPlayer(
                fg_id=player_info["fg_id"],
                team_id=player_info["team_id"],
                name=player_info["name"],
                role=player_info["role"],
                position=player_info["position"],
                jnum=player_info["jnum"],
                bats=player_info["bats"],
                throws=player_info["throws"],
                age=player_info["age"],
                injury=player_info["injury"],
                dollars=player_info["dollars"],
                salary=player_info["salary"],
                WAR=player_info["WAR"],
                xWAR=player_info["xWAR"],
            )
            # Add the player to the session
            db.session.add(player)


    # TODO: Insert Replacement Players

    db.session.commit()

main()