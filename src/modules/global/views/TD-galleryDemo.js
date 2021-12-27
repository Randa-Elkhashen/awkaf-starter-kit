import Slider from "../components/TD_gallery/TD_Slider.vue"
import ThumbSlider from '../components/TD_gallery/TD_ThumbsSlider.vue';
import { Thumbs , Navigation, FreeMode } from "swiper";
import "swiper/modules/free-mode/free-mode.min.css";
import "swiper/modules/navigation/navigation.min.css";
import "../components/TD_gallery/TD_gallery.scss"
import images from "@/mocking-data/images.json"
export default {
  name: "MainGalarySlider",
  components: {
    Slider,
    ThumbSlider
  },
  data() {
    return {
      thumbs: null,
      images : images ,
      swiperParams : {
        } , // for more params go to https://swiperjs.com/swiper-api#parameters
      swiperModules : {
        modules: [
          Thumbs,
        ],
        modulesProps: {
            },
      } ,
      thumbsConfig : {
          swiperParams : {
            watchSlidesProgress:true ,
            slidesPerView: 2, // default in no breakpoints
            spaceBetween: 10 ,// default in no breakpoints
            breakpoints: {
              // when window width is >= 320px
              320: {
                slidesPerView: 2,
                spaceBetween: 10
              },
              // when window width is >= 480px
              768: {
                slidesPerView: 4,
                spaceBetween: 10
              },
              // when window width is >= 640px
              1024: {
                slidesPerView: 6,
                spaceBetween: 10
              }
            } // for less than 320 default will be applied
          } , // for more params go to https://swiperjs.com/swiper-api#parameters
          swiperModules: {
            modules: [
              Navigation,
              FreeMode ,
            ],
            modulesProps: {
              navigation:true ,
              // navigation: {
              //   nextEl : ".swiper-button-next" ,
              //   prevEl : ".swiper-button-prev" ,
              // } ,  // for custom props go to https://swiperjs.com/swiper-api#navigation
            },
          },// for more modules go to https://swiperjs.com/swiper-api#modules

      }
    };
  },
  methods: {
    setMainSliderThumb(swiper){
      this.thumbs = swiper;
    } ,
  },
};