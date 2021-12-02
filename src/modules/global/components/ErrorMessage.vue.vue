
<template>
      <div class="generic-error-msg" >
        <div class="icon">
          <i class="icon-inbox"></i>
        </div>
        <p class="error-title">EmptyListMessagelbl</p>
        <a v-bind:href="goHome"><i class="icon-home"></i>HomePagelbl</a>
      </div>
</template>

<script>
    export default {
        name: 'ErrorMessage.vue',
        props : {
            goHome : {
                type : String  ,
                default: "/"
            }
        } ,
        mounted(){
            
        }
    }
</script>
