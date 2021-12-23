<template>
<div class="card-wrapper">
    <div  class="card-wrapper__card ">
            <div class="card-wrapper__card__content" >
                 this is simple card  
            </div>
    </div>
</div>
</template>

<script>
    export default {
        name: 'TimeLineCard',
        computed : {
 
        } ,
        mounted(){
        }
    }
</script>
<style lang="scss" scoped>
        .card-wrapper {
            width: 100%;
            position: relative;
            &:before {
            display: block;
            content: "";
            width: 100%;
            padding-top: 0.5* 100%;
            }
            // padding-top: 50%;
            // border: 2px solid wheat;
            // background-color: rgba($color: darkblue, $alpha: 0.7) ;
            .card-wrapper__card{
                position: absolute;
                // height: 50%;
                height: 100%;
                width: 100%;
                top: 0;
                left: 0;
                display: flex;
                flex-direction: column;
                background-color: rgb(158, 51, 12);
                &.card-wrapper__card--start{
                    top: 0;
                }
                &.card-wrapper__card--end{
                    bottom: 0;
                }
            }
        }
</style>
