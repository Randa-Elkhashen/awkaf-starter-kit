import { setLocale } from 'yup';
 const initValidationsCustomDefaultMessage = ()=>{
    setLocale({
        mixed: {
            required: '${path} is required',
            },
    });
}
export default initValidationsCustomDefaultMessage;