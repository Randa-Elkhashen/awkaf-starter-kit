<template src="./TD_genericCard.html">
  
</template>

<script>

import "./TD_genericCard.scss"
export default {
  name: "ListingItem",
  props: {
    itemDataModel: {
      type: Object,
      required: true,
    },
    lazyLoad: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {};
  },
  mounted() {},
};
</script>
