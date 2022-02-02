<template>
<div class="forgot-password-container container">
    <div class="form-card">
        <h1 class="form-card__title" >Forgot Password</h1>
        <p class="form-card__description">
            Enter the email address or mobile phone number associated to Turn Digital Account.
        </p>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div  class="form-card__form__fields">
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="Email or mobile phone number"  class="form-control td-field-group__field" id="floatingEmail" v-model="form.emailorPhone"  >
              <label for="floatingEmail" class="form-label  td-field-group__label">Email or mobile phone number</label>
              <span class="td-field-group__validate-message">{{ form.errors.emailorPhone || " "}} </span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn ">Continue</button>
        </form>
    </div>

</div>

</template>
<script>
import useTDForgotPassword from "./useTDForgotPassword";
import "./TD_forgotPassword.scss";
import { useRouter } from 'vue-router';

export default {
    name : "ForgotPassword" ,
  setup() {
        const router = useRouter();
        const {form , handleSubmit }  = useTDForgotPassword();
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
          router.push({ path: 'resetPassword' })
        } , ({ values, errors, results })=>{
              
        });
        return { form , onsubmit  }
  },

}
</script>