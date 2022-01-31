
import { useForm , useField } from 'vee-validate';
import { reactive } from 'vue';
import {object , string , ref }  from 'yup';
export default function useTDResetPassword(){
    const schema = object({
    password: string().required("password is required").min(6),
    confirmPassword: string().required("retype your password").oneOf([ref('password')] , "password must match"),
    });
    const { errors , handleSubmit  } = useForm({ validationSchema: schema, });
    const { value: password } = useField('password');
    const { value: confirmPassword } = useField('confirmPassword');
    return { form : reactive({
        errors ,
        password , 
        confirmPassword
    }) ,
    handleSubmit ,
};
}