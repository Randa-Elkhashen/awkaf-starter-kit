import useResizer from "./useResizer"
export default {
  name : "CustomLightBox" ,
  setup(_props) {
    let { resizeHandler , attachResizer} =  useResizer( 500 )
    return { resizeHandler , attachResizer }
  } ,
  mounted() {
    this.attachResizer = true;
    this.resizeHandler = ()=> this.setXPosition(this.index-1)
  },
};
