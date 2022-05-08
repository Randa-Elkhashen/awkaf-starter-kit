export default class LoadOnScrollPlugin {
    #observer;
    #isCallBackSetteled = true;
    #observerOptions = {
        root: null ,
        rootMargin: '50px',
    }
    constructor(observerOptions = {}){
       Object.assign( this.#observerOptions , observerOptions );
    }
    initLoadingOnScroll( CallBackFunction  ){
        this.#observer = new IntersectionObserver( (entries) => {
            entries.forEach(async (entry) => {
                if (entry.isIntersecting  ) {
                    try {
                        this.#isCallBackSetteled = false;
                        await CallBackFunction();
                        this.#isCallBackSetteled = true;
                    } catch (e) {
                        this.#isCallBackSetteled = true;
                        throw(e)
                    }
                }
            },this);
        }, this.#observerOptions );
    }
    detachLoader(){
        this.#observer.disconnect()
    }
    attachLoader(loader) {
        setTimeout(()=> {
            this.#observer.observe(loader);
        }, 100);
    }
}
  