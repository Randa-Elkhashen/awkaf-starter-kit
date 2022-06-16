<template>
  <div
    class="generic-laoder"
    :class="{
      'is-full-page': genericLoaderInfo.isFullPage,
      'is-full-element': genericLoaderInfo.isFullElement,
    }"
    :style="{ 'background-color': genericLoaderInfo.backgroundColor }"
  >
    <!-- Start imported Image -->
    <img
      v-if="genericLoaderInfo.imgSrc"
      :src="genericLoaderInfo.imgSrc"
      alr="loader"
    />
    <!-- End imported Image -->

    <!-- Start Default Image -->
    <img v-else src="../../assets/logo.png" alr="loader" />
    <!-- End Default Image -->

    <slot name="generic_laoder_text"> Loading ... </slot>
  </div>
</template>

<script>
export default {
  name: "Generic_Loader",
  props: ["genericLoaderInfo"],
};
</script>
