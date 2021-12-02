import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import setHttpDefaults from './services/http-defaults'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import {load} from "./modules/test/testLoader"


import { configure } from 'vee-validate';
// Default values
// configure({
//   validateOnBlur: true, // controls if `blur` events should trigger validation with `handleChange` handler
//   validateOnChange: true, // controls if `change` events should trigger validation with `handleChange` handler
//   validateOnInput: true, // controls if `input` events should trigger validation with `handleChange` handler
//   validateOnModelUpdate: true, // controls if `update:modelValue` events should trigger validation with `handleChange` handler
// });

 const app = createApp(App)
 app.use(router)
 app.use(store)
 app.mount('#app')
 setHttpDefaults()
//  load()

export default app;
