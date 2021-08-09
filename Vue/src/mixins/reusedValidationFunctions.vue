<script>
    import Vue from "vue";
    import Vuelidate from "vuelidate";
    //import { ValidateNationalID, GetNationalIDInfo } from "./nid.js";
    Vue.use(Vuelidate);
    import {
        helpers
    } from "vuelidate/lib/validators";

    const ValidationNameMixin = helpers.regex("alpha", /^([\u0621-\u064A/a-zA-Z_ ]){1,}$/);

    //eslint-disable-next-line
    const emailValidation = helpers.regex('alpha', /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    const phoneNumberValidation = helpers.regex('alpha', /^[0-9]{11}$/);
    const HomeNumberValidation = helpers.regex('alpha', /^[0-9]{10,11}$/);

    const numberValidation = helpers.regex('alpha', /^[0-9]{1,}$/);
    //eslint-disable-next-line
    const arabicCharactersValidation = helpers.regex('alpha', /^[\u0621-\u064A\ ]+$/);

    //function NationalIdValidation(nationalId) {
    //    nationalId = toEnglishNumber(nationalId);
    //    let isNationalId = ValidateNationalID(nationalId);
    //    let nationalIdInfo = GetNationalIDInfo(nationalId);
    //    console.log(nationalIdInfo);
    //    return isNationalId;
    //}
    //function toEnglishNumber(selector) {
    //    selector = selector.replaceAll('١', '1');
    //    selector = selector.replaceAll('٢', '2');
    //    selector = selector.replaceAll('٣', '3');
    //    selector = selector.replaceAll('٤', '4');
    //    selector = selector.replaceAll('٥', '5');
    //    selector = selector.replaceAll('٦', '6');
    //    selector = selector.replaceAll('٧', '7');
    //    selector = selector.replaceAll('٨', '8');
    //    selector = selector.replaceAll('٩', '9');
    //    selector = selector.replaceAll('٠', '0');
    //    selector = selector.replaceAll('۱', '1');
    //    selector = selector.replaceAll('۲', '2');
    //    selector = selector.replaceAll('۳', '3');
    //    selector = selector.replaceAll('٤', '4');
    //    selector = selector.replaceAll('٥', '5');
    //    selector = selector.replaceAll('٦', '6');
    //    selector = selector.replaceAll('٧', '7');
    //    selector = selector.replaceAll('۸', '8');
    //    selector = selector.replaceAll('۹', '9');
    //    selector = selector.replaceAll('۰', '0');
    //    return selector;
    //}

    var validationMixins = {
        validateCustomName() {
            return ValidationNameMixin;
        },
        validateCustomEmail() {
            return emailValidation;
        },
        validateCustomPhoneNumber() {
            return phoneNumberValidation;
        },
        validateCustomNumber() {
            return numberValidation;
        },
        validateArabicCharacters() {
            return arabicCharactersValidation;
        },
        validateHomeNumber() {
            return HomeNumberValidation;
        },
        //validateNationalID() {
        //    return NationalIdValidation(nationalId);
        //}
    }

    export default validationMixins
</script>