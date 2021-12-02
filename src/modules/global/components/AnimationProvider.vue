
<template>
<div v-bind="animationOptionsModel " >
    <slot></slot>
</div>
</template>

<script>
    // @import "~aos.scss";
// import 'aos/dist/aos.css';
let options = {
  offset: 120,
  disable: false,
  once: false,
  startEvent: 'DOMContentLoaded',
  throttleDelay: 99,
  debounceDelay: 50,
  disableMutationObserver: false,
};
import aos from "aos";

const defaultAnimationModel = {
    "data-aos" : "fade-up", 
    "data-aos-offset": 0,
    "data-aos-delay": 0     ,
    "data-aos-duration":400 ,
    "data-aos-easing":"ease" ,
    "data-aos-mirror":false ,
    "data-aos-once":false, 
    "data-aos-anchor-placement":"top-center",
};
    export default {
        name: 'AnimationProvider',
        props : {
            animation : {
                type : [Object , Boolean] , 
                required : true , // init default model
            } ,
        } ,
        computed:{
            animationOptionsModel(){
                if(this.animation === true)
                    return  defaultAnimationModel;
                if(this.animation){
                    let model = Object.assign({...defaultAnimationModel} , this.animation )
                    return model;
                }
                return ""
                }
        } ,
        mounted(){
            aos.init()
        }
    }
</script>
<style lang="scss" scoped>
    @import "~aos/dist/aos.css";
</style>
