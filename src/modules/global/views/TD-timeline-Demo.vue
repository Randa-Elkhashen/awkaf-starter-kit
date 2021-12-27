<template>
  <timeline >
      <time-line-card />
  </timeline>
</template>

<script>
import Timeline from "../components/TD_timeLine/TD_TimeLine.vue"
import TimeLineCard from './TD_TimeLineCard.vue';

export default {
  name: 'TD-Listing-Demo',
  components : {
    Timeline ,
    TimeLineCard
  },
      data() {
        return {
        }
    },
    computed : {

    },
}
</script>
