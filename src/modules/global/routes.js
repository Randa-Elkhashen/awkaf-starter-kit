
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
        path: '/lightbox',
        name: 'lightbox',
        component: () => import('./views/TD-lightBox-Demo.vue')
    },
    {
        path: '/lightbox2',
        name: 'lightbox2',
        component: () => import('./views/TD-lightBox-Demo2.vue')
    },
    {
        path: '/tdtimeline',
        name: 'tdtimeline',
        component: () => import('./views/TD-timeline-Demo.vue')
    },
    {
        path: '/tdtimeline2',
        name: 'tdtimeline2',
        component: () => import('./views/TD-timeline-Demo2.vue')
    },
    {
        path: '/tdLisiting1',
        name: 'tdLisiting1',
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
    {
        path: '/tdgallery',
        name: 'tdgallery',
        component: () => import('./views/TD-Gallery-Demo.vue')
    },
    {
        path: '/contactUs',
        name: 'Contact Us',
        component: () => import('./views/ContactUsDemo.vue')
    },
    
]


export default routes

