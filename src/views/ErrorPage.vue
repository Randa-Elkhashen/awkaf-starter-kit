<template>
  <PopupComponent
    :isPopup="false"
    :popupInformation="popupInformation"
    @button1Clicked="button1Clicked"
  >
    <template v-slot:popup_body>
      <div>
        <!-- Success / error Image -->
        <img :src="errorImg" />
      </div>
      <section
        class="d-flex flex-column justify-content-center align-items-center"
      >
        <p class="text">لم يتم ايجاد الصفحه</p>
      </section>
    </template>
  </PopupComponent>
</template>

<script>
import PopupComponent from "../components/PopupComponent/PopupComponent.vue";
import errorImg from "../assets/Images/404Error.jpg";

export default {
  name: "ErrorPage",
  components: {
    PopupComponent,
  },
  data() {
    return {
      errorImg: errorImg,
      popupInformation: {
        button1Text: "العوده الي الصفحه الرئيسيه",
      },
    };
  },
  methods: {
      button1Clicked() {
          alert("clicked");
      }
  }
};
</script>