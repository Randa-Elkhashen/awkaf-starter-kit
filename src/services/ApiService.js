import axios from "axios";
export default class ApiService {
    constructor(endPoint , options = { baseUrl :axios.defaults.baseURL }) {
        if(this.constructor == ApiService )
          throw new TypeError("Api Service Can`t be initalized , u can extends it only");
        if (!endPoint) throw new Error("Resource is not provided");
        this.endPoint = endPoint;
        this.baseUrl = options.baseUrl;
      }
      getRequestUrl() {
        return `${this.baseUrl}/${this.endPoint}`;
      }
    }
