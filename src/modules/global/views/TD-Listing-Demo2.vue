<template>
  <div class="td-listing-container">
    <div class="container">
      <h1 class="title-description">Infinite Scroll Option 2 to pass Props </h1>
      <Listing
        loader
        :service="getData"
        :updateNextCallServiceParams="updateNextCallServiceParams"
        :serviceParams="serviceParams"
        class="row"
      >
        <template v-slot="{ item }">
          <div class="col-md-4">
            <list-item :itemDataModel="item" :lazyLoad="false" />
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
import Listing from "@/modules/global/components/TD_listing_feature/TD_Listing.vue";
import ListItem from "@/modules/global/components/TD_genericCard/TD_genericCard.vue"
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

