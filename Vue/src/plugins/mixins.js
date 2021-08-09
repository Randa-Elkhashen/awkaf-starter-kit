import Vue from "vue";
import { ListingDataAPI } from "@/services/ApiService";
import { LoadOnScroll } from "./loadOnScroll";

Vue.mixin({
  computed: {
    ListingDataAPI: () => ListingDataAPI,
    LoadOnScroll: () => LoadOnScroll,
  },
});
