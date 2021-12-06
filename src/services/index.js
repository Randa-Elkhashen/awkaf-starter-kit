import PhotosService from './PhotosService';
import  PostsService from './PostsService';
export const photos = Object.freeze(new PhotosService() )
export const posts = Object.freeze(new PostsService() )