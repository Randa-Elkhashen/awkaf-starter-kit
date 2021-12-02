<!-- Needed NPM Installs -->
<!-- npm i axios vue-multiselect v-calendar@1.0.0 -->

<template>
  <div class="nap-listing-container">
    <div class="container">
      <div class="row">

        <div class="col-md-4" :key="index" v-for="(item, index) in GenericListingData">
          <article class="nap-generic-card nap-generic-card--horizontal nap-generic-card--bg-img">
            <header class="nap-generic-card__header nap-generic-card__header--error">
              <div class="nap-generic-card__header-upper">
                <div class="nap-generic-card__header-upper__start">
                  <img :src="item.thumbnailUrl" alt="card source" loading="lazy" />
                  <span class="nap-generic-card__header-upper__start-source label--error">{{ item.id }}</span>
                </div>
                <div class="nap-generic-card__header-upper__end">...</div>
              </div>
              <div class="nap-generic-card__header-bottom">
                <a :href="item.url">
                  <h3>{{ item.title }}</h3>
                </a>
                <div class="nap-generic-card__header-bottom__extra-info">
                <span>رياضة . منذ ساعتين</span>
                <span class="nap-generic-card__header-bottom__tag">شاهد التصحيح</span>
                </div>
              </div>
            </header>
            <div class="nap-generic-card__image-container">
              <!-- :src="item.thumbnailUrl" -->
              <a :href="item.url" v-lazyload v-if="item.thumbnailUrl">
                <img :data-url="item.thumbnailUrl" src="../assets/spinner.gif" alt="card image" />
              </a>
            </div>
          </article>
        </div>

        <div v-if="isLoading" class="col-12">
            <div class="row">
              <div class="col-md-4" :key="index" v-for="(item, index) in 9">
                <article class="nap-generic-card nap-generic-card--horizontal nap-generic-card--bg-img">
                  <header class="nap-generic-card__header nap-generic-card__header--error">
                    <div class="nap-generic-card__header-upper placeholder-glow">
                      <div class="nap-generic-card__header-upper__start">
                        <span class="placeholder img-circle" />
                      </div>
                    </div>
                    <div class="nap-generic-card__header-bottom placeholder-glow">
                      <a href="#" class="placeholder-glow">
                        <h3 class="placeholder col-9"></h3>
                      </a>
                      <div class="nap-generic-card__header-bottom__extra-info">
                      <span class="placeholder col-4"></span>
                      <span class="nap-generic-card__header-bottom__tag placeholder col-4"></span>
                      </div>
                    </div>
                  </header>
                  <div class="nap-generic-card__image-container placeholder-glow">
                    <a href="#" class="placeholder">
                      <span></span>
                    </a>
                  </div>
                </article>
              </div>
            </div>
        </div>
        
      </div>
      <div class="generic-error-msg" v-show="isNoDataMsg">
        <div class="icon">
          <i class="icon-inbox"></i>
        </div>
        <p class="error-title">EmptyListMessagelbl</p>
        <a v-bind:href="goHome"><i class="icon-home"></i>HomePagelbl</a>
      </div>
      <!-- <div class="listing-loader" v-show="isLoading">
        <img src="../assets/spinner.gif" />
      </div> -->
      

      <div class="observer"></div>
    </div>
  </div>
</template>

<style lang="scss">
@import "./src/assets/sass/ListingPageComponent";
@import "./src/assets/sass/NapGenericCard.scss";
</style>

<script>
// import DatePicker from "v-calendar/lib/components/date-picker.umd";
// import Multiselect from "vue-multiselect";
// import axios from "axios";
// import Vue from "vue";

// Vue.component("v-date-picker", DatePicker);

let listingThis;
// let contactApiUrl;

