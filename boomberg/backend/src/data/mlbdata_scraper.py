import pandas as pd
import requests

def mlbteam_scraper():
    # URL for FG projected standings
    x_standings_url = "https://www.fangraphs.com/depthcharts.aspx?position=Standings"

    # Read projections data into a DataFrame
    x_standings_df = pd.read_html(x_standings_url)[6]

    # Extract team data
    x_wins = x_standings_df[("2024 Projected Full Season", "W")]
    x_losses = x_standings_df[("2024 Projected Full Season", "L")]

    standings_url = "https://www.fangraphs.com/api/menu/menu-standings"
    response = requests.get(standings_url)

    if response.status_code == 200:
        data = response.json()
        teams = [
            {
                "fg_id": team["teamid"],
                "short_name": team["shortName"],
                "abb_name": team["AbbName"],
                "league": team["League"],
                "division": team["Division"],
                "W": team["W"],
                "L": team["L"],
                "GB": team["GB"],
            }
            for team in data
        ]

        # Initialize list to store payroll values
        payrolls = []

        # Loop through teams to fetch payroll data
        for team in teams:
            team_id = team["fg_id"]

            # Construct API endpoint URL
            contracts_url = f"https://www.fangraphs.com/api/contracts/team-2020?teamid={team_id}&season=2024"

            # Send HTTP request to fetch payroll data
            response = requests.get(contracts_url)
            if response.status_code == 200:
                payroll_data = response.json()

                # Initialize payroll variable
                payroll = None

                # Iterate over payroll data to find the desired year
                for item in payroll_data["overall"]:
                    if "estLuxuryTaxPayroll" in item and item.get("Season") == 2024:
                        payroll = item["estLuxuryTaxPayroll"]
                        break  # Exit the loop once payroll is found

                # Append payroll to the list
                payrolls.append(payroll)
            else:
                # Append None if request fails
                payrolls.append(None)

        # Create DataFrame with team data, wins, losses, and payrolls
        mlbteams_table = pd.DataFrame(
            {
                "fg_id": [team["fg_id"] for team in teams],
                "short_name": [team["short_name"] for team in teams],
                "abb_name": [team["abb_name"] for team in teams],
                "league": [team["league"] for team in teams],
                "division": [team["division"] for team in teams],
                "W": [team["W"] for team in teams],
                "L": [team["L"] for team in teams],
                "GB": [team["GB"] for team in teams],
                "xW": x_wins,
                "xL": x_losses,
                "payroll": payrolls,
            }
        )

        # Perform division operation to calculate payroll per win
        mlbteams_table["win_spend"] = mlbteams_table["payroll"] / mlbteams_table["xW"]
        return mlbteams_table
    else:
        return None

def mlbplayer_scraper():
    players_pool = []

    # Fetch contracts data for all teams
    contracts_data = {}
    for team_id in range(1, 31):
        contracts_url = f"https://www.fangraphs.com/api/contracts/team-2020?teamid={team_id}&season=2024"
        contracts_response = requests.get(contracts_url)
        if contracts_response.status_code == 200:
            contracts_data[team_id] = contracts_response.json()
        else:
            print(f"Failed to fetch contracts data for team {team_id}")

    for team_id, team_contracts in contracts_data.items():
        dc_url = f"https://www.fangraphs.com/api/depth-charts/roster?teamid={team_id}"
        response = requests.get(dc_url)

        if response.status_code == 200:
            data = response.json()
            for p in data:
                jnum = p.get("jnum")
                if jnum in ('', '--'):
                    jnum = None
                if p.get("roster40") == "Y" and p.get("role") not in ["AAA", "AA", "A+", "A", "Rk"]:
                    player_info = {
                        "fg_id": p.get("playerid"),
                        "team_id": p.get("teamid"),
                        "name": p.get("playerNameDisplay"),
                        "role": p.get("role"),
                        "position": p.get("position1"),
                        "jnum": jnum,
                        "bats": p.get("bats"),
                        "throws": p.get("throws"),
                        "age": p.get("age"),
                        "injury": p.get("injurynotes"),
                        "dollars": 0,
                        "salary": next((contract["contractSummary"]["AAV"] for contract in team_contracts["players"] if contract["contractSummary"]["playerId"] == str(p.get("playerid"))), 740000),
                        "WAR": p.get("actual_WAR"),
                        "xWAR": p.get("proj_WAR"),
                    }
                    players_pool.append(player_info)
        else:
            print(f"Failed to fetch data for team {team_id}")

    # Replace null salary values with 740000
    for player in players_pool:
        if player["salary"] is None:
            player["salary"] = 740000

    return players_pool