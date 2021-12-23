<template>
<!--  -->
  <swiper
    v-bind="swiperOptionsModel"
    :modules="swiperModules.modules"
    v-on="mainSliderEvents"
    class="swiper gallery-top"
  >
    <swiper-slide
      class="main-slide"
      v-for="(image, index) in images"
      :key="index"
      @click="openFullScreen(index)"
    >
      <div class="item">
        <img :src="image.thumb" />
      </div>
    </swiper-slide>
  </swiper>
  <div>
    <!-- all props & events -->
    <!-- <vue-easy-lightbox
      v-bind="fullScreen.options"
      :imgs="images"
    >
    </vue-easy-lightbox> -->
    <CustomLightBox 
      :items="images" 
      :index="fullScreenIndex"
      :slideshow = 'false'
      :enableWheelEvent = 'true'
      dir="ltr"
      ref="light"
      @close="fullScreenIndex = null">
    </CustomLightBox>
  </div>
</template>
<script>
import { Swiper, SwiperSlide } from "swiper/vue/swiper-vue";
import { ErrorMessage } from "@/plugins";
import swiperBaseMixin, {
  ALL_MODULES,
  modulesProps,
  SWIPER_PROPS_OPTIONS_VALUES,
  swiperConsumeThumbMixin
} from "./TD_galary.mixin";
import CustomLightBox from "../TD_lightBox/TD_LightBox.vue";
import {
  FreeMode,
  Navigation,
  Thumbs,
  Autoplay,
  Pagination,
  Lazy,
  EffectFade,
  Scrollbar,
} from "swiper";

//#region styles
// Import Swiper styles
import "swiper/swiper-bundle.css";
import "swiper/modules/free-mode/free-mode.min.css";
import "swiper/modules/navigation/navigation.min.css";
import "swiper/modules/thumbs/thumbs.min.css";
import "swiper/modules/pagination/pagination.min.css";
import "swiper/modules/lazy/lazy.min.css";
//#endregion
export default {
  name: "MainGalarySlider",
  mixins: [swiperBaseMixin , swiperConsumeThumbMixin],
  components: {
    Swiper,
    SwiperSlide,
    CustomLightBox ,
  },
  data() {
    return {
      swiperParams : {
        loop : true , 
        spaceBetween:10 ,
        slidesPerView:1 ,
      } , // for more params go to https://swiperjs.com/swiper-api#parameters
      swiperModules: {
        modules: [
          Pagination,
          Navigation,
          Autoplay,
          Thumbs,
          Scrollbar,
          FreeMode,
        ],
        modulesProps: {
          // pagination: true, // for custom props go to https://swiperjs.com/swiper-api#pagination
          // navigation: true, // for custom props go to https://swiperjs.com/swiper-api#navigation
          // scrollbar: true, // for custom props go to https://swiperjs.com/swiper-api#scrollbar
          // autoplay: true, // for custom props go to https://swiperjs.com/swiper-api#autoplay
          freemode: true, // for custom props go to https://swiperjs.com/swiper-api#free-mode
          // grid: {
          //   fill: SWIPER_PROPS_OPTIONS_VALUES.grid.fill.column,
          //   rows: 1,
          // }, // for custom props go to https://swiperjs.com/swiper-api#free-mode
          thumbs : { swiper : null }
        },
      },// for more modules go to https://swiperjs.com/swiper-api#modules
      fullScreenIndex: null,
      mainSliderEvents: {
        realIndexChange: this.handleActiveChange,
        swiper : this.initSwiper
      },
      fullScreen: {
        options: {
          scrollDisabled: true,
          escDisabled: false,
          moveDisabled: true,
          visible: false,
          index: this.fullScreenIndex,
          loop: true,
          swipeTolerance: 50,
        },
        events: {
          hide: this.handleHide,
        },
      },
    };
  },
  methods: {
    handleActiveChange(swiper) {
      // swiper.updateSlidesClasses();
      // console.log("call");
    },
    initSwiper(swiper ){
      this.swiper = swiper;
      // this.swiper.slideTo(3)
    } ,
    openFullScreen(index) {
      this.fullScreenIndex = index;
    },
    show() {
      this.fullScreen.options.visible = true;
    },
    handleHide() {
      this.fullScreen.options.visible = false;
    },
  },
};
</script>
<style lang="scss" scoped>
  .generic-gallery-slider .swiper.gallery-top {
     height: initial; 
    }
</style>
