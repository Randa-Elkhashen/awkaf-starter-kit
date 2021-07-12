<template>
    <nav class="navbar navbar-expand-md">
        <div class="navbar-container">
            <div class="navbar-links">
                <a class="navbar-brand" href="/"><img src="../assets/logo.png" alt="image" /></a>
                <ul class="nav navbar-links-container">
                    <li class="nav-item font-options">
                        <ul class="nav">
                            <li class="nav-item">
                                <div class="dark-theme-toggle">
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="dark-mode-toggle slider round"></span>
                                    </label>
                                </div>
                            </li>
                            <li class="nav-item font-up">
                                <a class="nav-link" href="javascript:void(0)">+A</a>
                            </li>
                            <li class="nav-item font-down">
                                <a class="nav-link" href="javascript:void(0)">-A</a>
                            </li>
                            <li class="nav-item reset-font">
                                <a class="nav-link" href="javascript:void(0)">A</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item social-options">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" target="_blank" href="#">
                                    <i>Facebook</i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" target="_blank" href="#">
                                    <i>Youtube</i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" target="_blank" href="#">
                                    <i>Twitter</i>
                                </a>
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
                    <li class="nav-item">
                        <router-link to="/listing" class="nav-link">listing</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/reports" class="nav-link">Reports</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/contactus" class="nav-link">Contact us</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/genericFormValidations" class="nav-link">Generic Form Validations</router-link>
                    </li>
                    <li class="nav-item nav-item__have-childrens dropdown">
                        <a class="nav-link" href="javascript:void(0)" role="button" id="dropdownMenuLink-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Parent</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink-1">
                            <li><a class="dropdown-item" href="#">Child 1</a></li>
                            <li><a class="dropdown-item" href="#">Child 2</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<style lang="scss">
    body {
        direction: rtl;
    }

    @import "../assets/sass/Nanvigation";
</style>


<script>

    export default {
        name: "App",
        components: {
        },
        mounted() {

            //================ Font resize Cookie ================ //

            let root = document.documentElement;

            const fontUp = document.querySelectorAll('.font-up');
            const fontDown = document.querySelectorAll('.font-down');
            const fontReset = document.querySelectorAll('.reset-font');

            let result = getComputedStyle(document.documentElement).getPropertyValue('--fontModifier');
            let getSplitCookie;
            let fontCookieIndex;
            let getFontPercentageString;
            let getFontPercentageInt;
            let getCookieData = document.cookie;
            let checkFontCookie = getSpecificCookie('fontPercentage');
            let count;

            function fontup() {
                root.style.setProperty('--fontModifier', result * 1.1);
                result = result * 1.1;
            }

            function fontdown() {
                root.style.setProperty('--fontModifier', result * 0.9);
                result = result * 0.9;
            }

            if (checkFontCookie != null) {
                getFontPercentageFunction();
                if (getFontPercentageInt > 100) {
                    count = (getFontPercentageInt % 100) / 10;
                    for (let x = 0; x < count; x++) {
                        fontup();
                    }
                } else if (getFontPercentageInt < 100) {
                    count = (100 % getFontPercentageInt) / 10;
                    for (let x = 0; x < count; x++) {
                        fontdown();
                    }
                }
            } else {
                document.cookie = 'fontPercentage=100' + ';path=/';
                getFontPercentageFunction();
            }

            fontUp.forEach((item) => {
                item.addEventListener("click", () => {
                    getCookieData = document.cookie;
                    if (checkFontCookie == null) {
                        document.cookie = 'fontPercentage=100' + ';path=/'; //cookieSet
                    }

                    if (getFontPercentageInt < 130) {
                        fontup();
                        document.cookie = 'fontPercentage= ' + (getFontPercentageInt + 10) + ';path=/'; //cookieSet
                        getFontPercentageFunction();
                    }
                });
            });

            fontDown.forEach((item) => {
                item.addEventListener("click", () => {
                    getCookieData = document.cookie;
                    if (checkFontCookie == null) {
                        document.cookie = 'fontPercentage=100' + ';path=/';  //cookieSet
                    }

                    if (getFontPercentageInt > 70) {
                        fontdown();
                        document.cookie = 'fontPercentage= ' + (getFontPercentageInt - 10) + ';path=/';  //cookieSet
                        getFontPercentageFunction();
                    }
                });
            });

            fontReset.forEach((item) => {
                item.addEventListener("click", () => {
                    root.style.setProperty('--fontModifier', 1);
                    result = 1;

                    getCookieData = document.cookie;
                    document.cookie = 'fontPercentage=100' + ';path=/';  //cookieSet
                    getFontPercentageFunction();
                });
            });

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
                }
                getCookieData = document.cookie;
            }

            // var selectedCookieIndex = "";
            // function checkIfExactCookie(cookieSelector) {
            //   var fullCookie = document.cookie;
            //   var numOfElementCookies = fullCookie.split(';').length;
            //   selectedCookieIndex = "";
            //   for (var x = 0; x < numOfElementCookies; x++) {
            //     if (fullCookie.split(';')[x].split('=').length > 1) {
            //       if (fullCookie.split(';')[x].split('=')[0].trim() === cookieSelector) {
            //         selectedCookieIndex = x;
            //         return true;
            //       }
            //     }
            //   }
            //   if (selectedCookieIndex == "") {
            //     return false;
            //   }
            // }

            //================ Font resize Cookie ================ //



            //================ Dark Theme ================ //
            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }

            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            const darkTheme = "DarkTheme";
            const lightTheme = "LightTheme";

            const darkModeToggleBtn = document.getElementsByClassName('dark-mode-toggle');

            let theme = getCookie('theme');

            if (theme === 'dark') {
                enableDarkMode();
            } else {
                disableDarkMode();
            }

            darkModeToggleBtn.forEach((item) => {
                item.addEventListener('click', () => {
                    theme = getCookie('theme');
                    if (theme === 'dark') {
                        disableDarkMode();
                    } else {
                        enableDarkMode();
                    }
                });
            })

            function enableDarkMode() {
                let themeTitle = document.getElementsByClassName('theme-title');
                themeTitle.forEach((item) => {
                    item.innerHTML = darkTheme;
                })
                setCookie('theme', 'dark');
                document.body.classList.add('dark-mode');
            }

            function disableDarkMode() {
                let themeTitle = document.getElementsByClassName('theme-title');
                themeTitle.forEach((item) => {
                    item.innerHTML = lightTheme;
                })
                setCookie('theme', 'light');
                document.body.classList.remove('dark-mode');
            }

            window
                .matchMedia('(prefers-color-scheme: dark)')
                .addListener((e) => (e.matches ? enableDarkMode() : disableDarkMode()));

            //================ Dark Theme ================ //
        }
    };
</script>
