const routes = [
    {
        path: '/login',
        name: 'Login',
        component: () => import('./views/LoginPage.vue') ,
    }
]


export default routes