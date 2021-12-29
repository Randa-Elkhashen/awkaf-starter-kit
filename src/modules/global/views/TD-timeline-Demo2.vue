<template>
<div class="container td-generic-timeline-wrapper td-generic-timeline-wrapper--type2 td-listing-container">
<Listing
        loader
        :service="getData"
        class="td-generic-timeline-wrapper__spacer" 
      >
        <template v-slot="{ item  , index}">
            <div class="td-generic-timeline">
                <div class="td-generic-timeline__row">
                  <div data-aos="zoom-in-up"  >
                        <span class="td-generic-timeline__row__node"  ></span>
                  </div>
                  <div  data-aos='fade-up'
                     data-aos-delay="200">
                    <div  class="td-generic-timeline__row__card  row justify-content-between"
                    :class="[ index%2  ? 'td-generic-timeline__row__card--reverse' : '']"
                    >
                        <div class="col-md-6 col-12 td-generic-timeline__row__card__article" >
                          <h1>this is dummy title</h1>
                          <p>this is dummy description </p>
                        </div>
                        <div class="col-md-6 col-12 td-generic-timeline__row__card__image" >
                            <time-line-card :itemDataModel="item"  />  
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
</div>
</template>

<script>
import "../components/TD_timeLine/TD_timelineType2.scss"
import TimeLineCard from '../components/TD_genericCard/TD_genericCard.vue';
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
