import axios from "axios";
import createNewRequest from "./createNewRequest";
import httpConstants from "./http-constants";
import {AsyncHandler } from "../modules/global/plugins/util";

export default class ApiService {
    constructor(endPoint , options = { baseUrl :axios.defaults.baseURL }) {
        if (!endPoint) throw new Error("Resource is not provided");
        this.endPoint = endPoint;
        this.baseUrl = options.baseUrl;
      }
      async getAllData(){
       return  await AsyncHandler.responseHandler( ()=> createNewRequest(httpConstants.HttpTypes.GET , 
        this.getUrl() +`${this.query}=${this.queryValue}` ,{}))  
      }
      getUrl() {
        return `${this.baseUrl}/${this.endPoint}`;
      }
    }