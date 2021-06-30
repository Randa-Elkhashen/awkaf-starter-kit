<!-- Needed NPM Installs -->
<!-- npm i vue-awesome-swiper@4.1.1 swiper@4.5.0 -->

<template>
    <section class="generic-slider">
        <swiper ref="awesomeSwiperGeneric" :options="swiperOptionGeneric">
            <swiper-slide v-bind:key="index" v-for="(item, index) in 5">
            <div class="generic-slider__details">
                <div class="generic-slider__img">
                <img src="https://picsum.photos/id/320/1024/768" />
                </div>
                <div class="generic-slider__caption">
                <h4>Classic Credit Card Banque misr offers</h4>
                <p>Credit limit starting from EGP 100000000</p>
                </div>
            </div>
            </swiper-slide>
        </swiper>
    </section>
</template>

<style lang="scss">
    @import './src/assets/sass/SliderComponent';
</style>

<script>
import { Swiper, SwiperSlide } from "vue-awesome-swiper";
import "swiper/dist/css/swiper.css";

export default {
    components: {
        Swiper,
        SwiperSlide
    },
    data: function() { 
      return {
       swiperOptionGeneric: {
        pagination: {
          el: ".swiper-pagination",
          dynamicBullets: true,
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        loop: false,
        slidesPerView: 4,
        spaceBetween: 30,
        allowTouchMove: true,
        centeredSlides: false,
        breakpoints: {
          768: {
            slidesPerView: 4,
            spaceBetween: 20
          },
          500: {
            slidesPerView: 1.08,
            spaceBetween: 10,
            centeredSlides: true
          },
        },
      },
        loop: true,
        loopedSlides: 5, // looped slides should be the same
        spaceBetween: 10,
        centeredSlides: true,
        slidesPerView: 6,
        touchRatio: 0.2,
        slideToClickedSlide: true,
        speed: 800,
        breakpoints: {
            500: {
                slidesPerView: 4,
            }
        }
      }
    },
    methods: {},
    computed: {},
    mounted() {
      // Reinit Slider

      this.$refs.awesomeSwiperGeneric.destroySwiper();
      this.$refs.awesomeSwiperGeneric.initSwiper();

    }
}
</script>