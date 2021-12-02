
<template>
  <!-- thumbs slider starts -->
<div class="slider-container" >
<div class="swiper-button-next"></div>
  <swiper 
      v-bind="swiperOptionsModel"
      :modules="swiperModules.modules"
    class="swiper gallery-thumbs"
    @swiper="onThumbSwiperMounted"
  >
    <swiper-slide class="thumb-slide"  v-for="(image , index ) in images" :key="index">
                      <div class="slider-thumb-img">
                      <div class="item">
                      <img :src="image.thumb" />
                      </div>
                      <div class="img-thumb">
                          <i class="icon-photo"></i>
                      </div>
                  </div>
    </swiper-slide>
  </swiper>
<div class="swiper-button-prev"></div>
  </div>
  <!-- thumbs slider ends -->
</template>
<script>
import { Swiper, SwiperSlide } from "swiper/vue/swiper-vue";
import swiperBaseMixin, {
  ALL_MODULES,
  modulesProps,
  SWIPER_PROPS_OPTIONS_VALUES,
} from "../mixins/swiperConfigMixins";
//#region styles
// Import Swiper styles
import "swiper/swiper-bundle.css";
import "swiper/modules/thumbs/thumbs.min.css";
//#endregion
//#region modules
// import Swiper core and required modules
import { Thumbs , Navigation, FreeMode } from "swiper";
// install Swiper modules
//#endregion
    export default {
        name: 'ThumbSlider',
        mixins : [ swiperBaseMixin ] ,
          components: {
            Swiper,
            SwiperSlide ,
        },
      data() {
        return {
            swiperParams : {
              loop : true , 
              spaceBetween:10 ,
              slidesPerView:6 ,
              loopedSlides:50 ,
              watchSlidesProgress:true ,
            } , // for more params go to https://swiperjs.com/swiper-api#parameters
            swiperModules: {
              modules: [
                Thumbs,
                Navigation,
                FreeMode ,
              ],
              modulesProps: {
                navigation: {
                  nextEl : ".swiper-button-next" ,
                  prevEl : ".swiper-button-prev" ,
                } ,  // for custom props go to https://swiperjs.com/swiper-api#navigation
              },
            },
            thumbSliderEvents : {
              realIndexChange : this.handleActiveChange
            }
          }
        },
        methods: {
        onThumbSwiperMounted (swiper) {
                this.$emit('thumbsMounted', swiper)
            } ,
        },
    }
</script>
