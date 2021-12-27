import Slider from "./TD_Slider.vue"
import swiperBaseMixin from "./TD_galary.mixin";
import "swiper/modules/thumbs/thumbs.min.css";
export default {
  name: "MainGalarySlider",
  mixins: [ swiperBaseMixin ],
  components: {
    Slider,
  },
  computed : {
      eventModel(){
          return { ...this.events , swiper : this.onThumbSwiperMounted }
      }
  } ,
  methods: {
        onThumbSwiperMounted (swiper) {
        this.$emit('thumbsMounted', swiper)
        } ,
  },
};