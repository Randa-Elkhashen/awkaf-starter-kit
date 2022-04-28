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