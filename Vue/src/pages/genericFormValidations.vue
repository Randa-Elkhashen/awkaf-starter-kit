<!-- Needed NPM Installs -->
<!--  npm install vuelidate --save -->

<template>
    <div class="container">
        <div class="generic-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="form-block">
                        <form v-on:submit.prevent="onSubmit" v-show="form" autocomplete="off">
                            <p>Validate Arabic and english Characters only</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.firstName.$model"
                                       type="text"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.firstName.$touch"
                                       :class="{ error: $v.dataForm.firstName.$error }" />
                                <span class="placeholder-animation">firstName</span>
                                <div v-if="$v.dataForm.firstName.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.firstName.regex">Name contain only character</span>
                                    <span class="error" v-if="!$v.dataForm.firstName.required">First name required</span>
                                </div>
                            </div>

                            <p>Validate Arabic Numbers only + min characters</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.lastName.$model"
                                       type="text"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.lastName.$touch"
                                       :class="{ error: $v.dataForm.lastName.$error }" />
                                <span class="placeholder-animation">lastName</span>
                                <div v-if="$v.dataForm.lastName.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.lastName.regex">Name contain only arabic characters</span>
                                    <span class="error" v-if="!$v.dataForm.lastName.required">Name required</span>
                                    <span class="error" v-if="!$v.dataForm.lastName.minLength">Name should be 2 characters at least</span>
                                    <span class="error" v-if="!$v.dataForm.lastName.maxLength">Name can't be more than 100 character</span>
                                </div>
                            </div>

                            <p>Validate Mobile Number</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.MobileNumber.$model"
                                       type="text"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.MobileNumber.$touch"
                                       :class="{ error: $v.dataForm.MobileNumber.$error }" />
                                <span class="placeholder-animation">MobileNumber</span>
                                <div v-if="$v.dataForm.MobileNumber.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.MobileNumber.regex">Should be numbers only and 11 number</span>
                                </div>
                            </div>
                            <p>Validate Home Phone Number</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.HomeNumber.$model"
                                       type="text"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.HomeNumber.$touch"
                                       :class="{ error: $v.dataForm.HomeNumber.$error }" />
                                <span class="placeholder-animation">HomeNumber</span>
                                <div v-if="$v.dataForm.HomeNumber.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.HomeNumber.regex">Should be numbers only and 10 - 11 number</span>
                                </div>
                            </div>
                            <p>Validate Email</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.Email.$model"
                                       type="email"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.Email.$touch"
                                       :class="{ error: $v.dataForm.Email.$error }" />
                                <span class="placeholder-animation">Email: </span>
                                <div v-if="$v.dataForm.Email.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.Email.required">Email Required</span>
                                    <span class="error" v-if="!$v.dataForm.Email.regex">Email Invalid</span>
                                </div>
                            </div>
                            <p>Validate Password</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.Password.$model"
                                       type="password"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.Password.$touch"
                                       :class="{ error: $v.dataForm.Password.$error }" />
                                <span class="placeholder-animation">Password: </span>
                                <div v-if="$v.dataForm.Password.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.Password.required">
                                        Password Required
                                    </span>
                                    <span class="error" v-if="!$v.dataForm.Password.minLength">
                                        Password min length 8 character
                                    </span>
                                </div>
                            </div>
                            <p>Validate Confirm Password</p>
                            <div class="form-group">
                                <input v-model.trim="$v.dataForm.ConfirmPassword.$model"
                                       type="password"
                                       class="form-control"
                                       placeholder="test"
                                       @input="$v.dataForm.ConfirmPassword.$touch"
                                       :class="{ error: $v.dataForm.ConfirmPassword.$error }" />
                                <span class="placeholder-animation">Confirm Password: </span>
                                <div v-if="$v.dataForm.ConfirmPassword.$dirty" class="errors">
                                    <span class="error"
                                          v-if="!$v.dataForm.ConfirmPassword.sameAsPassword">Confirm Password NotMatched</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea v-model.trim="$v.dataForm.Message.$model"
                                          type="number"
                                          class="form-control"
                                          placeholder="test"
                                          @input="$v.dataForm.Message.$touch"
                                          :class="{ error: $v.dataForm.Message.$error }"></textarea>
                                <span class="placeholder-animation">Message: </span>
                                <div v-if="$v.dataForm.Message.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.Message.required">Message required</span>
                                    <span class="error" v-if="!$v.dataForm.Message.minLength">min lenght must be 50</span>
                                </div>
                            </div>
                            <p>Validate Select Field required</p>
                            <div class="form-group">
                                <select class="form-select"
                                        required
                                        v-model="$v.dataForm.Select.$model"
                                        @change="$v.dataForm.Select.$touch"
                                        :class="{ error: $v.dataForm.Select.$error }">
                                    <option v-for="op in dataForm.Options"
                                            :value="op.val"
                                            :key="op.id">
                                        {{ op.opt }}
                                    </option>
                                </select>
                                <span class="placeholder-animation">Example select: </span>
                                <div v-if="$v.dataForm.Select.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.Select.required">Message required</span>
                                </div>
                            </div>
                            <p>Validate radioButtons Required</p>
                            <div class="check">
                                <label for="">Gender</label>
                                <div class="form-check"
                                     v-for="genders in dataForm.genderType"
                                     :key="genders.id">

                                    <label class="form-check-label">
                                        <input class="form-check-input"
                                               v-model.trim="$v.dataForm.Genders.$model"
                                               @change="$v.dataForm.Genders.$touch"
                                               type="radio"
                                               :name="genders.type"
                                               :value="genders.id"
                                               checked />
                                        {{ genders.type }}
                                    </label>
                                </div>
                                <div v-if="$v.dataForm.Genders.$dirty" class="errors">
                                    <span class="error" v-if="!$v.dataForm.Genders.required">Gender Required.</span>
                                </div>
                            </div>
                            <!--<p>Validate checkbox Required</p>
    <div class="form-check">

        <label class="form-check-label">
            <input class="form-check-input"
                   type="checkbox"
                   v-model.trim="$v.dataForm.Agree.$model"
                   @change="$v.dataForm.Agree.$touch" />
            Example checkbox
        </label>
    </div>
    <div v-if="$v.dataForm.Agree.$dirty" class="errors">
        <span class="error" v-if="!$v.dataForm.Agree.required">Gender Required.</span>
    </div>-->
                            <div class="submit">
                                <button class="btn btn-primary btn-submit"
                                        :disabled="$v.$invalid">
                                    Submit
                                </button>
                            </div>
                        </form>
                        <div class="success-msg" v-show="successMsg">
                            <p class="msg-description">Form is submited successfully</p>
                        </div>
                        <div class="form-loader" v-show="loading">
                            <img src="../assets/spinner.gif" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss">
    @import './src/assets/sass/FormValidationVuelidate';
