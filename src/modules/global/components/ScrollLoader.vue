
<template>
<div>
      <div v-show="isLoading || isLoadingOnInit" class="listing-loader text-center" >
          <!-- put your Ui Loader here -->
          <slot></slot>
      
      </div>
      <!-- loader starts -->
      <div id="observer"></div>
      <!-- loader starts -->
</div>
</template>

<script>
import loaderMixin from "../mixins/loaderMixin"
    export default {
        name: 'ScrollLoader',
        mixins : [loaderMixin] , 
        props : {
            isLoadMore : {
                type : Boolean , 
                // default : false 
            } ,
            onScrollToEnd : {
                type : Function , 
            } , 
            isLoadingOnInit : {
                type : Boolean ,
                default : false ,
            }
        } ,
        data() {
            return {
                isLoading:false ,
            }
        },
        methods:{
            initLoader(){
                this.LoadOnScroll.initLoadingOnScroll( this.onScrollToEndHandler )
                this.LoadOnScroll.attachLoader()
            } ,
            async onScrollToEndHandler(){
                console.log("loader is LoadMore :" ,this.isLoadMore )
               if(this.isLoadMore)
                 await this.renderLoaderOnRequest(this.onScrollToEnd , )
                else {
                    this.LoadOnScroll.detachLoader()
                }
            } ,
            async renderLoaderOnRequest( request ){
                        this.isLoading = true;
                        await request()
                        this.isLoading = false;
            } ,
        } , 
        mounted(){
            this.initLoader()
        } ,
    }
</script>
