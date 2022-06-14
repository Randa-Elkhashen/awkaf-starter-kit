// import globalRoutes from '../modules/global/routes'
// import authRoutes from "../modules/auth/routes"
// export const routes = [...globalRoutes , ...authRoutes]

export const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import(/* webpackChunkName: "home" */'../views/Home.vue')
    },
]
