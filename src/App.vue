<template>
 <Header />

  <router-view />
</template>

<script>
import Header from "@/modules/global/components/header/Header.vue"

import Test from './modules/test/test.vue'
import TD_Gallery from '@/modules/global/components/TD_gallery/TD_Gallery.vue'
import TimeLine from '@/modules/global/components/TD_timeLine/TD_TimeLine.vue'
import Form from '@/modules/global/components/validationForm/Form.vue'
import FormVeeValidate from '@/modules/global/components/validationForm/Form-VeeValidate.vue'
import NewsListing from "@/modules/global/components/newsListing/NewsListing.vue"
import ListingDemo from "@/modules/global/components/listingDemo/Listing.vue"
import FormVeeValidate_Composition from "@/modules/global/components/validationForm/Form-VeeValidate_Composition.vue"
import FormDemo from "@/modules/global/components/FormDemo"
import FormDemoTwo from "@/modules/global/components/FormDemoTwo"
import Composite from "./modules/test/components/Composition.vue";
import LoaderProvider from "@/modules/global/components/TD_loaderProvider/TD_LoaderProvider.vue"

export default {
  name: 'App',
  components : {
    Header ,
    Test,
    TD_Gallery,
    TimeLine,
    Form,
    FormVeeValidate,  
    NewsListing,
    ListingDemo ,
    FormVeeValidate_Composition ,
    FormDemo ,
    FormDemoTwo,
    LoaderProvider ,
    Composite
  }
}
</script>