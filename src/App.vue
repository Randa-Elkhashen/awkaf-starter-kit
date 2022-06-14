<template>
  <TD_Languages />
  <router-view></router-view>
</template>
<script>
  import TD_Languages from "../src/components/TD_Languages/TD_Languages.vue";

  export default {
    name: 'App',
    components: {
      TD_Languages
    }
  }
</script>


<style lanf="scss">
  .body {
    background: var(--copyRights-bg);
  }
</style>