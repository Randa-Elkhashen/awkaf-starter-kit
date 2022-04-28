const PASSWORD_TYPES = {
    text : "text" ,
    password : "password"
}
import { ref , computed } from "vue"
export default function usePasswordVisitbility( passwordIconClass , textIconClass) {
  const  passwordType = ref( PASSWORD_TYPES.password);
  const passwordIcon = computed(()=>{
    return passwordType.value == PASSWORD_TYPES.text ? textIconClass : passwordIconClass;
  })
 const togglePasswordVisibility = () => {
    if(passwordType.value == PASSWORD_TYPES.text)
      passwordType.value = PASSWORD_TYPES.password
    else 
      passwordType.value = PASSWORD_TYPES.text
  }
  return {
      passwordIcon , togglePasswordVisibility , passwordType 
  }
}