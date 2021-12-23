import PhotosService from './PhotosService';
import  PostsService from './PostsService';
import  UsersService from './UsersService';
export const photos = Object.freeze(new PhotosService() )
export const posts = Object.freeze(new PostsService() )
export const users = Object.freeze(new UsersService() )
