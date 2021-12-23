<template>
  <div class="nap-listing-container">
    <div class="container">
      <Listing
        loader
        :service="getData"
        :updateNextCallServiceParams="updateNextCallServiceParams"
        :serviceParams="serviceParams"
        class="row"
      >
        <template v-slot="{ item }">
          <div class="col-md-4">
            <list-item :itemDataModel="item" />
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
  </div>
</template>

<script>
import Listing from "@/modules/global/components/TD_listing/TD_Listing.vue";
import ListItem from "@/modules/global/components/TD_genericCard/TD_GenericCard.vue";
import { photos } from "@/services";
export default {
  name: "TD-Listing-Demo2",
  components: {
    Listing,
    ListItem,
  },
  data() {
    return {
      listingCallIndex: 1,
    };
  },
  computed: {
    serviceParams() {
      return [this.listingCallIndex];
    },
    getData() {
      return photos.getAlbumById.bind(photos);
    },
  },
  methods: {
    updateNextCallServiceParams() {
      ++this.listingCallIndex;
    },
  },
};
</script>
