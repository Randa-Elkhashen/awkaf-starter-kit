/********* 
usage of this directive

It already imported global, So all you need to do is to add v-lazyload to the img parent
then add the binded img to :data-url and make a dummy img in img src

-An example for usage
<span v-lazyload>
    <img :data-url="item.thumbnailUrl" src="../assets/spinner.gif" alt="card image" />
</span>

**********/


export default {
    mounted: el => {
      function loadImage() {
        const imageElement = Array.from(el.children).find(
          el => el.nodeName === "IMG"
        );
  
        if (imageElement) {
          imageElement.addEventListener("load", () => {
            setTimeout(() => el.classList.add("loaded"), 100);
          });
          imageElement.addEventListener("error", () => console.log("error"));

          if(imageElement.dataset.url) {
            imageElement.src = imageElement.dataset.url;
          } else {
            imageElement.src = imageElement.dataset.defaultimg;
          }
          
        }
      }
  
      function handleIntersect(entries, observer) {
        entries.forEach(entry => {
          if (!entry.isIntersecting) {
            return;
          } else {
            loadImage();
            observer.unobserve(el);
          }
        });
      }
  
      function createObserver() {
        const options = {
          root: null,
          rootMargin: '120px',
          threshold: 0.25
        };
  
        const observer = new IntersectionObserver(handleIntersect, options);
  
        observer.observe(el);
      }
  
      if (!window["IntersectionObserver"]) {
        loadImage();
      } else {
        createObserver();
      }
    }
};
  