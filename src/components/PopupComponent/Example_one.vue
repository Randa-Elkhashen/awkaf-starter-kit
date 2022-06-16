<template>
  <!-- Success and Error Messages -->
  <PopupComponent
    :isPopup="true"
    :popupInformation="popupInformation"
    @closePopup="closePopup"
    @button1Clicked="button1Clicked"
  >
    <template v-slot:popup_body>
      <div>
        <!-- Success / error Image -->
        <img :src="successErrorIcon" />
      </div>
      <section
        class="d-flex flex-column justify-content-center align-items-center"
      >
        <p class="text">تم التعديل</p>
        <p class="success">بنجاح</p>
      </section>
    </template>
  </PopupComponent>
</template>

<script>
import PopupComponent from "./PopupComponent.vue";

export default {
  name: "Example_one",
  props: ["successErrorIcon"],
  components: {
    PopupComponent,
  },
  data() {
    return {
      popupInformation: {
        closeIcon: "TTTT",
        button1Text: "العوده إلى  الملف الشخصى"
      },
    };
  },
  methods: {
    closePopup() {
      alert("closed");
    },
    button1Clicked() {
        alert("button1Clicked");
    }
  },
};
</script>