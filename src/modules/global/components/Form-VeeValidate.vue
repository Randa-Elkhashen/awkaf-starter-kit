
<template>
<div class="container">
  <div>
    <Form @submit="submit" :validation-schema="yupSchema"  v-slot="{ meta : { dirty : isFormDirty } }" 
    :initial-values="formInitial"
    >
      <!-- email field starts -->
    <div class="form-floating mb-3" >
      <Field validateOnInput class="form-control is-invalid" name="email" id="floatingInput" placeholder="name@example.com" />
      <label for="floatingInput">Email address</label>
      <ErrorMessage class="invalid-feedback" name="email" />
    </div>
      <!-- email field ends -->
      <!-- userName Field starts -->
    <div class="form-floating mb-3" >
      <Field  class="form-control is-invalid" name="username" id="floatingUserName" placeholder="username"/>
      <label for="floatingUserName">User Name</label>
      <ErrorMessage class="invalid-feedback" name="username" />
    </div>
      <!-- userName Field ends -->

      <!-- <div>
      <Field name="password" type="password" />
      <ErrorMessage class="invalid-feedback" name="password" />
      </div>
      <div>
      <Field class="form-select" name="language" as="select" >
        <option selected disabled >Open this select menu</option>
        <option>Ar</option>
        <option>En</option>
      </Field>
      <Field name="field" as="select">
  <option>Coffee</option>
  <option>Tea</option>
  <option>Coke</option>
</Field>
      <select class="form-select" name="asd" id="asd" >
        <option selected disabled >Open this select menu</option>
        <option>Ar</option>
        <option>En</option>
      </select>
      <ErrorMessage class="invalid-feedback" name="password" />
      </div> -->
      <div>
          <button :disabled="!isFormDirty" >Submit</button>
      </div>
    </Form>
  </div>
</div>
</template>

<script>
import{ object , string } from 'yup';
import { Field, Form  , ErrorMessage} from 'vee-validate';
export default {
  name: 'Form-VeeValidate',
  components: {
    Field ,
    Form ,
    ErrorMessage
  } ,
  data() {
      const simpleSchema = {
      email(value) {
        // validate email value...
            if (value && value.trim()) {
            return true;
        }
        return 'This is required';
      },
      name(value) {
        // validate name value...
           if (value && value.trim()) {
            return true;
      }
      return 'This is required';
      },
      // If you defined global rules you can also use them
    //   password: 'required|min:8',
      // ...
    };
    const yupSchema = object({
  email : string().required("email is required").email("please provide valid emaill address"),
  username: string().required("user name is required").max( 10 , "max 10 char.").min( 4 ,"min 4 char"),
  password: string().required().min(8),
});
    return {
      simpleSchema,
      yupSchema , 
      formInitial : {
        email : "invalid initial Email" ,
        username : "validUserName"
      }
    };
    },
  methods: {
    // Validator function
    isRequired(value) {
           if (value && value.trim()) {
        return true;
      }
      return 'This is required';
    },
    submit(values) {
    // Submit values to API...
    alert(JSON.stringify(values, null, 2));
    },
  },
};
</script>
