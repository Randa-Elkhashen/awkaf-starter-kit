<template>
    <div class="container register-container">
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
<style lang="scss" >
.td-field-group--radio{
  .form-label{
    margin: 0;
    padding-top: 0.5rem;
  }
}
@media screen and(max-width:767px) {
  .register-container{
    padding: 0;
  }
}

</style>