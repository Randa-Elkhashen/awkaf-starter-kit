<template>
<div class="td-generic-slider">
    <slider key="main-slider"
      class="td-generic-slider__main-slider"
    :swiperModules="swiperModules"
    :swiperParams="swiperParams"
    :images="images"
    :bindSwiperWithThumbs="true"
    :thumbsSwiper="thumbs"
    >
      <template v-slot:slide="{ slideModel }">
                <img :src="slideModel.thumb" />
      </template>
    </slider>
    <thumb-slider   key="thumbs-slider"
      class="td-generic-slider__thumbs-slider"
      :swiperModules="thumbsConfig.swiperModules"
      :swiperParams="thumbsConfig.swiperParams"
      :images="images"
      @thumbsMounted="setMainSliderThumb"
    >
      <template v-slot:slide="{ slideModel }" >
                <img :src="slideModel.thumb" />
      </template>
    </thumb-slider>
</div>

</template>
<script src="./TD-galleryDemo.js" ></script>
<style  lang="scss">
.td-generic-slider {
  background: #000;
  color: #000;
}
</style>
