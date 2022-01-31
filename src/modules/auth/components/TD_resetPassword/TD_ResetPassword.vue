<template>
<div class="forgot-password-container container">
    <div class="form-card">
        <h1 class="form-card__title" >Forgot Password</h1>
        <p class="form-card__description">
            Enter your new Password.
        </p>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div  class="form-card__form__fields">
            <div class="mb-2 td-field-group td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">Password</label>
                <input autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.password"  >
              <span class="td-field-group__validate-message">{{ form.errors.password || " "}} </span>
            </div>
            <div class="mb-2 td-field-group td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">Confirm Password</label>
                <input autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.confirmPassword"  >
              <span class="td-field-group__validate-message">{{ form.errors.confirmPassword || " "}} </span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn btn-dark">SUBMIT</button>
        </form>
    </div>

</div>

</template>
<script>
import useTDResetPassword from "./useTDResetPassword";
import "./TD_resetPassword.scss";
import { useRouter } from 'vue-router';

export default {
    name : "ResetPassword" ,
  setup() {
        const router = useRouter();
        const {form , handleSubmit }  = useTDResetPassword();
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
          router.push({ path: 'login' })
        } , ({ values, errors, results })=>{
              
        });
        return { form , onsubmit  }
  },

}
</script>