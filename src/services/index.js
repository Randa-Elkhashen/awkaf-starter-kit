export { default as APIService} from "./APIService";
// import http index
export { http , setHttpDefaults , httpConstants ,  photosUrl , postsUrl, createNewRequest  } from "./http";
// import all modules services and export it for use inside components
export { photos , posts , users } from "../modules/global/services";