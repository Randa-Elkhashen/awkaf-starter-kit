<template>
<div class="container reset-password-container">
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
<style lang="scss" scoped>
@media screen and (max-width :767px) {
    .reset-password-container{
        padding: 0;
    }
}
</style>