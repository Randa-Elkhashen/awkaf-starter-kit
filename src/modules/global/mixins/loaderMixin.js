import { LoadOnScroll } from "../plugins/loadOnScroll";

 const loaderMixin = {
  computed: {
    LoadOnScroll: () => LoadOnScroll,
  },
};
export default loaderMixin;
