import axios from "axios";
import { ApiUrl } from "../plugins/environment";

class ApiService {
  baseUrl = `${ApiUrl}`;
  resource;
  ScrollCount;
  isThereMoreData;
  GenericListingData;

  constructor(resource) {
    if (!resource) throw new Error("Resource is not provided");
    this.resource = resource;
    this.ScrollCount = 1;
    this.isThereMoreData = true;
    this.GenericListingData = [];
  }

  getUrl(id = "") {
    return `${this.baseUrl}/${this.resource}/${id}`;
  }

  fetch() {
    return axios
      .get(
        this.getUrl(`?albumId=${this.ScrollCount}`))
      .then((res) => {
        if (res.data != "") {
          if (this.ScrollCount == 1) {
            this.GenericListingData = res.data;
            this.ScrollCount++;
          } else {
            this.GenericListingData = this.GenericListingData.concat(
              res.data
            );
            this.ScrollCount++;
          }
        } else {
          this.isThereMoreData = false;
          if (this.ScrollCount == 1) {
            this.GenericListingData = [];
          }
        }
      })
      .catch((err) => {
        console.log(err);
      })
      .then(() => {
        return {
          GenericListingData: this.GenericListingData,
          isThereMoreData: this.isThereMoreData,
          isLoading: false,
        };
      });
  }

  get(id) {
    return axios
      .get(this.getUrl(id))
      .then((res) => {
        return res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  }
}

class PhotosService extends ApiService {
  constructor() {
    super("photos");
  }
}

export const ListingDataAPI = {
  Photos: new PhotosService(),
};
