
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
    {
        path: '/tdLisiting',
        name: 'tdLisiting',
        component: () => import('./views/TD-Listing-Demo.vue')
    },

]

export default routes
