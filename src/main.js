import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { setHttpDefaults } from '@/services'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import initValidationsCustomDefaultMessage from "./modules/global/components/TD_validations/validationsConfig"
initValidationsCustomDefaultMessage();
 const app = createApp(App)
 app.use(router)
 app.use(store)
 app.mount('#app')
 setHttpDefaults()

export default app;
