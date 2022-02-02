<template>
<div class=" container">
    <div class="form-card">
        <h1 class="form-card__title" > Contact Us</h1>
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div class="form-card__form__fields">
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="Email"  class="form-control td-field-group__field" id="floatingEmail" v-model="form.name"  >
              <label for="floatingEmail" class="  td-field-group__label">Full Name</label>
              <span class="td-field-group__validate-message">{{ form.errors.name || " "}} </span>
            </div>
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="Email"  class="form-control td-field-group__field" id="floatingEmail" v-model="form.email"  >
              <label for="floatingEmail" class="  td-field-group__label">Email Address</label>
              <span class="td-field-group__validate-message">{{ form.errors.email || " "}} </span>
            </div>
            <div class="mb-3 form-floating td-field-group td-field-group--required">
              <input type="phone" placeholder="Password" class="form-control td-field-group__field" id="floatingPassword" v-model="form.phone" >
              <label for="floatingPassword" class=" td-field-group__label">Phone</label>
              <span class="td-field-group__validate-message">{{ form.errors.phone }}</span>
            </div>
            <div class="form-floating mb-3  td-field-group td-field-group--required">
                <textarea maxlength="500" v-model="form.message" class=" form-control td-field-group__field" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 10em"></textarea>
                <label class="td-field-group__label" for="floatingTextarea2">Message</label>
                  <span class="td-field-group__validate-message">{{ form.errors.message }}</span>
                  <span class="td-field-group__counter">Number of characters: {{500 - (form.message?.length || 0)}}</span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn">Submit</button>
        </form>
    </div>
</div>
</template>
<script>
import "./TD_contactUs.scss";
import "@/modules/global/components/TD_forms/TD_forms.scss";
import {authModuleService} from '@/services';
import useTDContactUs from "./useTDContactUs";
import { useRouter } from "vue-router";
export default {
  name: 'Contact Us',
  setup() {
        const router = useRouter();
        const {form , handleSubmit }  = useTDContactUs();
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
          router.push('/')
        } , ({ values, errors, results })=>{
              console.log(values); // current form values
              console.log(errors); // a map of field names and their first error message
              console.log(results); // a detailed map of field names and their validation results
        });
        return { form , onsubmit }
  },
  computed: {
    isAuthenticated(){
      return this.$store.getters['auth/checkAuth']
    } 
  },
  methods: {
    handleLogin: function(){
      authModuleService.users.loginByEmailAndPassword({}, () => {
        this.$store.commit('auth/setAuth')
        this.$router.push('/')
      }, () => {
        console.log('error')
      })
    }
  },
  mounted() {
    // this.initFormValues();
    // debugger
  },
}
</script>
