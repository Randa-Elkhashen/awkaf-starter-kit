import { STATUS_CODES } from "../../global/Constants";
import { ErrorMessage } from "./ErrorMessage";
export default class AsyncHandler {
    static listeners = [];
    static addRequestEventListener = (listener)=> this.listeners.push(listener)
    static notifyListeners( isRequestPending ){
        if(this.listeners.length)
            this.listeners.forEach(listener => {
                listener( isRequestPending )
            });
    }
    static async responseHandler( asyncRequestFunc ){
        this.notifyListeners(true)
        let res = await asyncRequestFunc(asyncRequestFunc);
        this.notifyListeners(false)
        if(res.status >= STATUS_CODES.SUCCESS && res.status < STATUS_CODES.SUCCESS + 99)
        return res;
        throw new ErrorMessage()
    }
    static errorHandler( callFunction ){
        try{
            callFunction();
        }catch(e){
            let error = e;
            if(e instanceof Error ){
                error = new ErrorMessage([e.message]);
            }
            return error;
        }
    }
}