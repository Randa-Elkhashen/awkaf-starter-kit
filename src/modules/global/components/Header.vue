<template>
    <nav class="navbar navbar-expand-md">
        <div class="navbar-container">
            <div class="navbar-links">
                <a class="navbar-brand" href="/">
                <img src="../../../assets/logo.png" alt="image" /></a>
                <ul class="nav navbar-links-container">
                    <li class="nav-item font-options">
                        <ul class="nav">
                            <li @click="colorInverter" class="nav-item mx-2 badge bg-dark pointer">
                                <div class="dark-theme-toggle">
                                    <label class="">
                                        <span style="color:transparent;" class="">{{"inv"}}</span>
                                    </label>
                                </div>
                            </li>
                            <li @click="toggleDarkMode" class="nav-item badge bg-dark mx-2 pointer">
                                <div class="dark-theme-toggle">
                                    <label class="">
                                        <span class="">{{"darkMode"}}</span>
                                    </label>
                                </div>
                            </li>
                            <li  class="nav-item font-up badge bg-info mx-2" @click="fontUpButtonClick">
                                <a  class="nav-link ">+A</a>
                            </li>
                            <li class="nav-item font-down badge bg-info mx-2" @click="fontDownButtonClick">
                                <a class="nav-link" >-A</a>
                            </li>
                            <li class="nav-item reset-font badge bg-info mx-2" @click="fontResetButtonClick">
                                <a class="nav-link">A</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <router-link to="/" class="nav-link">Home</router-link>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
         <div>
            <p class="font-equation">Comming From Equation</p>
            <p class="font-static">Comming From Static</p>
        </div>
</template>
<script>
import {STORAGE_VARIABLES} from "../Constants";
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
        mounted() {
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
