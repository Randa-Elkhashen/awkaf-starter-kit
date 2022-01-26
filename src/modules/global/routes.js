
/**
 * Defines module routes, you can use vue-router route parameters
 * as properties in each object in routes array
 * 
 * Each route lazy loads a component if its path matches the current path. 
 */

const routes = [
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
        path: '/',
        name: 'home',
        component: () => import('../../views/Home.vue')
    },
]

export default routes

