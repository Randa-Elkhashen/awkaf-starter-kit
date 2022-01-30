<template>
<div class="login-container container">
    <div class="form-card">
        <h1 class="form-card__title" > Login Page</h1>
        <form  class="form-card__form"
       
        >
        <div class="form-card__form__fields">
            <div class="mb-3 td-field-group td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">Email</label>
                <input type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.username.value"  >
              <span class="td-field-group__validate-message">{{ form.username.error }}</span>

            </div>
            <div class="mb-3 td-field-group td-field-group--required">
              <label for="inputPassword" class="form-label td-field-group__label">Password</label>
                <input type="password" class="form-control td-field-group__field" id="inputPassword" v-model="form.password.value" >
              <span>{{ form.password.error }}</span>
            </div>
        </div>
        <button type="button" class="form-card__form__submit-btn btn btn-dark">login</button>
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

  <br />
    <h1>Is user authenticated: {{ isAuthenticated }}</h1>
    <button @click="handleLogin">
      {{isAuthenticated ? 'logout' : 'login'}}
    </button>
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
        const form  = useTDLogin();
        return { form }
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
    console.log(this.form)
  },
}
</script>
