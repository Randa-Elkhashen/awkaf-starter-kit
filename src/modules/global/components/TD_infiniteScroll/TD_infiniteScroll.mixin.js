import { LoadOnScrollPlugin } from "@/plugins";

 const loaderMixin = {
  computed: {
    LoadOnScroll: () => new LoadOnScrollPlugin(),
  },
};
export default loaderMixin;

