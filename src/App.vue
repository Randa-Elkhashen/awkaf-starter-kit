<template>
<Header />
  <router-view></router-view>
</template>
<script>
import Header from "@/modules/global/components/TD_Header/TD_Header.vue"
export default {
  name: 'App',
  components : {
    Header
  }
}
</script>


<style lanf="scss">
  .body {
    background: var(--copyRights-bg);
  }
</style>