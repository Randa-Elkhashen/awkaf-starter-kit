import statusCodes from "./statusCodes.json";
export class AsyncHandler {
    static status = statusCodes
    static async responseHandler( asyncRequestFunc ){
        let res = await this.requestWrapper(asyncRequestFunc);
        if(res.status == this.status.SUCCESS)
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
    static async requestWrapper( asyncRequest ){
        return await asyncRequest()
    }
}
//#region errors
Error.prototype.getErrorMessages = function(){
    return [this.message]
  }
export class ErrorMessage extends Error {
      #displayMessages;
      constructor(ApiMessages =["Something went wrong , Please Contact system Adminstrator"] ) {
          super(ApiMessages[0]);
          this.#setDisplayMessages(ApiMessages);
        }
        getErrorMessages(){
            return this.#displayMessages;
        }
        #setDisplayMessages(messages){
            this.#displayMessages = messages;
        }
  }
//#endregion errors
export default { AsyncHandler , ErrorMessage }