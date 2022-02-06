<template>
<div>
    <!-- {{form}} -->
    <div class="form-card">
        <form @submit="onsubmit"  class="form-card__form"
        >
        <div class="form-card__form__fields">
            <!-- photo -->
            <div class="mb-2 td-field-group td-field-group--required td-field-group--photo-picker">
              <label for="staticEmail" class="form-label  td-field-group__label">Photo</label>
                <img @load="form.photo=photoSrc" ref="photoElement" @click="selectPhoto" class="td-field-group__field cursor-pointer" :src="photoSrc || require('../../../../assets/images/profile.jpg')"/>
                <input @change="onPhotoInputChange"  ref="photoInput" type="file"  accept="image/png, image/jpeg"  class="form-control d-none" id="staticEmail" >
              <span class="td-field-group__validate-message">{{ form.errors.photo || " "}} </span>
            </div>
            <!-- email -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="Email" autocomplete="off" type="text"  class="form-control td-field-group__field" id="floatingEmail" v-model="form.email"  >
              <label for="floatingEmail" class="form-label  td-field-group__label">Email</label>
              <span class="td-field-group__validate-message">{{ form.errors.email || " "}} </span>
            </div>
            <!-- username -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="name" autocomplete="off" type="text"  class="form-control td-field-group__field" id="floatingName" v-model="form.name"  >
              <label for="floatingName" class="form-label  td-field-group__label">name</label>
              <span class="td-field-group__validate-message">{{ form.errors.name || " "}} </span>
            </div>
            <!-- password -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="Password"  class="form-control td-field-group__field" id="floatingPassword" v-model="form.password"  >
              <label for="floatingPassword" class="form-label  td-field-group__label">Password</label>
              <span class="td-field-group__validate-message">{{ form.errors.password || " "}} </span>
            </div>
            <!--confirm password -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="Confirm Password" autocomplete="off" type="text"  class="form-control td-field-group__field" id="floatingPassword" v-model="form.confirmPassword"  >
              <label for="floatingPassword" class="form-label  td-field-group__label">Confirm Password</label>
              <span class="td-field-group__validate-message">{{ form.errors.confirmPassword || " "}} </span>
            </div>
            <!--address -->
            <!-- <div v-for="(field , index ) in form.addresses" :key="index" class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="Address" autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="field.value"  >
              <label for="staticEmail"  class="form-label  td-field-group__label">Address</label>
              <span class="td-field-group__validate-message">{{ form.errors.fields[index] || " "}} </span>
            </div> -->
            <!-- <div class="d-flex justify-content-center">
                <button @click="()=> pushAddress('new address')" type="button" class="btn btn-primary my-2 me-5">add</button>
                <button @click="()=> popAddress('new address')" type="button" class="btn btn-primary my-2 me-5">remove</button>
            </div> -->
            <!--address -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="Address" autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.address"  >
              <label for="staticEmail" class="form-label  td-field-group__label">address</label>
              <span class="td-field-group__validate-message">{{ form.errors.address || " "}} </span>
            </div>
            <!-- <div v-for="(testAddress , index ) in form.testAddresses" :key="index" class="mb-2 td-field-group td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">Address</label>
                <input autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="testAddresses[index]"  >
              <span class="td-field-group__validate-message">{{ form.errors.testAddresses[index] || " "}} </span>
            </div> -->
            <!--phone -->
            <div class="mb-2 form-floating td-field-group td-field-group--required">
                <input placeholder="phone" autocomplete="off" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.phone"  >
              <label for="staticEmail" class="form-label  td-field-group__label">phone</label>
              <span class="td-field-group__validate-message">{{ form.errors.phone || " "}} </span>
            </div>
            <!--Nationality -->
            <div class="mb-2 td-field-group td-field-group--vue-multi-select td-field-group--required">
              <label for="staticEmail" class="form-label  td-field-group__label">select country</label>
                                              <!-- <VueMultiselect placeholder="select country "
                                                v-model="selectedCountry"
                                                :options="options"
                                                track-by="name"
                                                label="name"
                                                :showLabels="false"
                                                :searchable="false"
                                                :allow-empty="false">
                                </VueMultiselect> -->
              <VueMultiselect v-model="form.country" deselectLabel="" selectLabel="" placeholder="Select Country"  :options="options" label="name"  searchable   track-by="name" >
                    <template v-slot:singleLabel="{option}" >
                      <p class="m-0">{{ option.name }}</p>
                      </template>
              </VueMultiselect>
              <span class="td-field-group__validate-message">{{ form.errors.country || " "}} </span>
            </div>
            <!--National number -->
            <div v-if="form.country?.value == 'egypt'" class="mb-2 td-field-group  form-floating td-field-group--required">
                <input autocomplete="off" placeholder="National Number" type="text"  class="form-control td-field-group__field" id="staticEmail" v-model="form.nationalNumber"  >
              <label for="staticEmail" class="form-label  td-field-group__label">National Number</label>
              <span class="td-field-group__validate-message">{{ form.errors.nationalNumber || " "}} </span>
            </div>
            <!--National Id -->
            <div v-if="form.country?.value != 'egypt'" class="mb-2 form-floating td-field-group td-field-group--required">
                <input autocomplete="off" type="text" placeholder="National ID"  class="form-control td-field-group__field" id="staticEmail" v-model="form.nationalID"  >
              <label for="staticEmail" class="form-label  td-field-group__label">National ID</label>
              <span class="td-field-group__validate-message">{{ form.errors.nationalID || " "}} </span>
            </div>
            <!--Date of Birth -->
                <DatePicker  v-model="form.date">
                <template v-slot="{ inputValue, togglePopover }">
                  <div class="form-floating mb-2 td-field-group td-field-group--required td-field-group--date-picker">
                    <input
                      placeholder="Date of Birth"
                      @click="togglePopover"
                      :value="inputValue"
                      class="form-control td-field-group__field"
                      readonly
                    />
                <label for="staticEmail" class="form-label  td-field-group__label">Date of Birth</label>
                <span class="td-field-group__validate-message">{{ form.errors.date || " "}} </span>
                  </div>
                </template>
              </DatePicker >
            <!--Gender -->
            <div class="mb-2  td-field-group td-field-group--required td-field-group--radio ">
              <label   class="form-label  td-field-group__label ">Gender</label>
                <div class="td-field-group ">
                <input type="radio" name="gender" value="male"  class="me-2 " id="maleId" v-model="form.gender"  >
                <label for="maleId"  class="form-label  ">male</label>
                </div>
                <div class="td-field-group td-field-group--required">
                  <input type="radio" name="gender" value="female"  class="me-2 " id="female" v-model="form.gender"  >
                  <label for="female"  class="form-label  ">female</label>
                </div>
              <span class="td-field-group__validate-message">{{ form.errors.gender || " "}} </span>
            </div>
        </div>
        <button type="submit" class="form-card__form__submit-btn btn ">REGISTER</button>
        </form>

    <ul class="form-card__other-options">
        <li class="form-card__other-options__option text-center"> <a class="link" href="/login">
        Already have an account? Sign-In
        </a> </li>
    </ul>
    </div>
