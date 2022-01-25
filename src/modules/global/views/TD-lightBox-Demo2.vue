<template>
    <div class="container">
    <h1 class="title-description">Lightbox Images and Videos with Caption</h1>
        <TDLightBox 
          :items="items" 
          :index="index"
          :slideshow = 'false'
          :enableWheelEvent = 'true'
          :gallery="false"
          dir="ltr"
          @close="index = null">
        </TDLightBox>
    </div>
    <div class="container">
        <div class="images-wrapper">
          <div
            class="image"
            v-for="(image, imageIndex) in items"
            :key="imageIndex"
            @click="index = imageIndex"
            :style="{ backgroundImage: 'url(' + image.thumb + ')' }"
          ></div>
      </div>
    </div>
</template>

<script>
import TDLightBox from "../components/TD_lightBox/TD_LightBox.vue"
import images from "@/mocking-data/images.json"
export default {
  name: 'TD-Listing-Demo2',
  components : {
      TDLightBox
  },
      data() {
        return {
          items : images,
          index : null ,
        }
    },
    mounted() {

    },

}
</script>
<style lang="scss" scoped>
.images-wrapper{
  background-color: wheat;
  padding: 10px;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: start;
  align-items: center;
  .image{
    cursor: pointer;
    width : 200px;
    height: 200px;
    background-size: cover;
  }
}
</style>
