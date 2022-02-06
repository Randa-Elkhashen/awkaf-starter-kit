<template>
<div class="container forgot-password-container">
    <h1 class="title-description">Forgot Password</h1>
    <forgot-password />
</div>
</template>
<script>
import ForgotPassword from "../components/TD_forgotPassword/TD_ForgotPassword.vue"
export default {
    name : "ForgotPasswordPage" ,
    components : {
        ForgotPassword
    }
    
}
</script>
<style lang="scss" scoped>
 .forgot-password-container{
    display: block;
    max-width: 400px;
    margin: auto;
    .form-card{
        padding: 15px;
      }
}
@media screen and (max-width :767px) {
    .forgot-password-container{
        padding: 0;
    }
}
</style>