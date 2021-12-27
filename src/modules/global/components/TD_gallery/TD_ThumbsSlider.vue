<template>
<slider :images="images" :events="eventModel" :swiperParams="swiperParams" 
:swiperModules="swiperModules"
>
    <template v-slot:slide="{ slideModel }" >
               <slot name="slide" :slideModel="slideModel" ></slot>
    </template>
</slider>
</template>
<script src="./TD_thumbsSlider.js" ></script>
