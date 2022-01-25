<template>
    <h1>hello from lightbox</h1>
    <div class="container">
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
            :style="{ backgroundImage: 'url(' + image + ')' }"
          ></div>
      </div>
    </div>
</template>

<script>
import TDLightBox from "../components/TD_lightBox/TD_LightBox.vue"
import {photos} from "@/services";
export default {
  name: 'TD-Listing-Demo',
  components : {
      TDLightBox
  },
      data() {
        return {
          items : [],
          index : null ,
        }
    },
    mounted() {
      photos.getAlbumById(1)
     .then(res =>{
       this.items = res.data.map(imageItem => imageItem.url)
       console.log(this.items)
     }  )
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
