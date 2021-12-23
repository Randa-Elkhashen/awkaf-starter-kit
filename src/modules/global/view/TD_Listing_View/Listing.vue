<template>
  <Listing loader  >
      <template v-slot="{item}" >
        <list-item :itemDataModel="item" />
      </template>
        <template v-slot:loader>
            <!-- <img src="./assets/spinner.gif"/> -->
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
import Listing from "@/modules/global/components/TD_listing_modified/TD_Listing.vue"
import ListItem from "@/modules/global/components/TD_genericCard_modified/TD_GenericCard.vue"
import LazyCard from "@/modules/global/components/TD_GenericLazyCard/TD_GenericLazyCard.vue"
export default {
    components : {
        Listing,
        ListItem,
        LazyCard
    }
}
</script>

<style>

</style>