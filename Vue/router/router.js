import VueRouter from 'vue-router'

import Home from "../src/pages/Home";
import Gallery from "../src/pages/Gallery";
import Listing from "../src/pages/Listing";
import Reports from "../src/pages/Reports";
import ContactUs from "../src/pages/ContactUs";
import genericFormValidations from "../src/pages/genericFormValidations";



const routes = [
  {
    path: "/",
    component: Home
  },
  {
    path: "/gallery",
    component: Gallery
  },
  {
    path: "/listing",
    component: Listing
  },
  {
    path: "/reports",
    component: Reports
  },
  {
    path: "/contactus",
    component: ContactUs
    },
    {
        path: "/genericFormValidations",
        component: genericFormValidations
    }
  // {
  //   path: "/food-item/:id",
  //   component: () => import("../views/foodItemDetails.vue")
  // }
];

const router = new VueRouter({
  mode: 'history',
  routes: routes
})
export default router;
