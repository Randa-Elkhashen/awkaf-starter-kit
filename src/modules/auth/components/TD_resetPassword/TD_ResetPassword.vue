<template>
<div class="reset-password-container container">
    <div class="form-card">
        <h1 class="form-card__title" >Reset Password</h1>
        <p class="form-card__description">
            Enter your new Password.
        </p>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div  class="form-card__form__fields">
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="New Password" autocomplete="off" type="text"  class="form-control td-field-group__field" id="floatingPassword" v-model="form.password"  >
              <label for="floatingPassword" class="form-label  td-field-group__label">New Password</label>
              <span class="td-field-group__validate-message">{{ form.errors.password || " "}} </span>
            </div>
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="Confirm Password" autocomplete="off" type="text"  class="form-control td-field-group__field" id="floatingConfirmPassword" v-model="form.confirmPassword"  >
              <label for="floatingConfirmPassword" class="form-label  td-field-group__label">Confirm Password</label>
              <span class="td-field-group__validate-message">{{ form.errors.confirmPassword || " "}} </span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn ">SUBMIT</button>
        </form>
    </div>

</div>

</template>
<script>
import useTDResetPassword from "./useTDResetPassword";
import "./TD_resetPassword.scss";
import "@/modules/global/components/TD_forms/TD_forms.scss";
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