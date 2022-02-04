<template>
  <swiper ref="swiperContainer"
    v-bind="swiperOptionsModel"
    :modules="swiperModules.modules"
    v-on="events"
  >
    <swiper-slide
      v-for="(image, index) in images"
      :key="index"
    >
        <slot name="slide" :slideModel="image" ></slot>
    </swiper-slide>
  </swiper>
</template>
<script src="./TD_slider.js" ></script>


