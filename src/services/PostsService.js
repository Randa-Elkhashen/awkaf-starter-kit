import ApiService from "./ApiService.js";
import {AsyncHandler} from "@/plugins"
import { createNewRequest , httpConstants , photosUrl } from "./http"
export default class PostsService extends ApiService {
    constructor(){
        super("posts" , {baseUrl : photosUrl });
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