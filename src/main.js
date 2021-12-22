import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import setHttpDefaults from './services/http/http-defaults'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'



 const app = createApp(App)
 app.use(router)
 app.use(store)
 app.mount('#app')
 setHttpDefaults()
//  load()

export default app;
