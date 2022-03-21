import { setHttpDefaults } from '@/services'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import initValidationsCustomDefaultMessage from "./modules/global/components/TD_validations/validationsConfig"
initValidationsCustomDefaultMessage();
import { loadComponents } from './components-loader'

setHttpDefaults()
loadComponents();