<template>
  <Generic_Loader :genericLoaderInfo="genericLoaderInfo">
    <template v-slot:generic_laoder_text>
      <p>Loading Additional Text</p>
    </template>
  </Generic_Loader>
</template>

<script>
import Generic_Loader from "./Generic_Loader.vue";
import LoaderImage from "../../assets/Images/loader.gif";

export default {
  name: "Example_Loader",
  components: { Generic_Loader },
  data() {
    return {
      genericLoaderInfo: {
        isFullPage: false,
        isFullElement: true,
        backgroundColor: `#0000ff78`,
        imgSrc: LoaderImage,
      },
    };
  },
};
</script>