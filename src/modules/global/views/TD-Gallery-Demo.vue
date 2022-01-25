<template>
<div class="container">
  <h1 class="title-description">Gallery</h1>
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
            <div class="slide-img">
                  <img  :src="slideModel.thumb" />
            </div>
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
          <div class="slide-img">
                  <img :src="slideModel.thumb" />
          </div>
        </template>
      </thumb-slider>
  </div>
</div>
</template>
<script src="./TD-galleryDemo.js" ></script>
<style  lang="scss">
.container{
  padding-top: 20px;
}
.td-generic-slider {
  background: #000;
  .slide-img{
    aspect-ratio: 3;
    width: 100%;
    display: flex;
    justify-content: center;
    background-color: lightgray;
    img {
      display: block;
      max-width: 100%;
      max-height: 100%;
      object-fit: cover;
    }
  }
  .td-generic-slider__thumbs-slider{
    .slide-img{
      aspect-ratio: 2;
    }
  }
}
</style>
