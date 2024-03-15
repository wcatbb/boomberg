# BOOMberg: An MLB Win$ App
How valuable is a win? BOOMberg uses MLB contract (AAV) and win projection (WAR) data from Fangraphs to calculate and visualize win value (win$). Hold players in your portfolio, make trades, and maximize your dollars and wins.

### How did the project's design evolve over time?
I originally wanted to track MLB Teams and Players using real data as a Python exercise and proof of concept, but with that data, I realized I could extrapolate this into a salary cap fantasy game.

This increased the level of complexity becuase I need to not only capture real world baseball data, but also create portfolio and transaction entities. For data visualization, I needed tables to track the values of MLB teams, players, and portfolios over time. I also had to adjust some entities because the FanGraphs API informed what data I could capture.

### Did you choose to use an ORM or raw SQL? Why?
I chose to leverage flask to work with SQLAlchemy because SQL can be a bit cumbersome to create and manage functions. I also used alembic to manage database migrations.

### What future improvements are in store, if any?
I still need to add listeners to populate value history tables, calculate/update how much MLB teams are spending and how much that affects the price of an MLB win. I also need to refine my API blueprints to match models and site functionality. For now, the app is building a database with MLB salary, payroll, and win data.

## API Reference Table
| Endpoint                | Method | Description                    |
|-------------------------|--------|--------------------------------|
| `/mlbplayers`           | GET    | Retrieve all MLB players       |
| `/mlbplayers/<int:id>`  | GET    | Retrieve a specific MLB player |
| `/mlbteams`             | GET    | Retrieve all MLB teams         |
| `/mlbteams/<int:id>`    | GET    | Retrieve a specific MLB team   |
| `/portfolios`           | POST   | Create a new portfolio         |
| `/portfolios`           | GET    | Retrieve all portfolios        |
| `/portfolios/<int:id>`  | GET    | Retrieve a specific portfolio  |
| `/portfolios/<int:id>`  | PATCH  | Update a specific portfolio    |
| `/portfolios/<int:id>`  | DELETE | Delete a specific portfolio    |
| `/transactions`         | GET    | Retrieve all transactions      |
| `/transactions`         | POST   | Create a new transaction       |
| `/transactions/<int:id>`| GET    | Retrieve a specific transaction|
| `/users`                | POST   | Create a new user              |
| `/users`                | GET    | Retrieve all users             |
| `/users/<int:id>`       | GET    | Retrieve a specific user       |
| `/users/<int:id>`       | PATCH  | Update a specific user         |
| `/users/<int:id>`       | DELETE | Delete a specific user         |


powered by [FanGraphs](https://www.fangraphs.com/)