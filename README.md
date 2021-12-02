# td-starter-kit

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```
## Project structure
### Introduction
**td-starter-kit** is a module based project that provides out-of-the-box modules to help accelerating the development proccess.

### Module structure
```Modules``` directory contains a list of modules, each module serves as a standalone component of the project. hence each module will contain its own ```store, routes, services, styles, components and views```.

#### Store
```store.js``` file uses [Vuex](https://next.vuex.vuejs.org/) to handle state management, each store has its own ```initial state, mutations, getters and actions```.

Example: 
```javascript
const authStore = {
    namespaced: true,
    state() {},
    getters: {},
    mutations: {},
    actions: {}
}
export default authStore
```

#### Routes
```routes.js``` file consists of an array of objects, each object respresents a route, for example
```javascript
const routes = [
    {
        path: '/login',
        name: 'Login',
        component: () => import('./components/Login')
    }
]

export default routes
```
```routes.js``` follows [Vue-Router](https://next.router.vuejs.org/) structure, hence any of vue-router route parameters can be added to route object.

#### Services
```services.js``` file containes a list of APIs that's being used by the module components and views, each API calls ```createNewRequest()``` function, this function accepts the following parameters ```httpConstants.HttpTypes```, ```url``` and ```params``` if found. for example

```javascript
import axios from "axios";
import createNewRequest from "../../services/createNewRequest";
import httpConstants from "../../services/http-constants";

export function doLogin(body, onSuccess, onError) {
    createNewRequest(httpConstants.HttpTypes.POST, axios.defaults.baseURL + 'lorem', JSON.stringify(body)).then(() => {
        onSuccess()
    }).catch((error) => {
        onError(error)
    })
}
```
```createNewRequest()``` is an async function that resolves a promise, hence success and failure callbacks can be handled in both ```then()``` and ```catch()```.

#### Styles
```styles``` directory contains a list of views and components styles which are imported to ```main.scss``` file. each styling file should correspond to a view or a component, for example ```Login.vue``` view should have its corresponding style file such as ```Login.scss```.