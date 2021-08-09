<!-- Needed NPM Installs -->
<!-- npm i vue-cool-lightbox vue-awesome-swiper@4.1.1 swiper@4.5.0 -->

<template>
  <div class="nap-container">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <article class="nap-generic-card nap-generic-card--vertical">
            <header class="nap-generic-card__header">
              <div class="nap-generic-card__header-upper">
                <div class="nap-generic-card__header-upper__start">
                  <img src="https://picsum.photos/200/300" alt="card source" />
                  <span>youm 7</span>
                </div>
                <div class="nap-generic-card__header-upper__end">...</div>
              </div>
              <div class="nap-generic-card__header-bottom">
                <h3>Lorem Ipsum</h3>
                <div class="nap-generic-card__header-bottom__extra-info">
                  lorem ipsum
                </div>
              </div>
            </header>
            <div class="nap-generic-card__image-container">
              <img src="https://picsum.photos/200/300" alt="card image" />
            </div>
          </article>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss">
@import "./src/assets/sass/NapGenericCard.scss";
</style>

<script>
export default {
  name: "NAPCard",
  methods: {},
  computed: {},
  mounted() {},
};
</script>