import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import router from "../router/router"
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import "@/plugins/mixins";
import LazyLoadDirective from "./directives/LazyLoadDirective";


Vue.directive("lazyload", LazyLoadDirective);

Vue.config.productionTip = false
Vue.use(VueRouter)


new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

