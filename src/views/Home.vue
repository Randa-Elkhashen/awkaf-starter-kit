<template>
  <div>Welocme home</div>
  <div class="relative-of-this" style="position: relative;min-height: 200px;">
      <Example_LoaderVue />
  </div>

  <Example_one :successErrorIcon="popupIconSuccess" />
  <!-- <Example_one :successErrorIcon="popupIconErro" /> -->
    <div class="btn btn-primary" @click="throwAnError" >throw error </div>

</template>

<script>
import Example_LoaderVue from "../components/Generic_Loader/Example_Loader.vue";
import Example_one from "../components/PopupComponent/Example_one.vue";
import right from "../assets/Images/right.png";
import error from "../assets/Images/error.jpg";

export default {
  name: "Home",
  components: {
    Example_LoaderVue,
    Example_one
  },
  data() {
      return {
          popupIconSuccess: right,
          popupIconErro: error
      }
  },
    methods: {
    throwAnError(){
        throw new Error("throwed error by method")
    }
    },
};
</script>