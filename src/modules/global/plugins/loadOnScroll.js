class loadOnScrollPlugin {
    #observer;
    #isCallBackSetteled = true;
    initLoadingOnScroll( CallBackFunction  ){
        this.#observer = new IntersectionObserver( (entries) => {
            entries.forEach(async (entry) => {
                if (entry.isIntersecting  ) {
                    if( this.#isCallBackSetteled ){
                        this.#isCallBackSetteled = false;
                        await CallBackFunction();
                        this.#isCallBackSetteled = true;
                    }
                    }
                },this);
            }, );
    }
    detachLoader(){
        this.#observer.disconnect()
    }
    attachLoader() {
        setTimeout(()=> {
            let container = document.querySelector("#observer");
            this.#observer.observe(container);
        }, 100);
    }
}
  
export const LoadOnScroll = new loadOnScrollPlugin();  