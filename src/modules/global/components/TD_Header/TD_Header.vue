<template src="./TD_header.html">

</template>
<script>
import "./header.scss"
import {STORAGE_VARIABLES} from "@/global/Constants.js";
    export default {
        name: 'fontResizeAndColorInverter',
        components: {
        },
        data: function () {
            return {
                fontResult: "" , 
                fontSize : parseInt(localStorage.getItem(STORAGE_VARIABLES.FONT_PERCENTAGE.VARIABLE_KEY)) ,
                storageInvertColor : localStorage.getItem(STORAGE_VARIABLES.INVERT_COLOR.VARIABLE_KEY) ,
                storageIsDarkMode : localStorage.getItem(STORAGE_VARIABLES.DARK_MODE.VARIABLE_KEY) ,
                rootElement : document.querySelector(':root')
            }
        },
        computed : {
            invertColor(){
                return (this.storageInvertColor === true || this.storageInvertColor === "true") ? true : false;
            } ,
            isDarkMode(){
                  return (this.storageIsDarkMode === true || this.storageIsDarkMode === "true") ? true : false;
            }
        },
        methods: {
            setupFontSizeOnMount(){
              this.fontResult = getComputedStyle(document.documentElement).getPropertyValue('--fontModifier');
              if (!this.fontSize) {
                  this.initFontSize()
              }
              this.resizeFontByFontSizePercent(this.fontSize)
            } ,
            initFontSize(){
                localStorage.setItem(STORAGE_VARIABLES.FONT_PERCENTAGE.VARIABLE_KEY , STORAGE_VARIABLES.FONT_PERCENTAGE.INIT_VALUE)
            } , 
            initInvertColor(){
                localStorage.setItem(STORAGE_VARIABLES.INVERT_COLOR.VARIABLE_KEY , STORAGE_VARIABLES.INVERT_COLOR.INIT_VALUE)
            },
            resizeFontByFontSizePercent(fontPercent){
                let count
                if (fontPercent > 100) {
                    count = (fontPercent % 100) / 10;
                    for (let x = 0; x < count; x++) {
                        this.fontUp();
                    }
                } else if (fontPercent < 100) {
                    count = (100 % fontPercent) / 10;
                    for (let x = 0; x < count; x++) {
                        this.fontDown();
                    }
                }
            },
            fontUp: function () {
                document.documentElement.style.setProperty('--fontModifier', this.fontResult * 1.1);
                this.fontResult = this.fontResult * 1.1;
            },
            fontDown: function () {
                document.documentElement.style.setProperty('--fontModifier', this.fontResult / 1.1);
                this.fontResult = this.fontResult / 1.1;
            },
            fontUpButtonClick: function () {
                if (!this.fontSize) {
                    this.initFontSize()
                    return;
                }
                if (this.fontSize < 130) {
                    this.fontUp();
                    this.fontSize = this.fontSize +  10;
                }
            },
            fontDownButtonClick: function () {
                if (!this.fontSize) {
                    this.initFontSize()
                    return;
                }
                if (this.fontSize > 70) {
                    this.fontDown();
                    this.fontSize = this.fontSize - 10;
                }
            },
            fontResetButtonClick: function () {
                document.documentElement.style.setProperty('--fontModifier', 1);
                this.fontResult = 1;
                this.fontSize = 100;
                this.initFontSize()
            },
            colorInverter: function () {
                //color inverter button click
                this.colorInverterGlobalFunction("button-click-call");
            },
            colorInverterGlobalFunction(value) {
                        if (this.invertColor) {
                            if (value === "init-call") {
                                document.querySelector('html').classList.add('invert-color');
                            } else {
                                document.querySelector('html').classList.remove('invert-color');
                                this.storageInvertColor = false;
                            }
                        }else {
                            if (value === "init-call") {
                                document.querySelector('html').classList.remove('invert-color');
                            } else {
                                document.querySelector('html').classList.add('invert-color');
                                this.storageInvertColor = true;
                            }

                        }
            } ,
            initDarkMode(){
              this.initUserDarkModePrefer()
              this.initStorageDarkMode()
            } ,
            initUserDarkModePrefer(){
              if(window.matchMedia("(prefer-color-scheme : dark)").matches )
                this.enableDarkMode()
            } ,
            initStorageDarkMode(){
                if(this.isDarkMode)
                  this.enableDarkMode()
            } ,
            toggleDarkMode(){
              this.storageIsDarkMode = !this.storageIsDarkMode
              this.isDarkMode ? this.enableDarkMode() : this.disableDarkMode()
            } ,
            enableDarkMode(){
              this.rootElement.classList.add("dark-mode")
            } ,
            disableDarkMode(){
              this.rootElement.classList.remove("dark-mode")
            },
            headerShowMoreCalcs() {
                let getSingleItemHeight = document.querySelectorAll(".nav-item__first-level")[0].offsetHeight;
                let getheaderNavTotalHeight = document.querySelector(".header__content__nav-menu").offsetHeight;
                let countOfAllFirstLevelItems = document.querySelectorAll(".nav-item--first-node-level").length;

                if (getheaderNavTotalHeight > getSingleItemHeight) {
                    //this means that our items became more than 2 lines
                    document.querySelector(".nav-item--more-dropdown").classList.add("nav-item--more-dropdown--show-more");
                    for (let i = countOfAllFirstLevelItems - 1; i >= 0; i--) {

                        getSingleItemHeight = document.querySelectorAll(".nav-item__first-level")[0].offsetHeight;
                        getheaderNavTotalHeight = document.querySelector(".header__content__nav-menu").offsetHeight;
                        if (getheaderNavTotalHeight > getSingleItemHeight) {
                            document.querySelector(".nav-item--more-dropdown .nav-item--more-dropdown__main-node").appendChild(document.querySelectorAll(".nav-item--first-node-level")[i]);
                            setTimeout(function () {
                                getheaderNavTotalHeight = document.querySelector(".header__content__nav-menu").offsetHeight;
                            }, 0);
                        } else {
                            //TODO check last 2 items , and we might need to put open from right to left
                            document.querySelector(".header.header--desktop").classList.add("header--is-ready");
                        }

                    }
                } else {
                    document.querySelector(".header.header--desktop").classList.add("header--is-ready");
                }
            }
        },
        watch: {
             fontSize(){
                localStorage.setItem(STORAGE_VARIABLES.FONT_PERCENTAGE.VARIABLE_KEY , this.fontSize)
            },
            storageInvertColor(currentValue , previousValue){
                localStorage.setItem(STORAGE_VARIABLES.INVERT_COLOR.VARIABLE_KEY , currentValue)
            },
            storageIsDarkMode(currentValue , previousValue){
                localStorage.setItem(STORAGE_VARIABLES.DARK_MODE.VARIABLE_KEY , currentValue)
            }
        },
        unmounted() {
            window.removeEventListener('resize', this.headerShowMoreCalcs());
        },
        mounted() {
            window.addEventListener('resize', this.headerShowMoreCalcs());
            this.colorInverterGlobalFunction("init-call");
            this.setupFontSizeOnMount()
            this.initDarkMode()
        }
    }
</script>
<style lang="scss" scoped>
a , .pointer{
    cursor:pointer!important;
    *{
        cursor: inherit;
    }
}
</style>
