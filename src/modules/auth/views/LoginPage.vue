<template>
    <div class="container">
    <h1 class="title-description">Login</h1>
    <login />
    </div>
</template>

<script>
import Login from "@/modules/auth/components/TD_login/Login.vue"
export default {
  name: 'LoginPage',
  components : {
    Login ,
  }
}
</script>