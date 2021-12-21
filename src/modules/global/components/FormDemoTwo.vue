
<template>
<div>
    <input type="text" v-model.trim="v$.username.$model" />

    <div class="input-errors" v-for="error of v$.username.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>
<div>
    <input type="text" v-model.trim="v$.username2.$model" />
    <div class="input-errors" v-for="error of v$.username2.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>

<div>
    <input type="text" v-model.trim="v$.username3.$model" />
    <div class="input-errors" v-for="error of v$.username3.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>

</template>

<script>
import useVuelidate from '@vuelidate/core'
import { required, helpers  } from '@vuelidate/validators'

export default {
  setup () {
    return { v$: useVuelidate() }
  },
  data () {
    return {
      username: '',
      username2: '',
      username3 : '' ,
    }
  },
  validations () {
    return {
      username: { required }, // Matches this.username
      username2: { requiredWithCustomMessage :  helpers.withMessage('This field cannot be empty', required) }, // Matches this.username2 ,
      username3: { required , mustBeCool : helpers.withMessage('must be cool',   (value) => value.includes('cool'))  } // custom validation
    }
  }
}
</script>
