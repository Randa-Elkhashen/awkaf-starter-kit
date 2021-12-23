
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
        path: '/tdloader',
        name: 'tdloader',
        component: () => import('./views/TD-loaderProvider-Demo.vue')
    },
    {
        path: '/tdtimeline',
        name: 'tdtimeline',
        component: () => import('./views/TD-ScrollAnimationProvider-Demo.vue')
    },
    {
        path: '/tdAnimation',
        name: 'tdAnimation',
        component: () => import('./views/TD-ScrollAnimationProvider-Demo.vue')
    },
    {
        path: '/tdLisiting',
        name: 'tdLisiting',
        component: () => import('./views/TD-Listing-Demo.vue')
    },
    {
        path: '/tdLisiting2',
        name: 'tdLisiting2',
        component: () => import('./views/TD-Listing-Demo2.vue')
    },
    {
        path: '/listing',
        name: 'Listing',
        component: () => import('./views/TD_Listing_View/Listing.vue')
    },

]


export default routes

