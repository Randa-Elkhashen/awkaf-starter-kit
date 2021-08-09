<!-- Needed NPM Installs -->
<!-- npm i axios vue-multiselect v-calendar@1.0.0 -->

<template>
<h1>Hamada</h1>
</template>

<style lang="scss">
@import "./src/assets/sass/ListingPageComponent";
@import "./src/assets/sass/NapGenericCard.scss";
</style>

<script>



export default {
  components: {
    // Multiselect,
  },
  data: function () {
    return {
      genericData: [],
      scrollCount: 1,
      showNoDataMessage: true,
      isAjaxLoading: false,
      isthierMoreData: true,
      goHome: "",
      selectedDate: {
        start: null,
        end: null,
      },
      dropdownData: ["all", "past", "current", "upcoming"],
      dropdownValue: "",
    };
  },

};
</script>