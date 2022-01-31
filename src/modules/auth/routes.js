const routes = [
    {
        path: '/login',
        name: 'Login',
        component: () => import('./views/LoginPage.vue') ,
    },
    {
        path: '/forgotpassword',
        name: 'ForgotPassword',
        component: () => import('./views/ForgotPasswordPage.vue') ,
    },
    {
        path: '/resetPassword',
        name: 'resetPassword',
        component: () => import('./views/ResetPasswordPage.vue') ,
    }
    
]


export default routes