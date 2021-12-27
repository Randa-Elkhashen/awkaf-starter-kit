
<template>
<section class="td-generic-timeline container-fluid" v-for="( card , index ) in list" :key="index">
        <div class="td-generic-timeline__row">
            <h3 class="td-generic-timeline__row__title">2020</h3>
            <div  class="td-generic-timeline__row__card row"
            :class="[ index%2  ? 'justify-content-end' : 'justify-content-start']"
            >
                <div class="col-md-6 col-12"   >
                            <slot></slot>
                </div>
            </div>
        </div>
</section>
</template>

<script>
import "./TD_timeline.scss"
import aos from "aos";
    export default {
        name: 'TimeLine',
        props : {

        },
        data() {
            return {
                list : Array(3).fill("dummy text")
            }
        },
        mounted(){
            aos.init();
        }
    }
</script>