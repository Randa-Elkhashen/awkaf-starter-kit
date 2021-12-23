import { createRouter, createWebHistory } from "vue-router";
import { routes } from "./routes.js";
//import store from '../store'

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router