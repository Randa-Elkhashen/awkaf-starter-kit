
import { useForm , useField } from 'vee-validate';
import { isRef , reactive , toRefs , toRef , ref } from 'vue';
import {object , string }  from 'yup';
import validations from '@/modules/global/components/TD_validations/TD_Validations';

export default function useTDContactUs(){
    validations.init();
    const schema = object({
    email: string().required().email("please enter a valid email"),
    name : string().required(),
    phone: string().required().isPhone("please provide a valid phone"),
    message : string().required().max(500) ,
});
    const {errors , handleSubmit  } = useForm({ validationSchema: schema, });
    const { value: email } = useField('email');
    const { value: name } = useField('name');
    const { value: phone } = useField('phone');
    const { value: message } = useField('message');
    return { form : reactive({
        errors ,
        name ,
        email ,
        phone ,
        message
    }),
    handleSubmit ,
};
}