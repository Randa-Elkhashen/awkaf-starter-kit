<template>
<div>
  <!-- default information Message -->
  <div v-if="!isCustomUi">
    <div class="generic-error-msg">
      <div class="icon">
        <i class="icon-inbox"></i>
      </div>
      <p class="error-title">
      </p>
      <a v-bind:href="goHome"><i class="icon-home"></i>HomePage</a>
    </div>
  </div>
  <!-- put your Ui Loader here -->
  <slot v-else></slot>
</div>
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
