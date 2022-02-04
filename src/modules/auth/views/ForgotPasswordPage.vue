<template>
<div class="container">
    <h1 class="title-description">Forgot Password</h1>
    <forgot-password/>
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