
<template>
<div>
    <div v-for="(item , index) in news" :key="index">
        <div class="alert alert-danger" >
            {{item}}
        </div>

    </div>
    <scroll-loader :isLoadingOnInit="true" :isLoadMore="true"  :onScrollToEnd="getNews" >
        this is scroll Loader
    </scroll-loader>
</div>
</template>

<script>
import ScrollLoader from "../TD_infiniteScroll/TD_InfiniteScroll.vue";

    export default {
        name: 'NewsListing',
        components : {
            ScrollLoader
        } ,
        data() {
            return {
                news : [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 ] ,
                count : 0
            }
        },
        methods: {
            async getNews (){
                console.log("call done")
              await  setTimeout(()=> this.news = [...this.news , ...[`news number ${this.count}`, `news number ${this.count+1}`,] ]  , 50)
              this.count = this.count+2;
            }
        },
        mounted(){
            this.getNews()
        }
    }
</script>
