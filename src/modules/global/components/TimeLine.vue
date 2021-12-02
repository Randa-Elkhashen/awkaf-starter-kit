
<template>
<section class="time-line container-fluid" v-for="( card , index ) in list" :key="index">
    <animation-provider  :animation="{'data-aos' : 'fade-down' } ">
        <div class="time-line__row">
            <h3 class="time-line__row__title">2020</h3>
            <div  class="time-line__row__card row"
            :class="[ index%2  ? 'justify-content-end' : 'justify-content-start']"
            >
                <div class="col-md-6 col-12"   >
                    <animation-provider :animation="index%2 ? {'data-aos' : 'fade-left' } : {'data-aos' : 'fade-right' }" >
                        <time-line-card />
                    </animation-provider>
                </div>
            </div>
        </div>
    </animation-provider>
</section>
</template>

<script>
import AnimationProvider from './AnimationProvider.vue'
import TimeLineCard from './TimeLineCard.vue'
    export default {
  components: { 
      AnimationProvider ,
      TimeLineCard
      },
        name: 'TimeLine',
        data() {
            return {
                list : Array(3).fill("dummy text")
            }
        },
        mounted(){
            
        }
    }
</script>
<style lang="scss" >
.time-line{
    margin-bottom: 4px;
    .time-line__row{
        .time-line__row__card{
            position: relative;
            &::before{
                display: inline-block;
                content: "";
                position: absolute;
                height: 100%;
                left: 50%;
                top: 0;
                transform: translate(-50% , 0);
                border-left: 1px solid red;
            }
        }
        .time-line__row__title{
            color: red;
            display: inline-block;
            position: relative;
            left: 50%;
            transform: translate(-50%, 0);
        }
    }
}
</style>