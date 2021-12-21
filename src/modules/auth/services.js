import axios from "axios";
import createNewRequest from "../../services/http/createNewRequest";
import httpConstants from "../../services/http/http-constants";

export function doLogin(body, onSuccess, onError) {
    createNewRequest(httpConstants.HttpTypes.POST, axios.defaults.baseURL + 'lorem', JSON.stringify(body))
    .then(() => {
        onSuccess()
    }).catch((error) => {
        onError(error)
    })
}