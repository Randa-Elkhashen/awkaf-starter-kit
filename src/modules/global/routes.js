
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
        path: '/contactUs',
        name: 'Contact Us',
        component: () => import('./views/ContactUsDemo.vue')
    },
    
]

export default routes
