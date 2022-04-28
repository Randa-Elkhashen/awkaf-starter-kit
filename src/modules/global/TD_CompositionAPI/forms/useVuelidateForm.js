import useVuelidate from "@vuelidate/core"
import { reactive } from "vue"
const useAddField = (field , rule , state)=>{
    const [fieldKey , fieldValue ] =  Object.entries(field)[0];
    console.log(fieldKey , fieldValue)
    state.form[fieldKey] = fieldValue;
    state.rules[fieldKey] = rule;
}
const useAddForm = (form , rules , state )=>{
    for (const field in form) {
        state.form[field] = form[field]
    }
    for (const rule in rules) {
        state.rules[rule] = rules[rule]
    }
}
export default function useForm(form , rules ){
    const state = reactive({ form , rules });
    const  v$  = useVuelidate(state.rules ,state.form , { $autoDirty: true });
    const addField = (field , rule)=> useAddField(field , rule , state);
    const addForm = (form , rules ) => useAddForm( form , rules , state);
    return { form:state.form , v$ , addField, addForm }
}
