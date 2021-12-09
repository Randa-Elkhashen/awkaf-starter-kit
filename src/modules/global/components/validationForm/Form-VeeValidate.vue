
<template>
<div class="container">
  <div>
    <Form @submit="submit" :validation-schema="yupSchema"   v-slot="{ errors  ,  meta : { dirty : isFormDirty , valid : isFormValid } }" 
    :initial-values="formInitial"
    >
      <!-- email field starts -->
    <div class="form-floating mb-3" >
      <Field   validateOnInput v-slot="{ meta : {valid : emailIsValid} , field  }" name="email"   >
            <input v-bind="{field}" :class="[emailIsValid ? 'is-valid' : 'is-invalid' ]" id="floatingInput" placeholder="name@example.com" class="form-control "/>
            <label for="floatingInput">Email address</label>
                <div v-show="emailIsValid" class="valid-feedback">
                  Looks good!
                </div>
                <!-- {{ errorMessage}} -->
      </Field>
      <ErrorMessage class="invalid-feedback d-block" name="email" />
    </div>
      <!-- email field ends -->
    <!-- email field starts -->
    <div class="form-floating mb-3" >
      <Field  validateOnInput name="email2" class="form-control " id="floatingInput2" placeholder="name@example.com" />
      <label for="floatingInput2">Email address</label>
      <ErrorMessage class="invalid-feedback d-block"  name="email2" />
    </div>
      <!-- email field ends -->
      <!-- userName Field starts -->
    <div class="form-floating mb-3" >
      <Field  class="form-control is-invalid" name="username" id="floatingUserName" placeholder="username"/>
      <label for="floatingUserName">User Name</label>
      <ErrorMessage class="invalid-feedback" name="username" />
    </div>
      <!-- userName Field ends -->


      <!-- email field ends -->
      <!-- password Field starts -->
    <div class="form-floating mb-3" >
      <Field  class="form-control is-invalid" name="phone" id="floatingPassword" placeholder="username"/>
      <label for="floatingPassword">Phone</label>
      <ErrorMessage class="invalid-feedback" name="phone" />
    </div>
      <!-- password Field ends -->
       
     <!-- <div>
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
    <div class="mb-3">
      <button class="btn btn-primary" type="submit"  :disabled="!isFormDirty" >Submit form</button>
    </div>

    <div class="card" v-show="!isFormValid && isFormDirty" >
        <div class="card-body">
          <p class="card-text invalid-feedback mb-0 mt-0 d-block" v-for="(error , index) in errors" :key="index">{{error}}</p>
        </div>
    </div>
    </Form>
  </div>
</div>
</template>

<script>
import{ object , string ,  } from 'yup';
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
        return 'email is required';
      },
      username(value) {
        // validate name value...
           if (value && value.trim()) {
            return true;
      }
      return 'name is required';
      },
      phone(value) {
        // validate name value...
           if (value && value.trim()) {
            return true;
      }
      return 'phone is required';
      },
      // If you defined global rules you can also use them
    //   password: 'required|min:8',
      // ...
    };
    const yupSchema = object({
  email : string().required("email is required").email("please provide valid email address"),
  email2 : string().required("email is required").email("please provide valid email address"),
  username: string().required("user name is required").max( 10 , "max 10 char.").min( 4 ,"min 4 char"),
  phone: string().required("phone is required").matches(/^[1-9]$/img ,"must be number only").min(6 , "6 is the minimum digit").max(10 , "10 digit is the max allowed phone number"),
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
