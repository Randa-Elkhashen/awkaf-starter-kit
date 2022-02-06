<template>
<div>
    <div class="form-card">
        <h1 class="form-card__title" > Login Page</h1>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div class="form-card__form__fields">
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="Email"  class="form-control td-field-group__field" id="floatingEmail" v-model="form.email"  >
              <label for="floatingEmail" class="  td-field-group__label">Email</label>
              <span class="td-field-group__validate-message">{{ form.errors.email || " "}} </span>
            </div>
            <div class="mb-3 form-floating td-field-group td-field-group--required">
              <input type="password" placeholder="Password" class="form-control td-field-group__field" id="floatingPassword" v-model="form.password" >
              <label for="floatingPassword" class=" td-field-group__label">Password</label>
              <span class="td-field-group__validate-message">{{ form.errors.password }}</span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn">LOGIN</button>
        </form>

    <ul class="form-card__other-options">
        <li class="form-card__other-options__option"> <a class="link" href="/forgotpassword">Forgot your password?</a> </li>
    </ul>
    </div>
    <div class="new-member">
      <div class="new-member__title">
        <h3 class="title" >New memebr ?</h3>
      </div>
        <a href="/register" class="new-member__register-btn btn btn-dark">create new account</a>
    </div>
</div>
<!-- 
  <br />
    <h1>Is user authenticated: {{ isAuthenticated }}</h1>
    <button @click="handleLogin">
      {{isAuthenticated ? 'logout' : 'login'}}
    </button> -->
</template>
<script>
import "./TD_login.scss";
import "@/modules/global/components/TD_forms/TD_forms.scss";
import {authModuleService} from '@/services';
import useTDLogin from "@/modules/auth/components/TD_login/useTDLogin";
import { useRouter } from "vue-router";
export default {
  name: 'Login',
  setup() {
        const router = useRouter();
        const {form , handleSubmit }  = useTDLogin();
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
          router.push('/')
        } , ({ values, errors, results })=>{
              console.log(values); // current form values
              console.log(errors); // a map of field names and their first error message
              console.log(results); // a detailed map of field names and their validation results
        });
        return { form , onsubmit }
  },
  computed: {
    isAuthenticated(){
      return this.$store.getters['auth/checkAuth']
    } 
  },
  methods: {
    handleLogin: function(){
      authModuleService.users.loginByEmailAndPassword({}, () => {
        this.$store.commit('auth/setAuth')
        this.$router.push('/')
      }, () => {
        console.log('error')
      })
    }
  },
  mounted() {
    // this.initFormValues();
    // debugger
  },
}
</script>
