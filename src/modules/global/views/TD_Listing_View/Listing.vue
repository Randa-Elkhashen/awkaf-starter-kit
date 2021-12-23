<template>
  <div  class="nap-listing-container">
    <div class="container">
          <Listing loader 
            :service="getData" 
            class="row"
          >
            <template v-slot="{item}" >
                  <div class="col-md-4" >
                      <list-item :itemDataModel="item" />
                  </div>
            </template>
              <template v-slot:loader>
                <!-- <img   src="../../../../assets/spinner.gif" /> -->
                <LazyCard />
              </template>
              <template v-slot:emptyMessage>
                    <div class="alert alert-warning">
                          No Data Found
                    </div>  
              </template>
          </Listing>
      </div>
    </div>
</template>

<script>
import Listing from "@/modules/global/components/TD_listing_feature/TD_Listing.vue"
import ListItem from "@/modules/global/components/TD_genericCard_modified/TD_GenericCard.vue" 
import {photos} from "@/services"
import LazyCard from '@/modules/global/components/TD_GenericLazyCard/TD_GenericLazyCard.vue'
export default {
  name: 'TD-Listing-Demo',
  components : {
    Listing ,
    ListItem ,
    LazyCard
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
