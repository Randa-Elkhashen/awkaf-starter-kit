
import { useForm , useField } from 'vee-validate';
import { isRef , reactive , toRef , ref } from 'vue';
import {object , string }  from 'yup';

export default function useTDLogin(){

    const schema = object({
    username: string().required("user name is required"),
    password: string().required().min(8),
    });
    useForm({ validationSchema: schema, });
    // const { value: username , errorMessage: usernameError } = useField('username');
    // const { value: password, errorMessage: passwordError } = useField('password');
    const username = reactive({
        value : useField('username').value ,
        error : useField('username').errorMessage ,
    });
    const password = reactive({
        value : useField('password').value ,
        error : useField('password').errorMessage ,
    });
    const test = ref({count : 0})
    // const formState = toRef( form );
    
    console.log(isRef(username))
    debugger
    return { username , password };
}