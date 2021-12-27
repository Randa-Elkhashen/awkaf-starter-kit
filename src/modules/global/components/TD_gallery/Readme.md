# TD Gallery Guide

## SwiperBaseMixin
- uses :
    - use it for each slider u need to provide basic functionality of swiper
- props 
    - images 
        - type : Array
        - required
    - swiper Params
        - type : Object 
        - not required 
        - default : {
          loop : true , 
          spaceBetween:10 ,
          slidesPerView:1 ,
          }
        - for more params go to https://swiperjs.com/swiper-api#parameters
    - swiperModules 
        - type : Object 
        - not required 
        - must have two attributes (modules : type Array , modulesProps : type Object )
    - events 
        - type : Object 
        - not required 
        - must have event name as Key , event handler as Value
    - bindSwiperWithThumbs 
        - type : Boolean
        - default : false 
    - thumbsSwiper 
        - to bind swiper with thumb swiper
        - type : Object
        - required when bindSwiperWithThumbs prop is true

- computed 
    - swiperOptionsModel
        - to provide swiper configration that comes from modules props + swiperParams

- watch 
    - thumbsSwiper
        - to bind main swiper by  thumbs swiper when  bindSwiperWithThumbs is true

- mounted 
    - call isNotCompatable method to check all required Props.
## TD_Slider
- mixins : swiperBaseMixin
- Components 
    - swiper , swiper-slide
- slots 
    - name : slide 
    - scoped by : slideModel
- uses 
    - to provide 

# TD_ThymbsSlide Guide
- Components 
    - TD_Slider
- slots 
    - name : slide 
    - scoped by : slideModel
- computed : 
    - eventModel 
        - type : Object
        - dependencies events prop
        - return : events model with initalizing swiper event handler 
- methods : 
    - onThumbSwiperMounted
        - is swiper event handler 
        - it emits thumbsMounted event  when thumbs swiper initalized
        - u can listen to thumbsMouted event to set main swiper thumb property with swiper thumb

## TD_Gallery
