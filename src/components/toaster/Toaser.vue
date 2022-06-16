<template>
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div ref="toaster" id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <!-- <img src="..." class="rounded me-2" alt="..."> -->
      <strong class="me-auto">Bootstrap</strong>
      <small>11 mins ago</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
  </div>
</div>
</template>

<script>
import { Toast } from "bootstrap"
export default {
    props: ['toasterText' , 'show'],
    emits:['shown' , 'closed'] ,
    data() {
      return {
        toast:undefined ,
      }
    },
    mounted() {
      this.toast = new Toast(this.$refs.toaster);
      this.$refs.toaster.addEventListener("shown.bs.toast" , ()=> this.$emit('shown') )
      this.$refs.toaster.addEventListener("hidden.bs.toast" , ()=> this.$emit('closed') )
    },
    watch:{
        show(){
            if(this.show){
                this.toast.show()
            }else {
                this.toast.hide()
            }
        }
    }
}
</script>

<style>

</style>