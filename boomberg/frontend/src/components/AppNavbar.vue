<template>
  <div>
    <nav :class="navbarClass" class="navbar navbar-expand-sm bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Boomberg</a>
        <button
          class="navbar-toggler"
          type="button"
          @click="toggleExpanded"
          :aria-expanded="isExpanded"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div :class="collapseClass" id="navbarColor03">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <router-link
                :to="{ name: 'MLBPlayers' }"
                class="nav-link"
                :class="{ active: activeLink === 'Players' }"
                @click="setActiveLink('Players')"
                >Players</router-link
              >
            </li>
            <li class="nav-item">
              <router-link
                :to="{ name: 'MLBTeams' }"
                class="nav-link"
                :class="{ active: activeLink === 'Teams' }"
                @click="setActiveLink('Teams')"
                >Teams</router-link
              >
            </li>
            <!-- Other navbar items -->
            <!-- <li class="nav-item dropdown" data-bs-theme="light">
              <a
                class="nav-link dropdown-toggle d-flex align-items-center"
                href="#"
                id="theme-menu"
                aria-expanded="false"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-label="Toggle theme"
              >
                <i class="bi bi-circle-half me-2"></i>
                <span class="d-lg-none">Toggle theme</span>
              </a>
              <div class="dropdown-menu" aria-labelledby="theme-menu">
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center"
                  @click="setTheme('light')"
                >
                  <i class="bi bi-sun-fill me-2"></i>
                  <span>Light</span>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center"
                  @click="setTheme('dark')"
                >
                  <i class="bi bi-moon-stars-fill me-2"></i>
                  <span>Dark</span>
                </button>
              </div>
            </li> -->
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "AppNavbar",
  data() {
    return {
      activeLink: null,
      isExpanded: false,
      theme: "light",
    };
  },
  computed: {
    navbarClass() {
      return {
        navbar: true,
        "navbar-expand-lg": true,
        "bg-light": true,
      };
    },
    collapseClass() {
      return {
        "collapse navbar-collapse": true,
        show: this.isExpanded,
      };
    },
  },
  methods: {
    setActiveLink(linkName) {
      this.activeLink = linkName;
    },
    setTheme(theme) {
      this.theme = theme;
      localStorage.setItem("theme", theme);
    },
    toggleExpanded() {
      this.isExpanded = !this.isExpanded;
    },
  },
  mounted() {
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme) {
      this.theme = savedTheme;
    }
  },
};
</script>

<style scoped>
.navbar {
  padding-left: 30px;
  padding-right: 30px;
  margin-bottom: 10px;
}

.nav-link.active {
  font-weight: bold;
}
</style>
