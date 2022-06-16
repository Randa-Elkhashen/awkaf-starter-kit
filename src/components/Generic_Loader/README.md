# Generic_Loader Component Guide

## Usage

### Declare in component ###

```html
<template>
    <div>
        <Generic_Loader 
            :is-full-page="false"
            :is-full-element="true"
            :background-color="`blue`"
        >
            Change Default Text
            <template v-slot:td-generic-laoder_icon>
                <img src="../../assets/logo.png" alr="loader" />
            </template>
            <template v-slot:td-generic-laoder_text>
                <p>Loading Additional Text</p>
            </template>
        </Generic_Loader>
    </div>
</template>

<script>
import Generic_Loader from "./Generic_Loader.vue";

export default {
    name: "Example_Loader",
    components: {Generic_Loader}
}
</script>
```

### Declare General ###

#### Main.js ####
```js
import Generic_Loader from "../src/components/Generic_Loader/Generic_Loader.vue";

createApp(App).use(store).use(router).component("Generic_Loader", Generic_Loader)
```

#### in required component ####
```html
<template>
    <Generic_Loader 
        :is-full-page="false" 
        :is-full-element="false"
        :background-color="`yellow`"
    >
        // elemnts
    </Generic_Loader>
</template>
```

## Available props

Attribute     | Type         | Description  
------------- | -------------| -------
is-full-page  | Boolean | set loader to be full screen
is-full-element  | Boolean | limit loader to its container
background-color | String | Customize the overlay background color
 
* When ```is-full-element``` the container element should be positioned as position: relative