</div>
<!-- 
  <br />
    <h1>Is user authenticated: {{ isAuthenticated }}</h1>
    <button @click="handleLogin">
      {{isAuthenticated ? 'logout' : 'login'}}
    </button> -->
</template>
<script>
import "./TD_register.scss";
import {authModuleService} from '@/services';
import useTDRegister from "./useTDRegister";
import { DatePicker } from "v-calendar";
import VueMultiselect from "vue-multiselect";
import 'vue-multiselect/dist/dist/vue-multiselect.css'
import 'v-calendar/dist/style.css';
import "@/modules/global/components/TD_forms/TD_forms.scss";

import { useRouter } from "vue-router";
import useTDPhotoPicker from "./useTDPhotoPicker"
export default {
  name: 'Login',
  setup() {
        const router = useRouter();
        const {form ,  handleSubmit , pushAddress , pophAddress }  = useTDRegister();
        const {photoInput , photoElement , selectPhoto , photoSrc , onPhotoInputChange } = useTDPhotoPicker()
        const onsubmit = handleSubmit(values =>{
          console.log("values :" , values);
          router.push('/')
        } , ({ values, errors, results })=>{
              console.log(values); // current form values
              console.log(errors); // a map of field names and their first error message
              console.log(results); // a detailed map of field names and their validation results
        });
        return { form ,  onsubmit , photoInput , photoElement , selectPhoto , photoSrc , onPhotoInputChange }
  },
  components:{
    DatePicker , 
    VueMultiselect ,
  },
  watch : {
    "form.selectedCountry" : function(){
      if(this.form.selectedCountry?.value == 'egypt')
        this.form.nationalNumber = "";
      else 
        this.form.nationalID = "";
    }
  },
  data() {
    return {
      selectedCountry: undefined,
      options: [
        { name: 'Egypt', value: 'egypt' },
        { name: 'Italy', value: 'italy' },
      ]
    }
  },
  mounted() {
      console.log(this.form)
  },
}
</script>
