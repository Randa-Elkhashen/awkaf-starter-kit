
<style>
    a{
        text-decoration : unset;

    }
    a:hover{
      text-decoration : unset;
      color:white;
    }
</style>

# content

## <a href="#about" >- about </a>

## <a href="#about" >- advantages and disadvantages </a>

## <a href="#basics" >- Basics</a>

## <a href="#features" >- Features</a>

<div style="margin-bottom:20px;"></div>

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

## <a href="#" id="basics" name="tith"># Basics</a>

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

```js
// main.js
import { defineRule } from "vee-validate";
import { required } from "@vee-validate/rules";

defineRule('required', required);

```

```html
<!--  form.vue-->
<template>
<Form>
    <!--  field with yupRequired starts-->
    <Field name="username" :rules="yupRequired" />
    <ErrorMessage name="username" />
    <!--  field with yupRequired ends-->

    <!--  field with globalIsRequired starts-->
    <Field name="username2" :rules="globalRequired" />
    <ErrorMessage name="username2" />
    <!--  field with globalIsRequired ends-->

    <!--  field with BuiltInRequired starts-->
    <Field name="username3" :rules="builtInRequired" />
    <ErrorMessage name="username3" />
    <!--  field with BuiltInRequired ends-->

    <!--  field with customRequired starts-->
    <Field name="username4" :rules="customRequired" />
    <ErrorMessage name="username4" />
    <!--  field with customRequired ends-->

  </Form>
</template>
<script>
import { Field, Form, ErrorMessage } from 'vee-validate';
import { required } from "@vee-validate/rules"
import{ string }  from "yup"
export default {
  components: {
    Field,
    Form,
    ErrorMessage,
  },
  data() {
      return {
        yupRequired : yup.string().required("this is yup is Required") ,
        globalRequired : "required" ,
      }
  },
  methods: {
    customRequired(value) {
      if (value && value.trim()) {
        return true;
      }
      return 'This is custom isRequired rule';
    },
    builtInRequired : required ,
  },
};
</script>
```

> Note : validation binding dosen`t required fields data object , just validation Layer only
> Note : validation binding is done by sending props ( name , rule ) to Field Component

> Note : error message is binded to each field by prop( name ) .. it has to be same name as name Field prop

### 2. Vuelidate V2

- validation is done by Composition Api Only
- there is just 1 level validations and done by validation method that return validation instance

> note : previous version validations depend on instance instead of method , but still supported due to backword compatipility reasons only

- validations layer required data Object that contains each field value

```html
<!--  component with vuelidate -->
<template>
<!--  field with BuiltIn validation -->
<div>
    <input type="text" v-model.trim="v$.username.$model" />

    <div class="input-errors" v-for="error of v$.username.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>
<!--  field with BuiltIn validation ends -->

<!--  field with BuiltIn validation -->
<div>
    <input type="text" v-model.trim="v$.username2.$model" />
    <div class="input-errors" v-for="error of v$.username2.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>
<!--  field with BuiltIn validation ends -->

<!--  field with BuiltIn validation -->
<div>
    <input type="text" v-model.trim="v$.username3.$model" />
    <div class="input-errors" v-for="error of v$.username3.$errors" :key="error.$uid">
      <div class="error-msg">{{ error.$message }}</div>
    </div>
</div>
<!--  field with BuiltIn validation ends -->
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
      username: { required }, // default message
      username2: { requiredWithCustomMessage :  helpers.withMessage('This field cannot be empty', required) }, // custom message,
      username3: { required , mustBeCool : helpers.withMessage('must be cool',   (value) => value.includes('cool'))  } // custom validation with mixed rules
    }
  }
}
</script>
```

> Field Level Validations By **Composition** Api

- using **useField** hook

```html
<template>
    <!--  field with yupRequired starts-->
    <div>
      <input v-model="username.value" type="text" />
      <span>{{ username.errorMessage }}</span>
    </div>
    <!--  field with yupRequired ends-->

    <!--  field with globalIsRequired starts-->
    <div>
      <input v-model="username2.value" type="text" />
      <span>{{ username2.errorMessage }}</span>
    </div>
    <!--  field with globalIsRequired ends-->

    <!--  field with BuiltInRequired starts-->
    <div>
      <input v-model="username3.value" type="text" />
      <span>{{ username3.errorMessage }}</span>
    </div>
    <!--  field with BuiltInRequired ends-->

    <!--  field with customRequired starts-->
    <div>
      <input v-model="username4.value" type="text" />
      <span>{{ username4.errorMessage }}</span>
    </div>
    <!--  field with customRequired ends-->
</template>
<script>
import { useField } from 'vee-validate';
import{ string , addMethod }  from "yup"
import { required } from "@vee-validate/rules"

