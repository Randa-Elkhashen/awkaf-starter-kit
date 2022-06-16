<template>
  <div>
    <LanguageSwitcher v-if="langSwitcher" />
    <slot></slot>
    <Toaster
      v-if="toast"
      @closed="isError = false"
      :show="isError"
      :toasterText="'something went wrong'"
    />
  </div>
</template>

<script>
import Toaster from "../toaster/Toaser.vue";
import LanguageSwitcher from "../TD_Languages/TD_Languages.vue"
export default {
    name:"Provider" ,
    props:{
        toast:{
            type:Boolean ,
            default : false ,
        },
        langSwitcher:{
            type:Boolean ,
            default : false ,
        }
    },
    components: {
       Toaster ,
       LanguageSwitcher
    },
    data() {
      return {
        isError : false ,
      }
    },
    errorCaptured(){
      this.isError = true;
      return false;
    },
}
</script>
