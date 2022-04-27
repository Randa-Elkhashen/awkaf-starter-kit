import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { setHttpDefaults } from '@/services'
import 'bootstrap'
import LazyLoadDirective from "./directive/LazyLoadDirective";
import initValidationsCustomDefaultMessage from "./modules/global/components/TD_validations/validationsConfig"
initValidationsCustomDefaultMessage();
 const app = createApp(App)
 app.use(router)
 app.use(store)
 app.directive('lazyload', LazyLoadDirective)
 app.mount('#app')
 setHttpDefaults()

 export default app;
