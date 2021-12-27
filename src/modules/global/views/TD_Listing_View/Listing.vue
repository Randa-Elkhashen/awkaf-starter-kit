<template src="./listing.html">
</template>

<script>
import Listing from "@/modules/global/components/TD_listing_feature/TD_Listing.vue"
import ListItem from "@/modules/global/components/TD_genericCard/TD_genericCard.vue"
import {photos} from "@/services"
export default {
  name: 'TD-Listing-Demo',
  components : {
    Listing,
    ListItem
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
  }
}
</script>
