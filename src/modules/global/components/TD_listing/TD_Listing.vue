<template>
  <div>
    <!-- errorMessage  -->
  <error-message :goHome="goHome" v-if="!GenericListingData.length && isInitialFetchDone" >
          <slot name="emptyMessage"></slot>
  </error-message>
  <!-- listing -->
        <div :class="[listWrapperClass]" v-else >
                    <slot  :key="index" v-for="(item, index) in GenericListingData" :item="item" :index="index" ></slot>
        </div>
      <!-- loader -->
      <scroll-loader v-if="loader"
      :onScrollToEnd="getData" 
      :isLoadMore="isThereMoreData" 
      >
      <slot name="loader"></slot>
      </scroll-loader>
  </div>
</template>
<script>
import ErrorMessage from "../TD_genericInformationMessage/TD_GenericInformationMessage.vue"
import ScrollLoader from "../TD_infiniteScroll/TD_InfiniteScroll.vue"
export default {
  components: {
    ErrorMessage ,
    ScrollLoader ,
  },
  props : {
    loader : {
      type : Boolean , 
      default : false ,
    } ,
    service : {
      type : Function
    },
    serviceParams : {
      type : Array ,
      default : ()=> []
    },
    updateNextCallServiceParams : {
      type : Function , 
      default : ()=>{}
    },
    class : {
      type : String , 
      default : ""
    }
  } ,
  data: function () {
    return {
      goHome: "",
      GenericListingData: [],
      isThereMoreData: true,
      isInitialFetchDone : false ,
    };
  },
  computed : {
    listWrapperClass(){
      return this.class;
    } ,
  },
  methods: {
    getData: async function () {
      let res = await this.service(...this.serviceParams)
      this.isInitialFetchDone = true;
      if(res?.data)
        this.onRequestSuccess(res.data)
    },
    checkRequiredProps(){
      if(this.loader){
        if(!this.service)
          throw new Error("service Function is required Props")
        if(this.serviceParams &&  !this.updateNextCallServiceParams)
          throw new Error("updatenNextCallServiceParams Function is required Props")
      }
    } ,
    onRequestSuccess(data){
      if (data && data.length) {
        this.GenericListingData = [...this.GenericListingData , ...data]
        this.updateNextCallServiceParams(data)
        } else {
          this.isThereMoreData = false;
        }
    } ,
    onRequestFail(/*e*/){
    } ,
  },
};
</script>