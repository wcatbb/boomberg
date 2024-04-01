import Vue from "vue";
import VueRouter from "vue-router";
import MLBPlayers from "../components/MLBPlayers.vue";
import MLBTeams from "../components/MLBTeams.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/mlbplayers",
    name: "MLBPlayers",
    component: MLBPlayers,
  },
  {
    path: "/mlbteams",
    name: "MLBTeams",
    component: MLBTeams,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
