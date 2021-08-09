

//================ IE Disclaimer functionality ================ //

var userAgent = window.navigator.userAgent;
var msie = userAgent.indexOf("MSIE ");

if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
    document.querySelector(".ie-disclaimer").classList.add('ie-disclaimer--show');
}
document.querySelector(".ie-disclaimer a").addEventListener("click", function () {
    document.querySelector(".ie-disclaimer").classList.remove('ie-disclaimer--show');
});
document.querySelector(".ie-disclaimer i").addEventListener("click", function () {
    document.querySelector(".ie-disclaimer").classList.remove('ie-disclaimer--show');
});
//================ IE Disclaimer functionality ================ //