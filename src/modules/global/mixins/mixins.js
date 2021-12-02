import loaderMixin from "./loaderMixin";
import swiperBaseMixin , { swiperConsumeThumbMixin} from "./swiperConfigMixins";

const GlobalMixins  = {
    mixins : [loaderMixin , swiperBaseMixin , swiperConsumeThumbMixin ]
} 
 export default GlobalMixins;