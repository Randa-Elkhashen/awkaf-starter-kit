
import { useForm , useField } from 'vee-validate';
import { reactive } from 'vue';
import {object , string  }  from 'yup';
import validations from './TD_Validations';
export default function useTDForgotPassword(){
    validations.init();
    const schema = object({
    emailorPhone: string().required("please enter your email or phone number").emailOrPhone("please enter a valid email or phone number"),
    });
    const { errors , handleSubmit  } = useForm({ validationSchema: schema, });
    const { value: emailorPhone } = useField('emailorPhone');
    return { form : reactive({
        errors ,
        emailorPhone , 
    }) ,
    handleSubmit ,
};
}