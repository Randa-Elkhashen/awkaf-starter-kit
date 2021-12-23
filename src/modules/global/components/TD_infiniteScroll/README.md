# TD_InfiniteScroll Component Guide

## Props

| Prop              |type /required | description                                       |
| -------------     | ------------- | -------------                                     |
| isLoadMore        |Boolean / true | to check if there is more data to fetch data      |
| onScrollToEnd     |Function / true| request that fires when reach to Data End when isLoadMore is true , else detach Loader   |
| isLoadingOnInit   |Boolean / false| to control showing Loader By Consumer best use is to send true onMount at consumer Component then call API then send False   |

## data

| attribute         |     type      | description                               |
| -------------     | ------------- | ------------------------------------------|
| isLoading         | Boolean       | to control showing Loader inside Component|

## computed data

| attribute         |     type      | description                                       |
| -------------     | ------------- | ------------------------------------------        |
| isCustomLoading   | Boolean       | if false ... default Loader Ui is Loading instead |

## Methods

| name                  | type | params | return| description                                               |
| -------------         | -----| -----  | ----- |------------------------------------------                 |
| initLoader            | sync | void   | void  |to attach onScrol listener .. just called once onMount     |
| onScrollToEndHandler  | async| void   | void  |to call request or detach loader based on isLoadMore prop  |
| renderLoaderOnRequest | async| void   | void  |to show loader element on request call                     |

## Mixins

| name         | type | return| description                                                             |
| -------------| -----| ----- |------------------------------------------                               |
| LoadOnScroll | computed  | LoadOnScrollPlugin instance  |to provide LoadOnScroll Initiator to Scroll Loader Component|

> example

- listing Component Consume Loader :

1. listing.js

```html
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
    <scroll-loader :isLoadMore="isThereIsMoreData" :onScrollToEnd="getListByStarterKitService" >
        <div class="my-ldr">
            simple loader
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </scroll-loader>
</template>
<script>
    // init bootstrap as global plugin to use in Component styling
    import axios from "axios"
    import ScrollLoader from "@/global/components/TD_infiniteScroll/TD_InfiniteScroll.vue"
    import { posts } from "@/services"
    export default {
        name : "listing" ,
        components : {
            ScrollLoader
        } ,
        data (){
            return {
                list : [] , 
                isThereIsMoreData : true
            }
        } ,
        methods : {
            async getList(){
               let res = await axios.get('https://jsonplaceholder.typicode.com/posts')
                    // handle success
                     this.list = [ ...this.list , ...res.data]
                    this.checkIsThereIsMoreData()
            } ,
            async getListByStarterKitService(){
              let res =  await posts.getAllPosts()
                 this.list = [ ...this.list , ...res.data]
                this.checkIsThereIsMoreData()
            } ,
            checkIsThereIsMoreData(){
                let isNoMoreData = false;
                if(isNoMoreData){
                    this.isMoreData = false;
                }
            }
        }
    }
</script>
```
