
<style>
    a{
        color:unset;
        text-decoration : unset;
    }
</style>

# content
## <a href="#features" >- Features</a>

# Vee-validate vs Vuelidate

## 1. About (according to 2021)

### vee validate

- written almost by **TS**
- issues **2700** closed , **17** still opened
- supports **Vue2 , Vue3**

### vuelidate

- written almost by **JS**
- issues **600** closed , **100** still opened
- supports Vue2 , Vue3 but still beta version

## advantages and Disadvantages

### vee-validate

- declarative ... more easy than imperitive paradium
- flexiable with sync and asyn validations
- Minimal just handle complicated process , and let you option to setup what u need with it.
- tree shakeable ... faster compile time
- UI Agnostic : compatiple with Native , Custom Components
- Built in Rules that cover most of UI validations Needs
- Localization Supports
- Documented in details

### vuelidate

- Dependency free, minimalistic library
- Model based
- Dependency free, minimalistic library
![image](files/Users/jzhang/Desktop/Isolated.png)

## <a href="#" id="features" name="tith"># features and Implementations</a>
### 1. VeeValidate

- validation is done by 2 Apis (**Component** Api , **Composition** Api )
- there is 2 levels of validations Form Level , Field Level
- validators types in VeeValidations is using :
    - Build in Validator (**Global**) using **defineRule**
        - <https://vee-validate.logaretm.com/v4/guide/global-validators#defining-global-validators>
    - yup validators Library
    - zod validators like yup but from veeValidate
    - custom validator
> Field Level Validations By **Component** Api
- using **Field** Component

```java
<template>
  <Form>
     //field with yupIsRequired
    <Field name="field" :rules="yupIsRequired" />
    <ErrorMessage name="field" />
    
    //field with globalIsRequired
    <Field name="field" :rules="globalIsRequired" />
    <ErrorMessage name="field" />

    //field with customIsRequired
    <Field name="field" :rules="customIsRequired" />
    <ErrorMessage name="field" />



  </Form>
</template>
<script>
import { Field, Form, ErrorMessage } from 'vee-validate';
export default {
  components: {
    Field,
    Form,
    ErrorMessage,
  },
  methods: {
    isRequired(value) {
      if (value && value.trim()) {
        return true;
      }
      return 'This is required';
    },
  },
};
</script>
```
