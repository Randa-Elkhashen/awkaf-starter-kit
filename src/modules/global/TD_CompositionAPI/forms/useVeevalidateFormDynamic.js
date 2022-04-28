// todo in future as dynamic
import { useForm , useField , useFieldArray} from 'vee-validate';
import { reactive , watch , toRefs , ref  , isRef , computed , watchEffect} from 'vue';
import {object , string , ref as yupRef ,  array, mixed , AnySchema }  from 'yup';

import validations from '@/modules/global/components/TD_validations/TD_Validations';

export default function useTDRegister(){
    validations.init();
    let schema = ref(object({
    photo: string().isPhoto("please upload your photo"),
    email: string().required("email is required").email("please enter a valid email"),
    name : string().required("user name is required") ,
    password: string().required("password is required").min(6),
    confirmPassword: string().required("retype your password").oneOf([yupRef('password')] , "password must match"),
    phone: string().required().isPhone("please provide a valid phone"),
    // addresses : array( string().optional().min(25) ),
    address : string().required() ,
    date : string().required(),
    country : mixed().required(),
    gender : string().required(),
    nationalID : string().when("country", {
        is : country => country && country.value !='egypt' ,
        then : (schema)=> schema.required().length(14) ,
    }),
    nationalNumber : string().when("country", {
        is : country => country && country.value =='egypt' ,
        then : (schema)=> schema.required() ,
    }).length(14),
}))

    const schemaForm = computed(()=>{
        const schemaForm = useForm({ 
            validationSchema: schema.value,
            });
        return schemaForm
    })
    const dynamicInput = ref({});
    const addDynamicField = (fieldName , validation )=>{
        if(schema.value.fields.test)
            return;
        const fieldSchema = object({
            test: string().required("test is required"),
        })
        schema.value = schema.value.concat( fieldSchema );
        dynamicInput.value.test = ""
    }
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
    const onSuccess = ref(null)
    const onFail = ref(null)
    const onsubmit = ref(schemaForm.value.handleSubmit( (values)=> 
            onSuccess.value(values), 
        ({values , errors , results})=> 
            onFail.value({values , errors , results})
        ) )
    watch(dynamicInput , ()=>{
      onsubmit.value = schemaForm.value.handleSubmit( (values)=> 
            onSuccess.value(values)
        , ({values , errors , results})=> 
            onFail.value({values , errors , results})
        )
    })
    const form = computed(()=>{
        return reactive({
            errors:schemaForm.value.errors ,
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
            nationalNumber ,
            ...dynamicInput.value
        })
    })

    watch( form ,  () => {
            console.log("watchers",form)
      } , {deep : true });

    return { form ,
    // pushAddress : push ,
    // popAddress : remove , 
    onSuccess ,
    onFail , 
    onsubmit , 
    addDynamicField
};
}