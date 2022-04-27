
import {string , ref , addMethod }  from 'yup';
const validations = {
    init : ()=> {
        addMethod(string , 'emailOrPhone', function isEmailOrPhone( errorMessage , ...args ) {
            // test is custom validation method by yup
            return this.test(`emailorPhone-test`, errorMessage, function (value) {
                const { path , createError } = this;
                return (
                  isEmail(value) || isPhone(value) ||
                  createError({ path, message: errorMessage })
                );
              });
          })
          addMethod(string , 'isPhone', function isEmailOrPhone( errorMessage , ...args ) {
            // test is custom validation method by yup
            return this.test(`isPhone-test`, errorMessage, function (value) {
                const { path , createError } = this;
                return (
                  isPhone(value) ||
                  createError({ path, message: errorMessage })
                );
              });
          })
        addMethod(string , 'isPhoto', function isPhoto( errorMessage , ...args ) {
          // test is custom validation method by yup
          return this.test(`isPhoto-test`, errorMessage, function (value) {
              const { path , createError } = this;
              return (
                 isPhotoPathDefined(value)|| 
                createError({ path, message: errorMessage })
              );
            });
        })
        addMethod(string , 'requiredIf', function requiredIf( conditionFunction , thisBinding , errorMessage   , ...args ) {
          // test is custom validation method by yup
          return this.test(`requiredIf-test`, errorMessage, function (value) {
              const { path , createError  } = this;
              return (
                conditionFunction.call(this , value) || 
                createError({ path, message: errorMessage || '{$path} is required custom' })
              );
            });
        })
    } ,
}
export default validations;
  const isEmail = (email)=>{
      const emailSchema = string().email();
     return emailSchema.isValidSync(email);
  }
  const isPhone = (phone) =>{
    if(!phone)
      return true;
    const phoneSchema = string().length(11).matches(/^01[0-9]{9}$/igm);
    return phoneSchema.isValidSync(phone);
  }
  const isPhotoPathDefined = (path) =>{
    const phoneSchema = string().required();
    return phoneSchema.isValidSync(path);
  }