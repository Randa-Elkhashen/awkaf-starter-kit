/********* 
useg of this dirctive

It already imported glable so all you need to do to add v-lazyload to the img parent
then add the bind img to to :data-url and make a dumy img in img src

-An example for useg
<span v-lazyload>
    <img :data-url="item.thumbnailUrl" src="../assets/spinner.gif" alt="card image" />
</span>

**********/


export default {
    inserted: el => {
      function loadImage() {
        const imageElement = Array.from(el.children).find(
          el => el.nodeName === "IMG"
        );
  
        if (imageElement) {
          imageElement.addEventListener("load", () => {
            setTimeout(() => el.classList.add("loaded"), 100);
          });
          imageElement.addEventListener("error", () => console.log("error"));
          imageElement.src = imageElement.dataset.url;
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
          threshold: "0"
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
  