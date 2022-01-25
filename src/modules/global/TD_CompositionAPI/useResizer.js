import {ref , watchEffect } from "vue";
const useResizer = (resizeDelay)=>{
    const throttled = ref(false);
    const attachResizer = ref(false);
    const isAttached = ref(false);
    const resizeHandler = ref(null)
    const delay = ref(resizeDelay || 1000 );
    const calls = ref(0)
    const handler = (e)=>{
        if(!throttled.value){
            resizeHandler.value();
            calls.value++;
            throttled.value = true;
            setTimeout(()=>{throttled.value = false;}, delay.value)
        }
    }
    watchEffect(()=>{
        if(attachResizer.value && !isAttached.value){
            window.onresize = handler;
            isAttached.value = true;
            console.log("attached")
        }
    })
    watchEffect(()=>{
        if(typeof resizeHandler.value != 'function'){
            attachResizer.value = false;
            isAttached.value = false;
            window.onresize = null;
            console.log("reseted")
        }
    })
    return {
        attachResizer ,
        resizeHandler
    }
}
export default useResizer