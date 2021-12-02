import axios from "axios";

export default function setHttpDefaults() {
  axios.defaults.baseURL = "https://mocki.io/v1/";
}
