
import { createApp } from 'vue'
import { h } from 'vue'
import test from './test.vue';

    export function load() {
        const selector = 'test';
        // Is the custom Vue root element in the DOM?
        if (!document.querySelector(selector)) {
            return;
        }

        // Create a new Vue app with the imported component

        createApp({
            render(){
               console.log( window[selector] )
               return  h(test, {
                    props: {
                    ...window[selector],
                    },
            })
        }
        }).mount(selector)
    }
