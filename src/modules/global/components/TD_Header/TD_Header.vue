<template>
<!-- asdasd -->
    <section class="header header--desktop">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="../../../../assets/logo.png" alt="SiteTitle" class="d-inline-block align-text-top">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="header__content">
                    <div class="collapse navbar-collapse header__content__accessibility" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item trail-version">نسخة تجريبية</li>

                            <li @click="colorInverter" class="nav-item nav-item--show-in-desktop">
                                <span class="nav-link constrast-icon">
                                    <span class="icon-contrast-icon"></span>
                                </span>
                            </li>

                            <li class="nav-item dropdown dropdown-menu--font-parent nav-item--show-in-desktop">
                                <a class="nav-link" href="#" id="fontDropdownMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside"> A </a>
                                <ul class="dropdown-menu dropdown-menu--font" aria-labelledby="fontDropdownMenu">
                                    <li>
                                        <a class="dropdown-item fontUp-icon" href="#" @click="fontUpButtonClick">A+</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item fontUp-icon" href="#" @click="fontDownButtonClick">A-</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="header__content__nav-menu">
                        <ul class="navbar-nav">
                            <li class="nav-item nav-item--first-node-level">
                                <router-link to="/" class="nav-link">Home</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/listing" class="nav-link">Listing Lazy</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/tdloader" class="nav-link">td loader</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/tdtimeline" class="nav-link">td timeline</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/tdAnimation" class="nav-link">td Animation</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/tdLisiting" class="nav-link">td Lisiting</router-link>
                            </li>
                            <li class="nav-item nav-item__first-level nav-item--first-node-level">
                                <router-link to="/tdLisiting2" class="nav-link">td Lisiting2</router-link>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </nav>
    </section>
</template>
<script>
import "./header.scss"
import {STORAGE_VARIABLES} from "@/globale/Constants.js";
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
