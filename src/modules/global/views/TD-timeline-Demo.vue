<template>
<Listing
        loader
        :service="getData"
        class="container td-generic-timeline-wrapper" 
      >
        <template v-slot="{ item  , index}">
            <div class="td-generic-timeline">
                <div class="td-generic-timeline__row">
                  <div data-aos="zoom-in-up"  >
                        <h3 class="td-generic-timeline__row__title"  >2020</h3>
                  </div>
                  <div  :data-aos="index%2 ? 'fade-left' : 'fade-right'"
                     data-aos-delay="200">
                    <div  class="td-generic-timeline__row__card row"
                    :class="[ index%2  ? 'justify-content-end' : 'justify-content-start']"
                    >
                        <div class="col-md-6 col-12" >
                            <time-line-card :itemDataModel="item" />  
                        </div>
                    </div>
                  </div>
                </div>
            </div>
        </template>
        <template v-slot:loader>
          <img src="../../../assets/spinner.gif" />
        </template>
        <template v-slot:emptyMessage>
          <div class="alert alert-warning">
            No Data Found
          </div>
        </template>
</Listing>

</template>

<script>
import "../components/TD_timeLine/TD_timeline.scss"
import TimeLineCard from './TD_TimeLineCard.vue';
import Listing from "@/modules/global/components/TD_listing_feature/TD_Listing.vue";
import { photos } from "@/services";

import aos from "aos";
import 'aos/dist/aos.css';

export default {
  name: 'TD-Listing-Demo',
  components : {
    TimeLineCard ,
    Listing,
  },
  data() {
        return {
            index : 1 ,
        }
  },
  methods : {
    getData () {
      let callIndex = this.index++;
      return photos.getAlbumById(callIndex);
    },
  },
  mounted() {
          aos.init();
  },
}
</script>
