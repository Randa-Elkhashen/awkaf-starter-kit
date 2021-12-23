<template>

  <section class="generic-gallery-slider">
  <div class="thumb-example" >
    <main-galary-slider :images="images" :thumbsSwiper="thumbs" />
    <thumb-slider @thumbsMounted="setMainSliderThumb" :images="images" />
  </div>
  </section>
</template>
<script>
import MainGalarySlider from "./MainGalarySlider.vue"
import ThumbSlider from "./ThumbSlider.vue"
import images from "@/mocking-data/images.json"
import "./TD_gallery.scss"
export default {
  name: 'Galary',
  components: {
    MainGalarySlider,
    ThumbSlider ,
  },
    data() {
    return {
      thumbs: null,
      images : images ,
    };
  },
  methods: {
      setMainSliderThumb(swiper){
        console.log("parent updated" ,swiper)
        this.thumbs = swiper;
      } ,

  },
  mounted() {

    },
}
</script>
