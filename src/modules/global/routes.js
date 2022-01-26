
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
    {
        path: '/',
        name: 'home',
        component: () => import('../../views/Home.vue')
    },
    {
        path: '/lightbox',
        name: 'TD-Listing-Demo1',
        component: () => import('./views/TD-lightBox-Demo.vue')
    },
    {
        path: '/lightbox2',
        name: 'TD-Listing-Demo2',
        component: () => import('./views/TD-lightBox-Demo2.vue')
    },
]

export default routes
