class loadOnScrollPlugin {
    loadOnScroll(CallBackFunction, isThereMoreData) {
      let observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
                if (entry.isIntersecting && isThereMoreData) {
                    CallBackFunction();
                }
            });
        });
  
        setTimeout(function () {
            let container = document.querySelector(".footer");
            observer.observe(container);
        }, 100);
    }
}
  
export const LoadOnScroll = new loadOnScrollPlugin();  