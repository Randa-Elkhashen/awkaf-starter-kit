import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { setHttpDefaults } from '@/services'
import 'bootstrap'

import i18n from './locals/i18n.js';

const app = createApp(App)
app.use(router)
app.use(store)
app.use(i18n)
app.mount('#app')
setHttpDefaults()

export default app;
