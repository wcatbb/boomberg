<template>
  <div class="plr">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-header">
          <h1 id="players">Players 🧢</h1>
          <div class="dropdown">
            <button
              class="btn btn-secondary dropdown-toggle"
              type="button"
              id="filterDropdown"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              Filter by Team
            </button>
            <div class="dropdown-menu" aria-labelledby="filterDropdown">
              <a
                class="dropdown-item"
                href="#"
                @click.prevent="filterPlayers('All')"
              >
                All Teams
              </a>
              <a
                v-for="team in teams"
                :key="team.fg_id"
                class="dropdown-item"
                href="#"
                @click.prevent="filterPlayers(team.fg_id)"
              >
                {{ team.abb_name }}
              </a>
            </div>
          </div>
        </div>
        <div class="bs-component">
          <table class="table table-hover">
            <thead>
              <th scope="col">Name</th>
              <th scope="col">Team</th>
              <th scope="col">Pos</th>
              <th scope="col">AAV</th>
              <th scope="col">WAR</th>
              <th scope="col">xWAR</th>
              <th scope="col">$WAR</th>
            </thead>
            <tbody v-if="filteredPlayers.length > 0">
              <tr v-for="player in filteredPlayers" :key="player.id">
                <th scope="row">{{ player.name }}</th>
                <td>{{ getTeamAbbreviation(player.team_id) }}</td>
                <td>{{ player.position }}</td>
                <td>{{ Math.round(player.salary) }}</td>
                <td>{{ player.WAR }}</td>
                <td>{{ player.xWAR }}</td>
                <td>{{ player.dollars }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "MLBPlayers",
  data() {
    return {
      players: [],
      teams: [],
      selectedTeamId: null,
    };
  },
  computed: {
    filteredPlayers() {
      if (!this.selectedTeamId || this.selectedTeamId === "All") {
        return this.players;
      }
      return this.players.filter(
        (player) => player.team_id === this.selectedTeamId
      );
    },
  },
  methods: {
    getResponse() {
      const playersPath = "http://localhost:5000/mlbplayers";
      const teamsPath = "http://localhost:5000/mlbteams";
      axios
        .all([axios.get(playersPath), axios.get(teamsPath)])
        .then(
          axios.spread((playersRes, teamsRes) => {
            this.players = playersRes.data;
            this.teams = teamsRes.data;
          })
        )
        .catch((err) => {
          console.error(err);
        });
    },
    getTeamAbbreviation(teamId) {
      const team = this.teams.find((team) => team.fg_id === teamId);
      return team ? team.abb_name : "Unknown";
    },
    filterPlayers(teamId) {
      this.selectedTeamId = teamId;
    },
  },
  created() {
    this.getResponse();
  },
};
</script>

<style>
.plr {
  padding-left: 30px;
  padding-right: 30px;
  margin-bottom: 10px;
}
</style>
