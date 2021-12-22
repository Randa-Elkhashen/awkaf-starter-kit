<template>
<div class="login-container container">
    <div class="form-card">
        <h1 class="form-card__title" > Login Page</h1>
        <form  class="form-card__form"
       
        >
        <div class="form-card__form__fields">
            <div class="mb-3 row">
              <label for="staticEmail" class="col-sm-2 col-form-label">User Name</label>
              <div class="col-sm-10">
                <input type="text"  class="form-control" id="staticEmail" v-model="form.username.value"  >
          </div>
              <span>{{ form.username.error }}</span>

            </div>
            <div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" v-model="form.password.value" >
              </div>
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
        debugger
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
<style lang="scss" scoped>
.login-container{
  max-width: 400px;
  margin: auto;
  .form-card{
    display: flex;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 0.3rem;
    padding: 15px;
    margin-bottom: 15px;
      box-shadow: 2px 2px 3px grey;
    &:focus-within{
      box-shadow: 5px 5px 5px grey;
    }
  .form-card__title{
      font-family: $title-font-family;
      font-size: 28px;
      font-weight: bold;
      color: black;
      margin-bottom: 30px;
      position: relative;
      display: block;
      &:after{
        content: "";
        display: inline-block;
        width: 100%;
        #{$start}: 0;
        height: 1px;
        background-color: lightgrey ;
        position: absolute;
        bottom: -15px;
      }
    }
  .form-card__form{
    display: block;
    margin-bottom: 5px;
      .form-card__form__submit-btn{
        width: 100%;
      }
  }
  .form-card__other-options{
    list-style: none;
    padding: 0;
    margin-bottom: 0;
    .form-card__other-options__option{
      color: #0066c0;
      transition: all 0.2s ease-in-out;
      &:hover{
        color: orangered;
      }
      .link{
        text-decoration: none;
        &:hover{
          color:inherit;
        }
      }
      
    }
  }
  }
  .new-member{
    display: flex;
    flex-direction: column;
    .new-member__title{
      color: grey;
      position: relative;
      font-size: 12px;
      text-align: center;
      margin-bottom: 10px;
      &:after{
        content: "";
        height: 1px;
        width: 100%;
        #{$start}:0;
        background-color: grey;
        display: inline-block;
        position: absolute;
        bottom: 50%;
      }
      .title{
        background-color: white;
        padding: 0 5px;
        z-index: 1;
        position: relative;
        display: inline-block;
        vertical-align: baseline;
      }
    }
  }
}
</style>
