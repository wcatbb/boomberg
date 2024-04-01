<template>
  <div class="plr">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-header">
          <h1 id="teams">Teams 🏟️</h1>
        </div>
        <div class="bs-component">
          <table class="table table-hover">
            <thead>
              <th scope="col">Team</th>
              <th scope="col">League</th>
              <th scope="col">Division</th>
              <th scope="col">Payroll</th>
              <th scope="col">xW</th>
              <th scope="col">xL</th>
              <th scope="col">$WS</th>
            </thead>
            <tbody v-if="teams.length > 0">
              <tr v-for="team in sortedTeams" :key="team.id">
                <th scope="row">{{ team.short_name }}</th>
                <td>{{ team.league }}</td>
                <td>{{ team.division }}</td>
                <td>{{ team.payroll }}</td>
                <td>{{ team.xW }}</td>
                <td>{{ team.xL }}</td>
                <td>{{ team.win_spend }}</td>
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
  name: "MLBTeams",
  data() {
    return {
      teams: [],
    };
  },
  computed: {
    sortedTeams() {
      return this.teams.slice().sort((a, b) => b.payroll - a.payroll);
    },
  },
  methods: {
    getResponse() {
      const path = "http://localhost:5000/mlbteams";
      axios
        .get(path)
        .then((res) => {
          console.log(res.data);
          this.teams = res.data;
        })
        .catch((err) => {
          console.error(err);
        });
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
