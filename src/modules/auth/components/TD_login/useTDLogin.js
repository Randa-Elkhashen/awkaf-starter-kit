
import { useForm , useField } from 'vee-validate';
import { isRef , reactive , toRefs , toRef , ref } from 'vue';
import {object , string }  from 'yup';

export default function useTDLogin(){
    const schema = object({
    email: string().required().email("please enter a valid email"),
    password: string().required().min(6),
    });
    const {errors , handleSubmit  } = useForm({ validationSchema: schema, });
    const { value: email } = useField('email');
    const { value: password } = useField('password');
    return { form : reactive({
        errors ,
        email , 
        password
    }) ,
    handleSubmit ,
};
}