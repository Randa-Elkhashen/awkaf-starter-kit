<template>
  <timeline  class=" container-fluid"  :cards="list" v-slot="{ card , index }" >
      <div class="td-generic-timeline">
            <div class="td-generic-timeline__row">
              <h3 class="td-generic-timeline__row__title">2020</h3>
                <div  class="td-generic-timeline__row__card row"
                :class="[ index%2  ? 'justify-content-end' : 'justify-content-start']"
                :data-aos="index%2 ? 'fade-left' : 'fade-right'"
                >
                    <div class="col-md-6 col-12"   >
                              <time-line-card :model="card" />  
                    </div>
                </div>
            </div>
      </div>
  </timeline>
</template>

<script>
import Timeline from "../components/TD_timeLine/TD_TimeLine.vue"
import TimeLineCard from './TD_TimeLineCard.vue';
import aos from "aos";
import 'aos/dist/aos.css';

export default {
  name: 'TD-Listing-Demo',
  components : {
    Timeline ,
    TimeLineCard
  },
      data() {
        return {
                list : Array(10).fill("dummy text")
        }
    },
    computed : {

    },
    mounted() {
            aos.init();
    },
}
</script>
