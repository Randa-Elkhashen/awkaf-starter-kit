<template>
<!-- <Test :testProp="'works'" /> -->
 <Header/>
  <!-- <Listing :loadOnScroll="true" />  -->
  <news-listing></news-listing>
  <!-- <galary /> -->
  <!-- <Form /> -->
  <!-- <form-vee-validate /> -->
  <router-view></router-view>
  <footer class="footer">
    <h1>this is footer header</h1>
  </footer>
  <!-- <time-line></time-line> -->
</template>

<script>
import Header from "@/modules/global/components/Header.vue"
import Listing from "@/modules/global/components/Listing.vue"
import Test from './modules/test/test.vue'
import Galary from './modules/global/components/Galary.vue'
import TimeLine from './modules/global/components/TimeLine.vue'
import Form from './modules/global/components/Form.vue'
import FormVeeValidate from './modules/global/components/Form-VeeValidate.vue'
import NewsListing from "./modules/global/components/NewsListing.vue"
export default {
  name: 'App',
  components : {
    Header ,
    Listing ,
    Test,
    Galary,
    TimeLine,
    Form,
    FormVeeValidate,  
    NewsListing
  }
}
</script>