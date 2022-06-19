<template>
  <div
    class="generic-popup d-flex justify-content-center align-items-center"
    :class="{ popup: isPopup }"
  >
    <div
      class="
        generic-popup_container
        d-flex
        flex-column
        justify-content-center
        align-items-center
      "
    >
      <div class="close-popup">
        <span
          v-if="popupInformation ? popupInformation.closeIcon : false"
          @click="closePopup"
        >
          {{ popupInformation.closeIcon }}
        </span>
      </div>
      <div>
        <div
          class="
            popup-body
            d-flex
            flex-column
            justify-content-center
            align-items-center
          "
        >
          <slot name="popup_body"></slot>
        </div>

        <div
          class="popup-footer d-flex justify-content-center align-items-center"
        >
          <button
            class="button back"
            v-if="popupInformation ? popupInformation.button1Text : false"
            @click="button1Clicked"
          >
            {{ popupInformation.button1Text }}
          </button>
          <button>{{$t("message.test")}}</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Popup",
  props: ["isPopup", "popupInformation"],
  data() {
    return {};
  },
  computed: {},
  methods: {
    closePopup() {
      this.$emit("closePopup", true);
    },
    button1Clicked() {
      this.$emit("button1Clicked", true);
    },
  },
};
</script>

<style lang="scss" src="./PopupComponent.scss"></style>