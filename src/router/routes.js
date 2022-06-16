// import globalRoutes from '../modules/global/routes'
// import authRoutes from "../modules/auth/routes"
// export const routes = [...globalRoutes , ...authRoutes]

export const routes = [
    {
        path: '/Home',
        name: 'Home',
        component: () => import(/* webpackChunkName: "home" */'../views/Home.vue')
    },
    {
        path: '/ErrorPage',
        name: 'ErrorPage',
        component: () => import(/* webpackChunkName: "home" */'../views/ErrorPage.vue')
    },
]
