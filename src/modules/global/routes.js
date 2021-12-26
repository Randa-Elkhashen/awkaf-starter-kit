
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import('../../views/Home.vue')
    },
    {
        path: '/listing',
        name: 'Listing',
        component: () => import('./views/TD_Listing_View/Listing.vue')
    },

]


export default routes

