import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { setHttpDefaults } from '@/services'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import LazyLoadDirective from "./directive/LazyLoadDirective";
 const app = createApp(App)
 app.use(router)
 app.use(store)
 app.directive('lazyload', LazyLoadDirective)
 app.mount('#app')
 setHttpDefaults()

 export default app;
