<template>
<div class="login-container container">
    <div class="form-card">
        <h1 class="form-card__title" > Login Page</h1>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div class="form-card__form__fields">
            <div class="mb-2 td-field-group td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">Email</label>
                <input autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.email"  >
              <span class="td-field-group__validate-message">{{ form.errors.email || " "}} </span>

            </div>
            <div class="mb-3 td-field-group td-field-group--required">
              <label for="inputPassword" class="form-label td-field-group__label">Password</label>
                <input type="password" class="form-control td-field-group__field" id="inputPassword" v-model="form.password" >
              <span class="td-field-group__validate-message">{{ form.errors.password }}</span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn btn-dark">LOGIN</button>
        </form>

    <ul class="form-card__other-options">
        <li class="form-card__other-options__option"> <a class="link" href="/register">Forgot your password?</a> </li>
    </ul>
    </div>
    <div class="new-member">
      <div class="new-member__title">
        <h3 class="title" >New memebr ?</h3>
      </div>
        <button type="button" class="new-member__register-btn btn btn-dark">create new account</button>
    </div>
    <h3></h3>
</div>
<!-- 
  <br />
    <h1>Is user authenticated: {{ isAuthenticated }}</h1>
    <button @click="handleLogin">
      {{isAuthenticated ? 'logout' : 'login'}}
    </button> -->
</template>
<script>
import "./login.scss";
import {Form as VeeForm} from "vee-validate"
import {authModuleService} from '@/services';
import useTDLogin from "./userTDLogin";
export default {
  name: 'Login',
  components:{
    VeeForm ,
  },
  setup() {
        const {form , handleSubmit }  = useTDLogin();
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
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
    onWrongSubmit(){
      console.log("not valid submit")
    },
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
