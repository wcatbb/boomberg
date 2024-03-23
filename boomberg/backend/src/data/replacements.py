import random
from src.models import MLBPlayer

#TODO remove attributes logic and integrate into faker_seed with random names and attributes

def build_replacement_players(player_pool):
    """Build a roster of replacement players and insert them into the MLB players pool."""
    replacements = []

    # Determine the most common attributes in the player pool
    most_common_name = max(player_pool, key=lambda x: player_pool.count(x["name"]))["name"]
    most_common_role = max(player_pool, key=lambda x: player_pool.count(x["role"]))["role"]
    most_common_jnum = max(player_pool, key=lambda x: player_pool.count(x["jnum"]))["jnum"]
    most_common_bats = max(player_pool, key=lambda x: player_pool.count(x["bats"]))["bats"]
    most_common_throws = max(player_pool, key=lambda x: player_pool.count(x["throws"]))["throws"]
    most_common_age = max(player_pool, key=lambda x: player_pool.count(x["age"]))["age"]

    # Generate replacement players for pitchers
    for _ in range(13):
        replacement_pitcher = MLBPlayer(
            fg_id=random.randint(1, 14),  # Adjusted range for unique fg_id
            team_id=0,
            name=most_common_name,
            role=most_common_role,
            position="P",
            jnum=most_common_jnum,
            bats=most_common_bats,
            throws=most_common_throws,
            age=most_common_age,
            injury="",
            dollars=0,
            salary=740000,
            WAR=0,
            xWAR=0
        )
        replacements.append(replacement_pitcher)

    # Generate replacement players for position players
    for _ in range(13):
        position = random.choice(["C", "1B", "2B", "3B", "SS", "LF", "CF", "RF"])
        replacement_position_player = MLBPlayer(
            fg_id=random.randint(15, 27),  # Adjusted range for unique fg_id
            team_id=0,
            name=most_common_name,
            role=most_common_role,
            position=position,
            jnum=most_common_jnum,
            bats=most_common_bats,
            throws=most_common_throws,
            age=most_common_age,
            injury="",
            dollars=0,
            salary=740000,
            WAR=0,
            xWAR=0
        )
        replacements.append(replacement_position_player)

    return replacements