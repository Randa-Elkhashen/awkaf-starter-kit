<template>
    <Listing loader  >
      <template v-slot="{item}" >
        <list-item :itemDataModel="item" />
      </template>
        <template v-slot:loader>
            <!-- <img   src="./assets/spinner.gif"/> -->
            <lazy-card />
        </template>
        <template v-slot:emptyMessage>
              <div class="alert alert-warning">
                    No Data Found
              </div>  
        </template>
    </Listing>
</template>

<script>
import Listing from "@/modules/global/components/TD_listing/TD_Listing.vue"
import ListItem from "@/modules/global/components/TD_genericCard/TD_GenericCard.vue" 
export default {
  name: 'App',
  components : {
    Listing ,
    ListItem ,
  }
}
</script>