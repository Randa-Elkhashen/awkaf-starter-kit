
import { useForm , useField , useFieldArray} from 'vee-validate';
import { reactive , toRefs , isRef ,} from 'vue';
import {object , string , ref ,  array, mixed , AnySchema }  from 'yup';
import validations from '@/modules/global/components/TD_validations/TD_Validations';

export default function useTDRegister(){
    validations.init();
    const schema = object({
    photo: string().isPhoto("please upload your photo"),
    email: string().required("email is required").email("please enter a valid email"),
    name : string().required("user name is required") ,
    password: string().required("password is required").min(6),
    confirmPassword: string().required("retype your password").oneOf([ref('password')] , "password must match"),
    phone: string().required().isPhone("please provide a valid phone"),
    // addresses : array( string().optional().min(25) ),
    address : string().required() ,
    date : string().required(),
    country : mixed().required(),
    gender : string().required(),
    nationalID : string().when("country", {
        is : country => country && country.value !='egypt' ,
        then : (schema)=> schema.required() ,
    }),
    nationalNumber : string().when("country", {
        is : country => country && country.value =='egypt' ,
        then : (schema)=> schema.required() ,
    }).max(14),
})
    const { errors , handleSubmit  } = useForm({ 
        validationSchema: schema,
     });
    const { value: photo } = useField('photo');
    const { value: email } = useField('email');
    const { value: name } = useField('name');
    const { value: password } = useField('password');
    const { value: confirmPassword } = useField('confirmPassword');
    const { value: phone } = useField('phone');
    const { value: date } = useField('date');
    const { value: country } = useField('country');
    const { value: gender } = useField('gender');
    // const { remove, push, fields:addresses } = useFieldArray('addresses');
    const { value: address } = useField('address');
    const { value: nationalID } = useField('nationalID');
    const { value: nationalNumber } = useField('nationalNumber');
    return { form : reactive({
        errors ,
        photo ,
        email , 
        name ,
        password , 
        confirmPassword ,
        phone,
        // addresses ,
        address , 
        date ,
        country ,
        gender ,
        nationalID ,
        nationalNumber
    }) ,
    // pushAddress : push ,
    // popAddress : remove , 
    handleSubmit ,
};
}