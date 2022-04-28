# Forms Composition API

## useForm

### Description

- provide static and dynamic Forms with its validations

### Dependencies

- Plugins
  - vuelidate V 4.0

### Getting started

> install dependencies

- npm i vuelidate@4.0

```javascript
import { useForm } from "forms";
import { required } from "@vuelidate/validators"
export default {
  setup(){
    // init your static form and validations
    const staticForm = {
      email : "" 
    }
    const staticRules = {
      email : required
    }
    const {form , v$ , addField , addForm }  = useForm( staticForm, staticRules );
    return { form , v$ , addField , addForm }
  },
  mounted(){
    // add dynamic field
    addField({phone : ""} , { required });
    addForm({address : ""} , { required });
  }
}
```

## usePhotoPicker

### Description

- provide model based photo picker

### Dependencies

- Dependend Free

### Getting started

```html
<template>
<!-- template -->
  <input type="file" ref="photoInput" />
  <img :src="photoSrc || require('assetsPath/staticImage.extension'" ref="photoElement"  />
</template>
<script>
import { usePhotoPicker } from "forms";
export default {
  setup(){
    // init your static form and validations
      const {
      photoInput,
      photoElement,
      photoSrc,
    } = usePhotoPicker();
    return { photoInput , photoElement, photoSrc}
  },
}
</script>
```

# API REFRENCES

## useForm

### params : form:Object , validations:Object

### returns : Object

| property |  type    | initailValue |              description             |
|:--------:|:--------:|:------------:|:------------------------------------:|
|   form   | Object   |      {}      |          contain form fields         |
|    v$    | Object   |       -      | contain vuelidate validation schema  |
| addField | Function |       -      |  to add dynamic Field                |
| addForm  | Function |       -      | to add dynamic Form                  |

- addField params : field:Object , rule:Object
- addForm params : form:Object , rules:Object

## usePhotoPicker

### returns : Object

| Property      | type    | initialValue  | description                                       |
|-------------- |-------- |-------------- |-------------------------------------------------- |
| photoInput    | node    | null          | to be added to input element as ref               |
| photoElement  | node    | null          | to be added to presentation element (img) as ref  |
| photoSrc      | string  | undefined     | is the picked photo src                           |
