import {APIService} from "@/services";
import {AsyncHandler} from "@/plugins"
import { createNewRequest , httpConstants , postsUrl } from "@/services"
export default class PostsService extends APIService {
    constructor(){
        super("posts" , {baseUrl : postsUrl });
        // now getRequestUrl method returns "baseUrl/posts"
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