import { APIService ,  httpConstants , createNewRequest , photosUrl } from "@/services";
import { AsyncHandler } from "@/plugins";
export default class PhotosService extends APIService {
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


