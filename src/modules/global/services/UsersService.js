import {APIService} from "@/services";
import {AsyncHandler} from "@/plugins"
import { createNewRequest , httpConstants , postsUrl } from "@/services"
export default class UsersService extends APIService {
    constructor(){
        super("users" , {baseUrl : postsUrl });
        // now getRequestUrl method returns "baseUrl/posts"
        // any additional routes and queries would be added on each method seperatly
    }
    async getAllUsers(){
      return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getRequestUrl(),{}))  
    }
}