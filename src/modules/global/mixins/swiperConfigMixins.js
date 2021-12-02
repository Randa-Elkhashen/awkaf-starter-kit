import { ErrorMessage } from "../plugins/util";

//#region modules
// import Swiper core and required modules
import * as modules from "swiper"
// install Swiper modules
// SwiperCore.use([FreeMode ,Navigation, Thumbs , Autoplay , Pagination , Lazy]);
//#endregion

export const modulesProps = {
  Navigation : {
    propName : "navigation" ,
    default : true ,
    customOptions : {
      disabledClass : 'swiper-button-disabled' , 
      hiddenClass : 'swiper-button-hidden' ,
      hideOnClick : false ,
      lockClass : 'swiper-button-lock' , 
      nextEl  : null, // selector
      prevEl : null  // selector
    }
  } ,
  Pagination : {
    propName : "pagination" , 
    default : true ,
    customOptions : {

    }
  } ,
  Autoplay : {
    propName : "autoplay" , 
    default : true ,
    customOptions : {

    }
  }
};
export const ALL_MODULES = Object.freeze({
  Pagination : "Pagination" , 
  Navigation : "Navigation" ,
  Autoplay : "Autoplay"
})
export const SWIPER_PROPS_OPTIONS_VALUES = 
Object.freeze({
 slidesPerView : {
   auto :  "auto"
 } ,
 grid : {
   fill : {
     column : "column" , 
     row : "row" ,
   }
 }
});
export  const swiperBaseMixin = {
   props : {
    images : {
        type : Array , 
        required : true ,
    } ,
  } ,
   data() {
     return {
       swiperConfig : {
        requiredConfig:{
          isMultiSlide : false ,
        } ,
        optionalProps : {
          tag : "div" ,
          wrapperTag : "div" ,
          // spaceBetween : 10 , 
          // slidesPerView : 1 ,  
          // slidesPerGroup : 1 , // default 1
          // loop : false ,
          // loopedSlides: 1 , // default : null ,
        } , 
        mainSliderEvents : {
          realIndexChange : this.handleActiveChange
        } ,
       }
     }
   },
  computed : {
    swiperOptionsModel(){
      let model =  {...this.swiperConfig.optionalProps , slidesPerView : this.slidesPerView ,
         ...this.swiperModules.modulesProps , ...this.swiperParams }
         console.log(model)
      return model;
    } ,
    slidesPerView(){
      return this.swiperConfig.requiredConfig.isMultiSlide ? this.swiperConfig.optionalProps.slidesPerView : 1
    } ,
  },
  methods: {
    initModules(){
      for (const module of this.swiperModules.modules) {
        this.swiperConfig.optionalProps.modules.push(modules[module]) 
        this.swiperConfig.optionalProps[modulesProps[module].propName] = modulesProps[module].default ?
        modulesProps[module].default : modulesProps[module].customOptions
        console.log(module , ": ", this.swiperConfig.optionalProps)
      }
    } ,
    handleActiveChange(swiper){
      swiper.updateSlidesClasses()
      console.log("call")
    } ,
    isNotCompatable(){
     if( this.swiperConfig.optionalProps.loop &&  this.swiperConfig.optionalProps.grid.rows > 1){
       throw new ErrorMessage(["swiper grid rows > 1  not Compatible with Loop"]);
     }
    if( (this.swiperConfig.optionalProps.slidesPerView > 1 || this.swiperConfig.optionalProps.slidesPerView == SWIPER_PROPS_OPTIONS_VALUES.slidesPerView.auto)
       &&  !this.swiperConfig.optionalProps.watchSlidesProgress ){
       throw new ErrorMessage(["watchSlidesProgress should be Enabled or slidesPerView to be 1"]);
     }
     return "";
    } ,
    checkRequiredConfigs(){
      let {isMultiSlide , isHaveThumbs } = this.swiperConfig.requiredConfig
      if( !isMultiSlide )
       throw new ErrorMessage(["isMulitSlide attribute in requiredConfig is Missing"]);
      if( !isHaveThumbs )
      throw new ErrorMessage(["isHaveThumbs attribute in requiredConfig is Missing"]);
    } ,
  },
  mounted() {
    console.log("main mixin mounting")
    this.isNotCompatable()
  },
};
export const swiperConsumeThumbMixin = {
  props : {
    thumbsSwiper : {
      type : [Object , null] ,
      required : true
    } 
  } ,
  watch : {
    thumbsSwiper(newThumb, oldThumb){
      console.log("watched swiper", newThumb)
      this.swiperModules.modulesProps.thumbs = { swiper : newThumb };
    }
  } ,
}

export default  swiperBaseMixin;
