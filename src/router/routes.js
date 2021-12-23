import authRoutes from '../modules/auth/routes'
import globalRouters from '../modules/global/routes.js'

export const routes = [...authRoutes, ...globalRouters]


