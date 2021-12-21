# Services

## APIService

- is an Interface that can`t be inialized , u can extends it only
- is the base class for each End Point
- **properties**
  - endPoint ... required
  - options .... { baseUrl ?:String}
- **methods**
  - getRequestUrl ... return BaseUrl + EndPoint
- **Errors**
  - Type Error
    - message : Api Service Can`t be initalized , u can extends it only
    - reason : when try to inialize new instance from ApiService
  - Error
    - message : Resource is not provided
    - reason : when ApiService EndPoint not Provided to Constructor

## EndPointService extends ApiService

    - each baseUrl End Point has its own Service Class 
    - each service contain all end Points Apis
> example

- base url is <https://jsonplaceholder.typicode.com>
- endPoints are :
  - posts
  - comments
  - albums
  - photos
  - todos
> so we will Need 5 Services Classes jsFiles as Follows :
- PostsService.js , CommentsService.js , PhotosService.js , TodosService.js , Albums.js

- lets talk about one service methods that  may contain
  - getAllPosts
  - GetPostById
  - GetCommentsByQueryString
  - GetPostComments
  - PostNewComment
  - DeletePostById

> lets see an example For Post Service

```javascript
import ApiService from "./ApiService.js";
import AsyncHandler from "./plugins"
import { createNewRequest , httpConstants } from "./http"
export class PostsService extends ApiService {
    constructor(){
        super("posts");
        // now getRequestUrl = baseUrl/posts
        // any additional routes and queries would be added on each method seperatly
    }
    async getAllPosts(){
      return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getRequestUrl(),{}))  
    }
    async getPostById(id){
      return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.Get ) , this.getRequestUrl() +`/${id}`)
    }
    async addNewPost( post ){
        return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.Post ) , this.getRequestUrl() , post )
    }
}
```
> then import all services to module index , after that collect all modules indexs into main services index

```js
// module service index
import PhotosService from './PhotosService';
import  PostsService from './PostsService';
export const photos = Object.freeze(new PhotosService() )
export const posts = Object.freeze(new PostsService() )
```
```js
// main services index
export { default as APIService} from "./APIService";
// import http index
export { http , setHttpDefaults , httpConstants ,  photosUrl , postsUrl, createNewRequest  } from "./http";
// import all modules services and export it for use inside components
export { photos , posts } from "../modules/global/services";
```
