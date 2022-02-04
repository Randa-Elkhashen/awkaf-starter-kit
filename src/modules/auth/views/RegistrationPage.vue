<template>
    <div class="container">
    <h1 class="title-description">Registration Page</h1>
    <register />
    </div>
</template>

<script>
import Register from "@/modules/auth/components/TD_register/TD_Register.vue"
export default {
  name: 'LoginPage',
  components : {
    Register ,
  }
}
</script>