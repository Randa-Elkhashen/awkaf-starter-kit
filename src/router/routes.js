import globalRoutes from '../modules/global/routes'
import authRoutes from "../modules/auth/routes"
export const routes = [...globalRoutes , ...authRoutes]

