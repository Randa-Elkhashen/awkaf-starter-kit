
<template>
<div v-bind="animationOptionsModel "   >
        <div class="animation-provider" :class="[ solveMarginColllabse ? 'solve-margin-collabse' : '']">
            <slot ></slot>
        </div>
</div>
</template>

<script>
const defaultAnimationModel = {
    "data-aos" : "fade-up", 
    // "data-aos-offset": 0,
    // "data-aos-delay": 0     ,
    // "data-aos-duration":400 ,
    // "data-aos-easing":"ease" ,
    // "data-aos-mirror":false ,
    // "data-aos-once":false, 
    // "data-aos-anchor-placement":"top-center",
};
    export default {
        name: 'ScrollAnimation',
        props : {
            aosAnimation : {
                type : [Object , Boolean] , 
                default : ()=> {}
            } ,
            overrideDefault: {
                type : Boolean ,
                default : false ,
            } ,
            customClass : {
                type : String ,
            } ,
            solveMarginColllabse: {
                type : Boolean , 
                default : false ,
            }
        } ,
        computed:{
            animationOptionsModel(){
                if(this.overrideDefault)
                    return  this.aosAnimation;
                let model = Object.assign({ ...defaultAnimationModel } , this.aosAnimation )
                return model;
                } ,
        } ,
    }
</script>
<style lang="scss" scoped>
    .animation-provider{
        // overflow: hidden;
        &.solve-margin-collabse{
            overflow-y: auto;
            overflow-x: hidden;
        }
    }
</style>
