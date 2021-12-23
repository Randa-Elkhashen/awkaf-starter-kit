
<template>

    <!-- loader starts -->
    <div ref="observer">
        <div  v-show="isLoading || isLoadingOnInit" class="listing-loader text-center" >
            <!-- default loader -->
            <div v-if="!isCustomLoading " >
                    <div class="my-ldr">
                        <div class="spinner-border" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
            </div>
            <!-- put your Ui Loader here -->
            <slot v-else ></slot>
        </div>
    </div>
    <!-- loader starts -->
</template>

<script>
import loaderMixin from "./TD_infiniteScroll.mixin";
import "./TD_infiniteScroll.scss";
import {ref } from "vue"
    export default {
        name: 'ScrollLoader',
        mixins : [loaderMixin] , 
        props : {
            isLoadMore : {
                type : Boolean , 
                // default : false 
                required : true ,
            } ,
            onScrollToEnd : {
                type : Function , 
                required : true 
            } , 
            isLoadingOnInit : {
                type : Boolean ,
                default : false ,
            }
        } ,
        setup() {
                const observer = ref(null);
                return { observer }
        } ,
        data() {
            return {
                isLoading:false ,
            }
        },
        methods:{
            initLoader(){
                this.LoadOnScroll.initLoadingOnScroll( this.onScrollToEndHandler )
                this.LoadOnScroll.attachLoader(this.observer)
            } ,
            async onScrollToEndHandler(){
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
        computed : {
            isCustomLoading (){
                if(!this.$slots.default)
                    return false;
                return this.$slots.default()[0].children.length;
            }
        },
        mounted(){
            this.initLoader()
        } ,
    }
</script>
