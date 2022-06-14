<template>
    <div class="td-languages">
        languages
        <button @click="swipe" >swiper</button>
    </div>
</template>

<script>
/* 
    Switch between Languages AR and EN
    Default Language is EN
*/
let direction = localStorage.getItem('direction'); // null: for first time only
if ( !direction || direction == 'true' ){
  import("../../assets/sass/main-ltr.scss");
} else {
  import("../../assets/sass/main-rtl.scss");
}

export default {
    name: "TD_Languages",
    data() {
        return {
            direction:  !direction ||  direction == 'true' ,
        }
    },
    methods: {
        swipe() {
            this.direction = !this.direction;
            console.log(this.direction)
            localStorage.setItem("direction" , this.direction);
            console.log("after",this.direction)
            location.reload();
        }
    }
}
</script>