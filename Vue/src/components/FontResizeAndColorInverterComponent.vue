<template>
    <div>
        <button v-on:click="colorInverter">Inverter</button>
        <button v-on:click="fontUpButtonClick">Font Up</button>
        <button v-on:click="fontResetButtonClick">Font Reset</button>
        <button v-on:click="fontDownButtonClick">Font Down</button>

        <div>
            <p class="font-equation">Comming From Equation</p>
            <p class="font-static">Comming From Static</p>
        </div>
    </div>
</template>

<style lang="scss">
    :root {
        --fontModifier: 1;
    }

    .font-equation {
        font-size: calc(var(--fontModifier) * calc(16px + (20 - 16) * ((100vw - 768px) / (1920 - 768))));
    }

    .font-static {
        font-size: calc(var(--fontModifier) * 16px);
    }

    body {
        background-color: white;
    }

    .invert-color {
        -webkit-filter: invert(100%);
        filter: invert(100%);
        background-color: #000;
    }

</style>

<script>

    //All declears are used in font Resizer , but we need only (selectedCookieIndex) in color Inverter
    let selectedCookieIndex;
    let getCookieData, getSplitCookie, fontCookieIndex, getFontPercentageString, getFontPercentageInt, count;
    let checkFontCookie = getSpecificCookie('fontPercentage');

    export default {
        name: 'fontResizeAndColorInverter',
        components: {

        },
        data: function () {
            return {
                fontResult: ""
            }
        },
        methods: {
            fontUp: function () {
                document.documentElement.style.setProperty('--fontModifier', this.fontResult * 1.1);
                this.fontResult = this.fontResult * 1.1;
            },
            fontDown: function () {
                document.documentElement.style.setProperty('--fontModifier', this.fontResult / 1.1);
                this.fontResult = this.fontResult / 1.1;
            },
            fontUpButtonClick: function () {
                getCookieData = document.cookie;
                if (checkFontCookie == null) {
                    document.cookie = 'fontPercentage=100' + ';path=/';
                }

                if (getFontPercentageInt < 130) {
                    this.fontUp();
                    document.cookie = 'fontPercentage=' + (getFontPercentageInt + 10) + ';path=/';
                    getFontPercentageFunction();
                }

            },
            fontDownButtonClick: function () {
                getCookieData = document.cookie;
                if (checkFontCookie == null) {
                    document.cookie = 'fontPercentage=100' + ';path=/';
                }

                if (getFontPercentageInt > 70) {
                    this.fontDown();
                    document.cookie = 'fontPercentage=' + (getFontPercentageInt - 10) + ';path=/';
                    getFontPercentageFunction();
                }
            },
            fontResetButtonClick: function () {
                document.documentElement.style.setProperty('--fontModifier', 1);
                this.fontResult = 1;
                getCookieData = document.cookie;
                document.cookie = 'fontPercentage=100' + ';path=/';
                getFontPercentageFunction();
            },
            colorInverter: function () {
                //color inverter button click
                this.colorInverterGlobalFunction("button-click-call");
            },
            colorInverterGlobalFunction(value) {
                if (checkIfExactCookie('color-inverter-cookies')) {
                    if (selectedCookieIndex !== "") {
                        if (document.cookie.split(';')[selectedCookieIndex].split('=')[1].trim() == "true") {
                            if (value === "init-call") {
                                document.querySelector('html').classList.add('invert-color');
                            } else {
                                document.querySelector('html').classList.remove('invert-color');
                                document.cookie = 'color-inverter-cookies=false' + ';path=/';
                            }
                        }
                        else {
                            if (value === "init-call") {
                                document.querySelector('html').classList.remove('invert-color');
                            } else {
                                document.querySelector('html').classList.add('invert-color');
                                document.cookie = 'color-inverter-cookies=true' + ';path=/';
                            }

                        }
                    }
                } else {
                    document.cookie = 'color-inverter-cookies=false' + ';path=/';
                }
            }
        },
        computed: {},
        mounted() {
            this.colorInverterGlobalFunction("init-call");

            //get fontModifier first init value from style
            this.fontResult = getComputedStyle(document.documentElement).getPropertyValue('--fontModifier');

            //Font Init at first time (set if cookie exists)
            if (checkIfExactCookie('fontPercentage') !== false) {
                getFontPercentageFunction();
                if (getFontPercentageInt > 100) {
                    count = (getFontPercentageInt % 100) / 10;
                    for (let x = 0; x < count; x++) {
                        this.fontUp();
                    }
                } else if (getFontPercentageInt < 100) {
                    count = (100 % getFontPercentageInt) / 10;
                    for (let x = 0; x < count; x++) {
                        this.fontDown();
                    }
                }
            } else {
                document.cookie = 'fontPercentage=100' + ';path=/';
                getFontPercentageFunction();
            }
        //Font Init at first time (set if cookie exists)
        }
    }

    //Font resize Functions (getFontPercentageFunction , getSpecificCookie , findFontCookie , checkIfExactCookie)
    //color inverter Functions (checkIfExactCookie)

    function checkIfExactCookie(cookieSelector) {
        let fullCookie = document.cookie;
        let numOfElementCookies = fullCookie.split(';').length;
        selectedCookieIndex = "";
        for (var x = 0; x < numOfElementCookies; x++) {
            if (fullCookie.split(';')[x].split('=').length > 1) {
                if (fullCookie.split(';')[x].split('=')[0].trim() === cookieSelector) {
                    selectedCookieIndex = x;
                    return true;
                }
            }
        }
        if (selectedCookieIndex == "") {
            return false;
        }
    }

    function getFontPercentageFunction() {
        getCookieData = document.cookie;
        getSplitCookie = document.cookie.split(';');
        fontCookieIndex = getSplitCookie.findIndex(findFontCookie);
        if (getCookieData.includes('fontPercentage')) {
            getFontPercentageString = getSplitCookie[fontCookieIndex].split('=')[1];
            if (getFontPercentageString == "") {
                document.cookie = 'fontPercentage=100%' + ';path=/';
                getFontPercentageFunction();
            }
            getFontPercentageInt = parseInt(getFontPercentageString);
            console.log(getFontPercentageInt);
        }
        getCookieData = document.cookie;
    }

    function getSpecificCookie(name) {
        let dc = document.cookie;
        let prefix = name + "=";
        let begin = dc.indexOf("; " + prefix);
        if (begin == -1) {
            begin = dc.indexOf(prefix);
            if (begin != 0) return null;
        } else {
            return true;
        }
    }

    function findFontCookie(element) {
        if (element.includes('fontPercentage')) {
            if (element.split('=')[0].trim() === "fontPercentage") {
                return element.includes('fontPercentage');
            }
        }
    }
</script>