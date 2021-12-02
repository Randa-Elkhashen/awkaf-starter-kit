<template>
  <div class="hello">
    <h1>Is user authenticated: {{ isAuthenticated }}</h1>
    <button @click="handleLogin">
      {{isAuthenticated ? 'logout' : 'login'}}
    </button>
  </div>
</template>

<script>
import {doLogin} from '../services'

export default {
  name: 'HelloWorld',
  computed: {
    isAuthenticated(){
      return this.$store.getters['auth/checkAuth']
    } 
  },
  methods: {
    handleLogin: function(){
      doLogin({}, () => {
        this.$store.commit('auth/setAuth')
        this.$router.push('/')
      }, () => {
        console.log('error')
      })
    }
  }
}
</script>
