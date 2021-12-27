<template>
  <div  class="td-listing-container">
    <div class="container">
          <Listing loader 
            :service="getData" 
            class="row"
          >
            <template v-slot="{item}" >
                  <div class="col-md-4" >
                      <list-item :itemDataModel="item" :lazyLoad="false" />
                  </div>
            </template>
              <template v-slot:loader>
                  <img   src="../../../assets/spinner.gif"/>
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
import ListItem from "@/modules/global/components/TD_genericCard/TD_genericCard.vue"
import {photos} from "@/services"
export default {
  name: 'TD-Listing-Demo',
  components : {
    Listing ,
    ListItem ,
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
