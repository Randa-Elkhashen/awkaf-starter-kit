
import {string , number, addMethod }  from 'yup';
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
    } ,
}
export default validations;
  const isEmail = (email)=>{
      const emailSchema = string().email();
     return emailSchema.isValidSync(email);
  }
  const isPhone = (phone) =>{
    const phoneSchema = string().length(12).matches(/^01[0-9]/igm);
    return phoneSchema.isValidSync(phone);
  }