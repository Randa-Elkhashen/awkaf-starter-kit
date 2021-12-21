<template>
<Form>
    <!--  field with yupRequired starts-->
    <Field name="username" :rules="yupRequired" />
    <ErrorMessage name="username" />
    <!--  field with yupRequired ends-->

    <!--  field with globalIsRequired starts-->
    <Field name="username2" :rules="globalRequired" />
    <ErrorMessage name="username2" />
    <!--  field with globalIsRequired ends-->

    <!--  field with BuiltInRequired starts-->
    <Field name="username3" :rules="builtInRequired" />
    <ErrorMessage name="username3" />
    <!--  field with BuiltInRequired ends-->

    <!--  field with customRequired starts-->
    <Field name="username4" :rules="customRequired" />
    <ErrorMessage name="username4" />
    <!--  field with customRequired ends-->

  </Form>
</template>
<script>
import { Field, Form, ErrorMessage } from 'vee-validate';
import { required , length } from "@vee-validate/rules"
import { string , addMethod }  from "yup"
      addMethod( string, "customRequired" , function( message ) {
        return this.test("customRequired", message, function(value) {
          debugger
            const { path, createError } = this;
                          if (value && value.trim()) {
                return true;
              }
              return createError();
        });
    });
export default {
  components: {
    Field,
    Form,
    ErrorMessage,
  },
  data() {
        // let customYup = addMethod( string , "customRequired" , (message)=>{
        //   debugger
        //     return (value , prev) => {
        //       debugger
        //       if (value && value.trim()) {
        //         return true;
        //       }
        //       return 'This is custom isRequired rule';
        //     }
        // });
      return {
        yupRequired : string().customRequired("custom yup") ,
        globalRequired : "required" ,
      }
  },
  methods: {
    customRequired(value) {
      if (value && value.trim()) {
        return true;
      }
      return 'This is custom isRequired rule';
    },
    builtInRequired : required
  },
};
</script>
