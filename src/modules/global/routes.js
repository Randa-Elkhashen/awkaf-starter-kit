
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
    {
        path: '/tdInfiniteScroll',
        name: 'tdInfiniteScroll',
        component: () => import('./views/TD-InfintedScroll-Demo.vue')
    },
    {
        path: '/tdAnimation',
        name: 'tdAnimation',
        component: () => import('./views/TD-ScrollAnimationProvider-Demo.vue')
    },

]

export default routes
