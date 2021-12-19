const path = require("path");

module.exports = {
  outputDir: path.resolve(__dirname, "./dist"),
  assetsDir: "./",
  chainWebpack: (config) => {
    config
      .entry("main-ltr")
      .add("./src/assets/sass/main-ltr.scss")
      .end();
    config
      .entry("main-rtl")
      .add("./src/assets/sass/main-rtl.scss")
      .end();
  },
  css: {
    extract: {
      filename: "[name].css", // to have a name related to a theme
      chunkFilename: "css/[name].css",
    },
    modules: false,
    sourceMap: false,
    loaderOptions: {
      scss: {
        additionalData: `
          @import './src/assets/sass/Directions/_ltr-direction.scss';
          @import "./src/assets/sass/main.scss";
        `
      }
    }
  },
  configureWebpack: {
    devtool: 'source-map'
  }
};
