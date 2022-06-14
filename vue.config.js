const path = require("path");

module.exports = {
  outputDir: path.resolve(__dirname, "./dist"),
  assetsDir: "./",
  chainWebpack: (config) => {},
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
          @import "./src/assets/sass/Abstract/_mixins.scss";
          @import "./src/assets/sass/Abstract/_variables.scss";
          `
      }
    }
  },
  configureWebpack: {
    devtool: 'source-map'
  }
};
