import ApiService from "../../../services/services";
import { photosUrl } from "./http-constants";
import { AsyncHandler } from "../plugins/util";
import createNewRequest from "../../../services/createNewRequest";
import httpConstants from "../../../services/http-constants";
export default class NewsServices extends ApiService {
  constructor() {
    super("photos" , {baseUrl : photosUrl});
   
  }
  async getAllPhotos(){
    return  await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getUrl() +`/?albumId=${this.ScrollCount}` ,{}))  
   }
   async getAlbumById(albumId){
    return  await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
     this.getUrl() +`/?albumId=${albumId}` ,{}))  
   }
   async addNewPhoto(photo){
     return await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.POST , 
      this.getUrl(),{photo : photo}))  
   }
}