export default {
  setup() {
    function isRequired(value) {
      if (value && value.trim()) {
        return true;
      }
      return 'This is custom required';
    }
    let customYup = addMethod( string , "customRequired" ,  isRequired )

    const username = useField('username', isRequired);
    const username2 = useField('username2', string().customRequired("this is yup required"));
    const username3 = useField('username3', isRequired);
    const username4 = useField('username4', isRequired);
    return {
      username : {
        errorMessage,
        value,
      },
      username2 : {
        errorMessage,
        value,
      },
      username3 : {
        errorMessage,
        value,
      },
      username4 : {
        errorMessage,
        value,
      },
    };
  },
};
</script>
```

## <a href="#" id="features" name="tith"># Features </a>

### 1.validation Rules Chanining

> **Vee Validate** supports chaining via the following :

- yup addMethod or test
- globalRules with defineRule

```js
import { string , addMethod }  from "yup"
      addMethod( string, "customRequired" , function( message ) {
        return this.test("customRequired", message, function(value) {
            const { path, createError } = this;
                          if (value && value.trim()) {
                return true;
              }
              return createError();
        });
    });
```

- for more about addMehtod refer to this link
<https://medium.com/@iamarkadyt/how-does-yup-addmethod-work-creating-custom-validation-functions-with-yup-8fddb71a5470>

> **Vuelidate** supports chaining via the following:
>
-

```js
  validations () {
    return {
      fieldName: { required , mustBeCool : helpers
      .withMessage('must be cool',
        (value) => value.includes('cool'))
      } // custom validation
    }
  }
```

### 2. validationsRules Triggers and Custmization

> **Vee Validate** default trigger in these events on Fields :

- change , validationModelChange , blur , submit
- you can add aggressive triggers like input event by custmization exposed by configure method

```js
import { configure } from 'vee-validate';
// Default values
configure({
  validateOnBlur: true, // controls if `blur` events should trigger validation with `handleChange` handler
  validateOnChange: true, // controls if `change` events should trigger validation with `handleChange` handler
  validateOnInput: false, // controls if `input` events should trigger validation with `handleChange` handler
  validateOnModelUpdate: true, // controls if `update:modelValue` events should trigger validation with `handleChange` handler
});
```

> **Vuelidate** default trigger in these events :

- input , validate method

```js
export default {
  methods: {
    async submitForm () {
      const isFormCorrect = await this.v$.$validate()
      // you can show some extra alert to the user or just leave the each field to show it's `$errors`.
      if (!isFormCorrect) return
      // actually submit form
    }
  }
}
```

### 3. Validation Status

> **Vee Validate** provide validations status on both Api by meta object

```html
<template>
  <input v-model="value" type="text" />
  <button :disabled="!meta.dirty">Submit</button>
</template>
<script>
import { useField } from 'vee-validate';
export default {
  setup() {
    // Provide initial value to make `meta.dirty` accurate
    const { value, meta } = useField('fieldName', undefined, {
      initialValue: '',
    });
    return {
      errorMessage,
      value,
      meta,
    };
  },
};
</script>
```

> **vuelidate** provide validations status on both Api by validation model as follows:

```html
<label>
  <input v-model="name">
  <div v-if="v$.name.$error">Name field has an error.</div>
</label>
```

- validation status on each field and all form :

```json
  "$dirty": false,
  "$error": false,
  "$errors": [],
  "$silentErrors": [],
  "$invalid": false,
```

### 4. submit handling

> **Vee Validate** handle submittion in both APIs by handleSubmit , submitForm

- handleSubmit executes only on validations passes .. in SPA
- submitForm used in nonAjax submittation ... in cms applications
- Components Api
```html
<template>
  <Form @submit="onSubmit" :validation-schema="schema">
    <Field name="email" type="email" />
    <ErrorMessage name="email" />
    <Field name="password" type="password" />
    <ErrorMessage name="password" />
    <button>Submit</button>
  </Form>
</template>
<script>
import { Form, Field, ErrorMessage } from 'vee-validate';
import * as yup from 'yup';
export default {
  components: {
    Form,
    Field,
    ErrorMessage,
  },
  data() {
    const schema = yup.object({
      email: yup.string().required().email(),
      password: yup.string().required().min(8),
    });
    return {
      schema,
    };
  },
  methods: {
    onSubmit(values) {
      // Submit values to API...
      alert(JSON.stringify(values, null, 2));
    },
  },
};
</script>
```
- in Composition Api 
```html
<template>
  <form @submit="onSubmit">
    <!-- some fields -->
  </form>
</template>
<script>
import { useForm } from 'vee-validate';
export default {
  setup() {
    const { handleSubmit } = useForm();
    const onSubmit = handleSubmit(values => {
      alert(JSON.stringify(values, null, 2));
    });
    return {
      onSubmit,
    };
  },
};
</script>
```
> **vuelidate** dosen`t handle validation out of the box , u must handle it by validating forms first then check its status
```js
export default {
  methods: {
    async submitForm () {
      const isFormCorrect = await this.v$.$validate()
      // you can show some extra alert to the user or just leave the each field to show it's `$errors`.
      if (!isFormCorrect) return
      // actually submit form
    }
  }
}
```

