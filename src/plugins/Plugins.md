# Plugins

# LoadOnScroll

## Dependences

- LoadOnScroll is dependency Free

## Getting Started

```javascript
import  LoadOnScroll  from "LoadOnScroll";
import fetchData from "fetchData" // service method
const scrollLoader = new LoadOnScroll();
scrollLoader.initLoadingOnScroll( fetchData );
// start load on scroll
scrollLoader.attachLoader(document.querySelector(".lds"));
// stop load on scroll
scrollLoader.detachLoader();
```

# AsyncHandler
## Description 
- is an API Wrapper layer for async process that provide smooth and easy call , error handeling , listener , state management for I/O operations
## Dependences
- no dependencies
## Getting Started
```javascript
import AsyncHandler from "AsyncHandler";
import fetchData from "fetchData";
AsyncHandler.responseHandler(fetchData);
```
- u can listen to any request call inside AsyncHandler
```javascript
import AsyncHandler from "AsyncHandler";
import fetchData from "fetchData";
AsyncHandler.addEventListener(( isRequestPending )=>{
    console.log(isRequestPending)
    // play loader onFetching
    if(isRequestPending){
        showLoader(document.querySelector(".lds"))
    }else {
        hideLoader(document.querySelector(".lds"))
    }
})
// fetchData
AsyncHandler.responseHandler(fetchData);
/*
log result :
true 
false
/* results 
```

# vuelidateValidationMessages
## Description
- to provide default message for various types of validations
## Dependences 
- vuelidate v2.0

## Getting Started
- install vuelidate 
> npm install @vuelidate/core @vuelidate/validators
- use vuelidateValidationMessages in validation schema 
### example : 
```js
import { vuelidateValidationMessages } from "plugins/utils"
const fields = {
    email:""
}
const validations = {
    email: {
        // add required validations with custom message
        // error message will be  : email is required
        required: vuelidateValidationMessages.requiredMessage("email"), 
    }
```
# API REFERENCE

## Methods

| name                | Params           | return | expected error message | description                                                        |
|---------------------|------------------|--------|-----------------|--------------------------------------------------------------------|
| requiredMessage | label | ValidationRuleWithParams   | < label > is required          | to modify required field error message |
| minMessage        | length             | ValidationRuleWithParams   | min < length > chars          | to start loadOnScroll                                              |
