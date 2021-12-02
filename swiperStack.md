# stack
## on Click Thumb 
case Click thumb directly
> - onTouchEnd()
**divide Into 2 Stack**
### stack1
> - swiper.emit('tap click' , e)
> - onThumbClick
> - swiper.slideTo(index)
> - swiper.updateActiveIndex(slideIndex)
### stack2
> swiper.updateClickedSlide(e)
> swiper.slideToClickedSlide()
> **swiper.updateSlidesClasses()**
> swiper.emitSlidesClasses()

## onSwipe
onTouchEnd
slideTo
swiper.updateActiveIndex
swiper.updateSlidesClasses