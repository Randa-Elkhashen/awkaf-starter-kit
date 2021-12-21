<template>
  <article
    class="nap-generic-card nap-generic-card--horizontal nap-generic-card--bg-img"
  >
    <header class="nap-generic-card__header nap-generic-card__header--error">
      <div class="nap-generic-card__header-upper">
        <div class="nap-generic-card__header-upper__start">
          <!-- <img :src="itemDataModel.thumbnailUrl" alt="card source" /> -->
          <span
            class="nap-generic-card__header-upper__start-source label--error"
            >{{ itemDataModel.id }}</span
          >
        </div>
        <div class="nap-generic-card__header-upper__end">...</div>
      </div>
      <div class="nap-generic-card__header-bottom">
        <a :href="itemDataModel.url">
          <h3>{{ itemDataModel.title }}</h3>
        </a>
        <div class="nap-generic-card__header-bottom__extra-info">
          <span>رياضة . منذ ساعتين</span>
          <span class="nap-generic-card__header-bottom__tag">شاهد التصحيح</span>
        </div>
      </div>
    </header>
    <div class="nap-generic-card__image-container">
      <a :href="itemDataModel.url" v-lazyload>
        <img :data-url="itemDataModel.url" data-default="https://i.picsum.photos/id/580/100/100.jpg?hmac=Iy12pK-jifw7-kSPz1TVjZ5UOhbI9NDMILFEKNdygzA" src="@/assets/spinner.gif" alt="card image" />
      </a>
    </div>
  </article>
</template>

<script>
import LazyLoadDirective from "../../../../directive/LazyLoadDirective"
import "./TD_genericCard.scss"
export default {
  name: "ListingItem",
  directives: {
    lazyload: LazyLoadDirective
  },
  props: {
    itemDataModel: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {};
  },
  mounted() {},
};
</script>
