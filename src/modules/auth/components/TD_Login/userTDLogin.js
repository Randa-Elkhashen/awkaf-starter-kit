
import { useForm , useField } from 'vee-validate';
import { isRef , reactive , toRefs , toRef , ref } from 'vue';
import {object , string }  from 'yup';

export default function useTDLogin(){

    const schema = object({
    email: string().required("user name is required"),
    password: string().required().min(8),
    });
    
    const {errors , handleSubmit  } = useForm({ validationSchema: schema, });
    const { value: email } = useField('email');
    const { value: password } = useField('password');
    // const username = ref({
    //     value : useField('username').value,
    //     error : useField('username').errorMessage,
    // });
    // const password = ref( {
    //     value : useField('password').value ,
    //     error : useField('password').errorMessage ,
    // });
    // const form = reactive({ username , password })
    return { form : reactive({
        errors ,
        email , 
        password
    }) ,
    handleSubmit ,
};
}