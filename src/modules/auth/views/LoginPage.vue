<template>
    <div class="container">
    <h1 class="title-description">Login</h1>
    <login class="login-container" />
    </div>
</template>

<script>
import Login from "@/modules/auth/components/TD_login/TD_Login.vue"
export default {
  name: 'LoginPage',
  components : {
    Login ,
  }
}
</script>
<style lang="scss">
.login-container {
    display: block;
    max-width: 400px;
    margin: auto;
    .form-card{
      padding: 15px;
    }
}
</style>