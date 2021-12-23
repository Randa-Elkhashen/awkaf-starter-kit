<template>
     <div class="items-wrapper">
        <div class="item"  v-for="(item , index) in list" :key="index" >
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Well done!</h4>
                <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
                <hr>
                <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
            </div>
        </div>
    </div>

    <!-- loader -->
    <scroll-loader :isLoadMore="isMoreData" :onScrollToEnd="getListByStarterKitService" >
        <div class="my-ldr">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </scroll-loader>
    <!-- loader -->
</template>
<script>
    // init bootstrap as global plugin to use in Component styling
    import axios from "axios"
    import ScrollLoader from "@/modules/global/components/TD_infiniteScroll/TD_InfiniteScroll.vue"
    import {  users } from "@/services"
    export default {
        name : "listing" ,
        components : {
            ScrollLoader
        } ,
        data (){
            return {
                list : [] , 
                isMoreData : true ,
            }
        } ,
        methods : {
            async getList(){
               let res = await axios.get('https://jsonplaceholder.typicode.com/users')
                    // handle success
                     this.list = [ ...this.list , ...res.data]
                    this.checkIsThereIsMoreData()
            } ,
            async getListByStarterKitService(){
              let res =  await users.getAllUsers()
                 this.list = [ ...this.list , ...res.data]
                this.checkIsThereIsMoreData()
            } ,
            checkIsThereIsMoreData(){
                let isNoMoreData = true;
                if(!isNoMoreData){
                    this.isMoreData = false;
                }
            }
        }
    }
</script>