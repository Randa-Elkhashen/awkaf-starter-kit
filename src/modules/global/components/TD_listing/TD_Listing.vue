<template>
  <error-message :goHome="goHome" v-if="isNoDataMsg" >
          <slot name="emptyMessage"></slot>
  </error-message>
  <div v-else class="nap-listing-container">
    <div class="container">
      <div class="row">
        <div class="col-md-4" :key="index" v-for="(item, index) in GenericListingData">
          <slot  :item="item" ></slot>
        </div>
      </div>
    </div>
  
      <!-- loader -->
      <scroll-loader v-if="loader"
      :onScrollToEnd="getData" 
      :isLoadMore="isThereMoreData" 
      :isLoadingOnInit ="isLoading"
      >
      <slot name="loader"></slot>
      </scroll-loader>
  </div>
</template>
<script>
import {AsyncHandler} from "@/plugins"
import { photos } from "@/services";
import ErrorMessage from "../TD_genericInformationMessage/TD_GenericInformationMessage.vue"
import ScrollLoader from "../TD_infiniteScroll/TD_InfiniteScroll.vue"
let listingThis;
export default {
  components: {
    ErrorMessage ,
    ScrollLoader
  },
  props : {
    loader : {
      type : Boolean , 
      default : false ,
    }
  } ,
  data: function () {
    return {
      goHome: "",
      selectedDate: {
        start: null,
        end: null,
      },
      dropdownData: ["all", "past", "current", "upcoming"],
      dropdownValue: "",
      GenericListingData: [],
      isThereMoreData: true,
      isNoDataMsg: false,
      count:0 , 
      isLoading : false ,
      albumId : 1 ,
    };
  },
  methods: {
    getData: async function () {
      let res = await photos.getAlbumById(this.albumId);
      if(res.data)
        this.onRequestSuccess(res.data)
        // this.onRequestFail(e)
    },
    onRequestSuccess(data){
      if (data && data.length && this.albumId <  10) {
        this.GenericListingData = [...this.GenericListingData , ...data]
            this.albumId++;
        } else {
          this.isThereMoreData = false;
        }
        this.isNoDataMsg = false;
      if (
        this.GenericListingData == null ||
        this.GenericListingData == ""
      ) {
        this.isNoDataMsg = true;
      }
    } ,
    onRequestFail(e){
    } ,
    changeUrlParams: function (paramValue) {
      let queryParams = new URLSearchParams(window.location.search);
      if (paramValue == listingThis.dropdownValue) {
        queryParams.delete("category");
        queryParams.set("category", paramValue);
      } else {
        queryParams.delete("start-date");
        queryParams.set("start-date", listingThis.selectedDate.start);
        queryParams.delete("end-date");
        queryParams.set("end-date", listingThis.selectedDate.end);
      }
      history.replaceState(null, null, "?" + queryParams.toString());
    },
    getUrlParams: function () {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const start_date = urlParams.get("start-date");
      const end_date = urlParams.get("end-date");
      const category = urlParams.get("category");
      listingThis.selectedDate = {
        start: new Date(start_date),
        end: new Date(end_date),
      };
      listingThis.dropdownValue = category;

      let dropdownItems = document.querySelectorAll(".dropdown-item");
      dropdownItems.forEach((item) => {
        if (category == item.value) {
          item.checked = true;
        }
      });
    },
    clearDate: function () {
      listingThis.selectedDate = {
        start: null,
        end: null,
      };
    },
  },
  computed: {
    
  },
  // watch: {
  //   "selectedDate.start": function () {
  //     listingThis.changeUrlParams(listingThis.selectedDate.start);
  //     // listingThis.getData();
  //   },
  //   "selectedDate.end": function () {
  //     listingThis.changeUrlParams(listingThis.selectedDate.end);
  //   },
  //   dropdownValue: function () {
  //     if (listingThis.dropdownValue != null) {
  //       listingThis.changeUrlParams(listingThis.dropdownValue);
  //     }
  //     listingThis.scrollCount = 1;
  //     listingThis.isThereMoreData = true;
  //     // this.getData();
  //   },
  // },
  async mounted() {
    // this.isLoading = true;
    // debugger
    // this.isLoading = false;
    AsyncHandler.addRequestEventListener(( requestState )=>{
      console.log("request is calling : " , requestState)
      this.isLoading = requestState
    })
    this.isLoading = true;
    await this.getData();
    this.isLoading = false;
    listingThis = this;
    //listingThis.getUrlParams();
  },
};
</script>