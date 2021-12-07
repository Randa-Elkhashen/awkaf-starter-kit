<!-- Needed NPM Installs -->
<!--  npm install vuelidate --save -->
<template>
    <input type="text" :value="name" @input="setName">
</template>
<style lang="scss">
    // @import '../styles/components/forms.scss';
</style>

<script>
    import "./forms.scss"
    // import Vue from "vue";
    // import Vuelidate from "vuelidate";
    // Vue.use(Vuelidate);
    import useVuelidate from '@vuelidate/core'
    import { required, email, minLength, sameAs, helpers} from '@vuelidate/validators'

    // import { validationMixin } from "vuelidate";

    const ValidationName = helpers.regex(
        "alpha",
        /^([\u0621-\u064A/a-zA-Z_ ]){1,}$/
    );

    export default {
        name: 'FormValidationVuelidate',
        setup(props) {
            return { v$: useVuelidate() }
        } ,
        components: {
        },
        // mixins: [validationMixin],
        data () {
            return {
                form: true,
                dataForm: {
                    firstName: "",
                    LastName: "",
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
                successMsg: false ,
                name: ""

            }
        },
        validations(){
            return {
                dataForm: {
                    firstName: {
                        required,
                        regex: ValidationName
                    },
                    LastName: {
                        required,
                        minLength: minLength(20)
                    },
                    Email: {
                        required,
                        email
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
                } ,
                name : { required }
            }
        },
        methods: {
            setName ($event) {
            // do some silly transformation
            this.v$.name.$touch()
            } ,
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