
<template>
<section v-for="( card , index ) in cards" :key="index">
            <slot :card="card" :index="index" ></slot>
</section>
</template>

<script>
import "./TD_timeline.scss"
    export default {
        name: 'TimeLine',
        props : {
            cards :{
                type : Array ,
                required : true ,
            },
        },
        data() {
            return {
            }
        },
        mounted(){
        }
    }
</script>