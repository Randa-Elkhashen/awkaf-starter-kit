import ApiService from "./ApiService";
import httpConstants , { photosUrl , postsUrl } from "./http/http-constants";
import { AsyncHandler } from "../plugins";
import createNewRequest from "./http/createNewRequest";
export default class PhotosService extends ApiService {
  constructor() {
    super("photos" , {baseUrl : photosUrl});
  }
  async getAllPhotos(){
    return  await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getRequestUrl() +`/?albumId=${this.ScrollCount}` ,{}))  
   }
   async getAlbumById(albumId){
    return  await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getRequestUrl() +`/?albumId=${albumId}` ,{}))  
   }
   async addNewPhoto(photo){
     return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.POST , 
      this.getRequestUrl(),{photo : photo}))  
   }
}


