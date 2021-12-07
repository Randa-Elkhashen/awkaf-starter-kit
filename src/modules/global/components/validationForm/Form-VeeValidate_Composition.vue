
<template>
  <div>
    <input v-model="value" type="text" />
    <span>{{ errorMessage }}</span>
  </div>

</template>

<script>
import { useField } from 'vee-validate';
    export default {
        name: 'Form-VeeValidate_Composition',
        setup(props) {
            const isRequired = (value)=> {
                if(value && value.trim()){
                     return  true;
                }
                return "this is required field";
            }
             const minChar =  (value) => {
                if( value && value.length > 8){
                   return true
                }
                return "min 8 digit";
            }
            const userNameValidators = [ isRequired , minChar ]

            const userNameValidation = ( value )=>{
               return userNameValidators.reduce( ( isFieldValid , validator ) => {
                    return isFieldValid === true ? validator(value) : isFieldValid
                }  , true )
            } 
            // const isRequired = (value)=> {
            //     if(value && value.trim()){
            //          this.valid = true;
            //          this.message = this.isRequired.message
            //     }
            //     return this;
            // }
            //  const minChar =  (value) => {
            //     if(value.length <= 8){
            //         this.valid=true
            //         this.message = this.minChar.message
            //     }
            //     return this;
            // }
            // const userNameValidation = {
            //     isRequired : {
            //         validator :  (value)=> {
            //             debugger
            //             if(value && value.trim()){
            //                 this.valid = true;
            //                 this.message = this.isRequired.message
            //             }
            //             return this;
            //         } ,
            //         message : "this is required field"
            //     } ,
            //     minChar : {
            //         validator : (value) => {
            //             if(value.length <= 8){
            //                 this.valid=true
            //                 this.message = this.minChar.message
            //             }
            //             return this;
            //         },
            //         message : "min 8 char" ,
            //     },
            //     valid : false ,
            //     message : null ,
            //     validator(value){
            //         this.isRequired.validator(value).minChar.validator(value)
            //         return this.valid || this.message
            //     }
            // }
            const {errorMessage , value } = useField("username" , userNameValidation )
            return {
                errorMessage ,
                value ,
            }
        },
        mounted(){
            
        }
    }
</script>
