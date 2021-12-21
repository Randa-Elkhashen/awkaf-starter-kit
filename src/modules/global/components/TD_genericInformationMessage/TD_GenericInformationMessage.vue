
<template>
      <div class="generic-error-msg" >
          <div class="icon">
            <i class="icon-inbox"></i>
          </div>
          <p class="error-title">
              <slot></slot>
          </p>
          <a v-bind:href="goHome"><i class="icon-home"></i>HomePagelbl</a>
      </div>
</template>

<script>
    export default {
        name: 'TD_GenericInformationMesssage.vue',
        props : {
            goHome : {
                type : String  ,
                default: "/"
            } ,
        } ,
        mounted(){
            
        }
    }
</script>
