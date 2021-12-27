import { ErrorMessage } from "@/plugins";
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
    swiperParams : {
      type : Object , 
      default : ()=>({
          loop : true , 
          spaceBetween:10 ,
          slidesPerView:1 ,
          }) , // for more params go to https://swiperjs.com/swiper-api#parameters
    },
    swiperModules : {
        type : Object , 
        required : true, 
    } ,
    events : {
        type : Object ,
        default : {}
    },
    images : {
        type : Array , 
        required : true ,
    } ,
    bindSwiperWithThumbs : {
      type : Boolean ,
      default : false , 
    } ,
    thumbsSwiper : {
      type : Object
    }
  } ,
  computed : {
    swiperOptionsModel(){
      let modulesProps
      if(!this.swiperModules.modulesProps.thumbs)
          modulesProps = Object.assign(  this.swiperModules.modulesProps , { thumbs : {swiper : null }} )
      else 
          modulesProps = this.swiperModules.modulesProps
      let model =  {...modulesProps , ...this.swiperParams ,  }
      return model;
    } ,
  },
  methods: {
    isNotCompatable(){
     if( this.swiperOptionsModel.loop &&  this.swiperOptionsModel.grid.rows > 1){
       throw new ErrorMessage(["swiper grid rows > 1  not Compatible with Loop"]);
     }
    if( (this.swiperOptionsModel.slidesPerView > 1 || this.swiperOptionsModel.slidesPerView == SWIPER_PROPS_OPTIONS_VALUES.slidesPerView.auto)
       &&  !this.swiperOptionsModel.watchSlidesProgress ){
       throw new ErrorMessage(["watchSlidesProgress should be Enabled or slidesPerView to be 1"]);
     }
     return "";
    } ,
    checkIsThumbSwiperProvided(){
      if( this.bindSwiperWithThumbs && !this.thumbsSwiper )
          throw new Error("thumbsSwiper Prop is required ")
    }
  },
  watch : {
    thumbsSwiper( newThumb  ){
      if(this.bindSwiperWithThumbs){
          this.swiperModules.modulesProps.thumbs = { swiper : newThumb };
      }
          
    }
  } ,
  mounted() {
    this.isNotCompatable()
  },
};

export default  swiperBaseMixin;
