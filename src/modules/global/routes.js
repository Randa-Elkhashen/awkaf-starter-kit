
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
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
]

export default routes
