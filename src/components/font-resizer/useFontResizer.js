
import {STORAGE_VARIABLES} from "./enums";
import {computed, onMounted, ref, watch} from "vue";
    export default function useFontResizer(){
        const fontResult = ref("");
        const fontSize = ref(parseInt(localStorage.getItem(STORAGE_VARIABLES.fontPercentag.name)) || 100)
        const storageInvertColor  = ref(localStorage.getItem(STORAGE_VARIABLES.invertColor.name))
        const storageIsDarkMode = ref(localStorage.getItem(STORAGE_VARIABLES.darkMode.name))
        const rootElement = ref(null);
        /* computed */
        const invertColor = computed(()=>{
            return  (storageInvertColor.value === true || storageInvertColor.value === "true") ? true : false;
        })
        const isDarkMode = computed(()=>{
            return (storageIsDarkMode.value === true || storageIsDarkMode.value === "true") ? true : false;
        });
        /* methods */
        const setupFontSizeOnMount = ()=>{
            let fontModifier = getComputedStyle(document.documentElement).getPropertyValue('--fontModifier');
            fontResult.value = fontModifier || '1';
            console.log("setup modifier" , 0 , fontSize )
            console.log("setup modifier" , 0 , fontResult   )
            if (!fontSize.value) {
                initFontSize()
            }
            resizeFontByFontSizePercent(fontSize.value)
        }
        const initFontSize = ()=>{
            console.log("setup modifier" , 1)
            localStorage.setItem(STORAGE_VARIABLES.fontPercentag.name , STORAGE_VARIABLES.fontPercentag.default)
        }
        const initInvertColor = ()=>{
            localStorage.setItem(STORAGE_VARIABLES.invertColor.name , STORAGE_VARIABLES.invertColor.default)
        }
        const resizeFontByFontSizePercent = (fontPercent)=> {
            // alert(fontPercent)
            let count
            if (fontPercent > 100) {
                count = (fontPercent % 100) / 10;
                for (let x = 0; x < count; x++) {
                    fontUp();
                }
            } else if (fontPercent < 100) {
                count = (100 % fontPercent) / 10;
                for (let x = 0; x < count; x++) {
                    fontDown();
                }
            }
        };
        const fontUp = ()=>{
            console.log('up' , fontResult.value)
            document.documentElement.style.setProperty('--fontModifier', fontResult.value * 1.1 );
            fontResult.value = fontResult.value * 1.1;
        }
        const fontDown = ()=>{
            document.documentElement.style.setProperty('--fontModifier', fontResult.value / 1.1 );
            fontResult.value = fontResult.value / 1.1;
        }
        const fontUpButtonClick = ()=>{
            // alert(fontSize.value)
            console.log(fontSize.value)
            if (!fontSize.value) {
                initFontSize()
                return;
            }
            if (fontSize.value < 130) {
                 fontUp();
                fontSize.value = fontSize.value +  10;
            }        
        }

        const fontDownButtonClick = ()=>{
            if (!fontSize.value) {
                initFontSize()
                return;
            }
            if (fontSize.value > 70) {
                fontDown();
                fontSize.value = fontSize.value - 10;
            }
        }
        const fontResetButtonClick = ()=>{
            document.documentElement.style.setProperty('--fontModifier', 1);
            fontResult.value = 1;
            fontSize.value = 100;
            initFontSize()

        }
        const colorInverter = ()=>{
            colorInverterGlobalFunction("button-click-call");
        }
        const colorInverterGlobalFunction = (value)=>{
            if (invertColor.value) {
                if (value === "init-call") {
                    document.querySelector('html').classList.add('invert-color');
                } else {
                    document.querySelector('html').classList.remove('invert-color');
                    storageInvertColor.value = false;
                }
            }else {
                if (value === "init-call") {
                    document.querySelector('html').classList.remove('invert-color');
                } else {
                    document.querySelector('html').classList.add('invert-color');
                    storageInvertColor.value = true;
                }

            }
        }
        const initDarkMode = ()=>{
            initUserDarkModePrefer()
            initStorageDarkMode()
        }
        const initUserDarkModePrefer = ()=>{
            if(window.matchMedia("(prefer-color-scheme : dark)").matches )
                enableDarkMode()
        }
        const initStorageDarkMode = ()=>{
            if(isDarkMode.value)
                enableDarkMode()
        }
        const toggleDarkMode = ()=>{
            storageIsDarkMode.value = !storageIsDarkMode.value
            isDarkMode.value ? enableDarkMode() : disableDarkMode()
        }
        const enableDarkMode = ()=>{
            rootElement.value.classList.add("dark-mode")

        }
        const disableDarkMode = ()=>{
            rootElement.value.classList.remove("dark-mode")
        }
        const headerShowMoreCalcs = ()=>{
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

        /* watchers */
        watch(fontSize , (newVal , prev )=>{
            console.log(newVal , prev)
            localStorage.setItem(STORAGE_VARIABLES.fontPercentag.name , fontSize.value)
        })
        watch(storageInvertColor , ()=>{
            localStorage.setItem(STORAGE_VARIABLES.invertColor.name , storageInvertColor.value)
        })
        watch(storageIsDarkMode , ()=>{
            localStorage.setItem(STORAGE_VARIABLES.darkMode.name , storageIsDarkMode.value)
        });
        /* hooks */
        onMounted(()=>{
            rootElement.value = document.querySelector(':root');
            colorInverterGlobalFunction("init-call");
            setupFontSizeOnMount()
            initDarkMode()
        });

        return {
            fontResult,
            fontSize ,
            storageInvertColor,
            storageIsDarkMode ,
            rootElement ,
            colorInverter ,
            fontUpButtonClick ,
            fontResetButtonClick , 
            fontDownButtonClick
        }
    }