</style>

<script>
    import Vue from "vue";
    import Vuelidate from "vuelidate";
    Vue.use(Vuelidate);
    import { validationMixin } from "vuelidate";
    import {
        required,
        minLength,
        maxLength,
        //email,
        sameAs,
        //helpers
    } from "vuelidate/lib/validators";

    let customValidationMixin = require('../mixins/reusedValidationFunctions');

    export default {
        name: 'FormValidationVuelidate',
        components: {

        },
        mixins: [validationMixin],
        data: function () {
            return {
                form: true,
                dataForm: {
                    firstName: "",
                    lastName: "",
                    NationalID:"",
                    MobileNumber: "",
                    HomeNumber:"",
                    Email: "",
                    Message: "",
                    Select: "",
                    Options: [
                        {
                            val: 1,
                            opt: "option1"
                        },
                        {
                            val: 2,
                            opt: "option2"
                        },
                        {
                            val: 3,
                            opt: "option3"
                        },
                        {
                            val: 4,
                            opt: "option4"
                        }
                    ],
                    Password: "",
                    ConfirmPassword: "",
                    genderType: [
                        {
                            id: "option1",
                            type: "male"
                        },
                        {
                            id: "option2",
                            type: "femal"
                        }
                    ],
                    Agree: "",
                    Genders: ""
                },
                loading: false,
                successMsg: false
            }
        },
        validations: {
            dataForm: {
                firstName: {
                    required,
                    regex: customValidationMixin.default.validateCustomName()
                },
                lastName: {
                    required,
                    regex: customValidationMixin.default.validateArabicCharacters(),
                    minLength: minLength(2),
                    maxLength: maxLength(100)
                },
                //NationalID: {
                //    minLength: minLength(14),
                //    regex: customValidationMixin.default.validateNationalID()
                //},
                MobileNumber: {
                    regex: customValidationMixin.default.validateCustomPhoneNumber(),
                },
                HomeNumber: {
                    regex: customValidationMixin.default.validateHomeNumber(),
                },
                Email: {
                    required,
                    regex: customValidationMixin.default.validateCustomEmail()
                },
                Password: {
                    required,
                    minLength: minLength(8)
                },
                ConfirmPassword: {
                    required,
                    sameAsPassword: sameAs("Password")
                },
                Message: {
                    required,
                    minLength: minLength(50)
                },
                Select: {
                    required
                },
                Genders: {
                    required
                },
                Agree: {
                    required
                }
            }
        },
        methods: {
            onSubmit() {
                this.$v.dataForm.$touch();
                if (this.$v.dataForm.$anyError) {
                    console.log(this.$v.dataForm.$anyError);
                    return;
                } else {
                    this.form = false;
                    this.loading = true;
                    this.successMsg = true;
                    this.loading = false;
                }
            }
        },
        computed: {},
        mounted() {

        }
    }
</script>