<template>
<div class="container">
    <h1 class="title-description">Reset Password</h1>
    <reset-password/>
</div>
</template>
<script>
import ResetPassword from "../components/TD_resetPassword/TD_ResetPassword.vue"
export default {
    name : "ResetPasswordPage" ,
    components : {
        ResetPassword
    }
}
</script>