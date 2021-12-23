import { ErrorMessage } from "@/plugins";

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
        optionalProps : {
          tag : "div" ,
          wrapperTag : "div" ,
        } , // will be shared For all Sliders , u can override it in swiper params object in each slider component
        mainSliderEvents : {
          realIndexChange : this.handleActiveChange
        } ,
       }
     }
   },
  computed : {
    swiperOptionsModel(){
      let model =  {...this.swiperConfig.optionalProps , 
         ...this.swiperModules.modulesProps , ...this.swiperParams }
      return model;
    } ,
  },
  methods: {
    initModules(){
      for (const module of this.swiperModules.modules) {
        this.swiperConfig.optionalProps.modules.push(modules[module]) 
        this.swiperConfig.optionalProps[modulesProps[module].propName] = modulesProps[module].default ?
        modulesProps[module].default : modulesProps[module].customOptions
      }
    } ,
    handleActiveChange(swiper){
      swiper.updateSlidesClasses()
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
  },
  mounted() {
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