export default {
  components: {
    // Multiselect,
  },
  data: function () {
    return {
      goHome: "",
      selectedDate: {
        start: null,
        end: null,
      },
      dropdownData: ["all", "past", "current", "upcoming"],
      dropdownValue: "",
      GenericListingData: [],
      isThereMoreData: false,
      isLoading: false,
      isNoDataMsg: false,
    };
  },
  methods: {
    getData: async function () {
      
      this.isLoading = true;
      let ListingData = await this.ListingDataAPI.Photos.fetch();
      this.GenericListingData = ListingData.GenericListingData;
      this.isThereMoreData = ListingData.isThereMoreData;
      this.isLoading = false;
      this.isNoDataMsg = false;
      if (
        this.GenericListingData == null ||
        this.GenericListingData == ""
      ) {
        this.isNoDataMsg = true;
      }
    },
    // getData: function () {
    //   listingThis.isAjaxLoading = true;

    //   // concatApiUrl = `${apiUrl}/api/EventsListAPI?nodePath=${this.nodePath}&culture=${this.currentLanguage}&eventType=${this.dropdownValue}&dateFrom=${dateFromVal}&dateTo=${dateToVal}&pageNumber=${this.scrollCount}`

    //   contactApiUrl = `https://jsonplaceholder.typicode.com/photos?albumId=${listingThis.scrollCount}`;

    //   axios.get(contactApiUrl).then(function (response) {
    //     if (response.data != "") {
    //       listingThis.showNoDataMessage = false;
    //       if (listingThis.scrollCount == 1) {
    //         listingThis.genericData = response.data;
    //       } else {
    //         listingThis.genericData = listingThis.genericData.concat(
    //           response.data
    //         );
    //       }
    //     } else {
    //       listingThis.isThereMoreData = false;

    //       //check if scroll count == 1 so i can show empty message

    //       if (listingThis.scrollCount == 1) {
    //         listingThis.genericData = [];
    //         listingThis.showNoDataMessage = true;
    //       }
    //     }
    //     listingThis.isAjaxLoading = false;
    //   });
    //   //TODO Probably will need to make our dates disabled till load
    // },
    changeUrlParams: function (paramValue) {
      let queryParams = new URLSearchParams(window.location.search);
      if (paramValue == listingThis.dropdownValue) {
        queryParams.delete("category");
        queryParams.set("category", paramValue);
      } else {
        queryParams.delete("start-date");
        queryParams.set("start-date", listingThis.selectedDate.start);
        queryParams.delete("end-date");
        queryParams.set("end-date", listingThis.selectedDate.end);
      }
      history.replaceState(null, null, "?" + queryParams.toString());
    },
    getUrlParams: function () {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const start_date = urlParams.get("start-date");
      const end_date = urlParams.get("end-date");
      const category = urlParams.get("category");
      listingThis.selectedDate = {
        start: new Date(start_date),
        end: new Date(end_date),
      };
      listingThis.dropdownValue = category;

      let dropdownItems = document.querySelectorAll(".dropdown-item");
      dropdownItems.forEach((item) => {
        if (category == item.value) {
          item.checked = true;
        }
      });
    },
    clearDate: function () {
      listingThis.selectedDate = {
        start: null,
        end: null,
      };
    },
  },
  computed: {},
  watch: {
    "selectedDate.start": function () {
      listingThis.changeUrlParams(listingThis.selectedDate.start);
      //listingThis.getData();
    },
    "selectedDate.end": function () {
      listingThis.changeUrlParams(listingThis.selectedDate.end);
    },
    dropdownValue: function () {
      if (listingThis.dropdownValue != null) {
        listingThis.changeUrlParams(listingThis.dropdownValue);
      }
      listingThis.scrollCount = 1;
      listingThis.isThereMoreData = true;
      //this.getData();
    },
  },
  inserted: el => {
    function loadImage() {
      const imageElement = Array.from(el.children).find(
      el => el.nodeName === "IMG"
      );
      if (imageElement) {
        imageElement.addEventListener("load", () => {
          setTimeout(() => el.classList.add("loaded"), 100);
        });
        imageElement.addEventListener("error", () => console.log("error"));
        imageElement.src = imageElement.dataset.url;
      }
    }

    function handleIntersect(entries, observer) {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          loadImage();
          observer.unobserve(el);
        }
      });
    }

    function createObserver() {
      const options = {
        root: null,
        threshold: "0"
      };
      const observer = new IntersectionObserver(handleIntersect, options);
      observer.observe(el);
    }
    if (window["IntersectionObserver"]) {
      createObserver();
    } else {
      loadImage();
    }
  },
  async mounted() {
    // eslint-disable-next-line no-debugger
    
    await this.getData();
    await this.LoadOnScroll.loadOnScroll(this.getData, this.isThereMoreData);

    listingThis = this;

    listingThis.getUrlParams();

    // listingThis.getData();

    // let observer = new IntersectionObserver((entries) => {
    //   entries.forEach((entry) => {
    //     if (
    //       entry.isIntersecting &&
    //       !listingThis.isAjaxLoading &&
    //       listingThis.isThereMoreData
    //     ) {
    //       listingThis.scrollCount++;
    //       listingThis.getData();
    //     }
    //   });
    // });


    //this is make cause footer content is loaded late so it's positions changed
    // setTimeout(function () {
    //   const container = document.querySelector(".observer");
    //   observer.observe(container);
    // }, 100);
  },
};
</script>