<template>
<scroll-animation-provider>
  <div class="container">
      <div v-for="(val , index) in 50" :key="index" class="row justify-content-between">
          <div class="col-6 ">
            <scroll-animation class="w-100" :class="[index%2 ==0 ? 'd-none' : '']" :aosAnimation="getAnimationType(index)" >
                <div class="card"></div>
            </scroll-animation>
          </div>
            <div class="col-6">
                <scroll-animation class="w-100" :class="[index%2 == 1 ? 'd-none' : '']" :aosAnimation="getAnimationType(index)" >
                    <div class="card"></div>
                </scroll-animation>
          </div>
      </div>
  </div>
  </scroll-animation-provider>
</template>

<script>
import ScrollAnimationProvider from "@/modules/global/components/TD_scrollAnimationProvider/TD_ScrollAnimationProvider.vue"
import ScrollAnimation from "@/modules/global/components/TD_scrollAnimation/TD_ScrollAnimation.vue"
export default {
  name: 'TD-Listing-Demo',
  components : {
    ScrollAnimationProvider ,
    ScrollAnimation
  },
      data() {
        return {
        }
    },
    computed : {

    },
  methods : {
      getAnimationType(index){
        switch( (index+1) % 20 ){
          case 1 : 
            return {'data-aos' : 'fade-up', }
          case 2 : 
            return {'data-aos' : 'fade-down', }
          case 3 : 
            return {'data-aos' : 'fade-right', }
          case 4 : 
            return {'data-aos' : 'fade-left', }
          case 5 : 
            return {'data-aos' : 'fade-up-right', }
          case 6 : 
            return {'data-aos' : 'fade-up-left', }
          case 7 : 
            return {'data-aos' : 'fade-down-right', }
          case 8 : 
            return {'data-aos' : 'fade-down-left', }
          case 9 : 
            return {'data-aos' : 'flip-left', }
          case 10 : 
            return {'data-aos' : 'flip-right', }
          case 11 : 
            return {'data-aos' : 'flip-up', }
          case 12 : 
              return {'data-aos' : 'flip-down', }
          case 13 : 
            return {'data-aos' : 'zoom-in', }
          case 14 : 
            return {'data-aos' : 'zoom-in-up', }
          case 15 : 
            return {'data-aos' : 'zoom-in-down', }
          case 16 : 
            return {'data-aos' : 'zoom-in-left', }
          case 17 : 
            return {'data-aos' : 'zoom-in-right', }
          case 18 : 
            return {'data-aos' : 'zoom-out', }
          case 19 : 
            return {'data-aos' : 'zoom-out-up', }
          case 20 : 
            return {'data-aos' : 'zoom-out-down', }


        }
      }
  }
}
</script>
<style lang="scss">
body{
  background: #3F51B5;
  padding-top: 600px;
  }
.card{
  border: 10px solid white;
  width: 100%;
  max-width: 350px;
  height: 150px;
  margin: auto;
  margin-bottom: 250px;
  background: #202746;
  &.card--odd{
  margin-top: 250px;
  margin-bottom: 0;
  }
}

</style>
