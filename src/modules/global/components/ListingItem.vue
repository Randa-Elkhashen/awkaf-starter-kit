<template>
  <article
    class="nap-generic-card nap-generic-card--horizontal nap-generic-card--bg-img"
  >
    <header class="nap-generic-card__header nap-generic-card__header--error">
      <div class="nap-generic-card__header-upper">
        <div class="nap-generic-card__header-upper__start">
          <img :src="itemDataModel.thumbnailUrl" alt="card source" />
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
      <a :href="itemDataModel.url">
        <img src="https://picsum.photos/seed/picsum/414/211" alt="card image" />
      </a>
    </div>
  </article>
</template>

<script>
export default {
  name: "ListingItem",
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
