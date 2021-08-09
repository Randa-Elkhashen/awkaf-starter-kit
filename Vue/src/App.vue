<template>
  <div id="app">
    <Navigation />
    <router-view />
    <Footer />
  </div>
</template>

<style lang="scss">
body {
  direction: rtl;
}

@import "../src/assets/sass/IEDisclaimerStyle";
</style>

<script>
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
  name: "App",
  components: {
    Navigation,
    Footer
  },
  mounted() {
  }
};
</script>
