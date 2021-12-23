
<template>
    <div v-if="isLoading" class="text-center">
            <div class="my-ldr">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
    </div>
    <div v-show="!isLoading">
            <slot ></slot>
    </div>
   
</template>

<script>
import {AsyncHandler} from "@/plugins"
import { ref } from '@vue/reactivity'

export default {
    name: 'TD_LoaderProvider',
    setup(){
        const isLoading = ref( false )
        AsyncHandler.addRequestEventListener(( requestState )=>{
            isLoading.value = requestState
        })
        return {isLoading}
    }
}
</script>
