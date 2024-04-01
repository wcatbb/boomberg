<template>
  <div>
    <AppNavbar />
    <router-view />
  </div>
</template>

<script>
import AppNavbar from "./components/AppNavbar.vue";

export default {
  name: "App",
  components: {
    AppNavbar,
  },
  data() {
    return {
      darkMode: false, // Initial dark mode state
    };
  },
  computed: {
    themeClass() {
      return {
        dark: this.darkMode, // Apply 'dark' class when dark mode is enabled
      };
    },
  },
  methods: {
    toggleDarkMode() {
      this.darkMode = !this.darkMode; // Toggle dark mode state
    },
  },
};
</script>

<style>
/* Include Bootstrap styles, including dark mode styles if applicable */
@import url("https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css");
</style>
