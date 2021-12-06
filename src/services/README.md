# Services

## ApiService

- is an Interface that can`t be inialized , u can extends it only
- is the base class for each End Point
- properties
  - endPoint ... required
  - options .... { baseUrl ?:String}
- methods
  - getRequestUrl ... return BaseUrl + EndPoint
- Errors
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
so we will Need 5 jsFiles Services Classes as Follows :
- PostsService.js , CommentsService.js , PhotosService.js , TodosService.js

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
        return await AsyncHandler.responseHnadler( ()=> createNewRequest(httpConstants.HttpTypes.Post ) , this.getRequestUrl() , post )
    }
}
```
