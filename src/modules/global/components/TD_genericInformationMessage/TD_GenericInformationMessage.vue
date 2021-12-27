<template src="./TD_GenericInformationMessage.html">

</template>

<script>
export default {
  name: "TD_GenericInformationMesssage.vue",
  props: {
    goHome: {
      type: String,
      default: "/",
    },
  },
  computed: {
    isCustomUi() {
      if (!this.$slots.default) return false;
      return this.$slots.default()[0].children.length;
    },
  },
  mounted() {},
};
</script>
