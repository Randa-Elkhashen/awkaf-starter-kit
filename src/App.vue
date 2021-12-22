<template>
 <Header/>
 <!-- <listing /> -->
  <router-view></router-view>
</template>
<script>
import Header from "@/modules/global/components/header/Header.vue"
// import Listing from "./Views/Listing.vue"
export default {
  name: 'App',
  components : {
    Header ,
    // Listing,
  }
}
</script>