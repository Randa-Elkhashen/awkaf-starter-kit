import PhotosService from "./PhotosServices";
  
  const  GlobalServices =  Object.freeze({
    Photos: new PhotosService(),
    
  });

  export default GlobalServices;