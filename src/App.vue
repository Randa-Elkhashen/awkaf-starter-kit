<template>
  <!-- <TD_Languages /> -->
  <SelectLocale />
  <Header></Header>
  <Provider toast langSwitcher  >
      <router-view ></router-view>
  </Provider>
</template>
<script>
  import SelectLocale from "./components/SelectLocale/SelectLocale.vue";
  import TD_Languages from "../src/components/TD_Languages/TD_Languages.vue";
  import Provider from "./components/provider/Provider.vue"
  import Header from "./components/header/Header.vue"
  export default {
    name: 'App',
    components: {
      TD_Languages ,
      Provider ,
      Header,
      SelectLocale
    },
  }
</script>


<style lanf="scss">
  .body {
    background: var(--copyRights-bg);
  }
</style>