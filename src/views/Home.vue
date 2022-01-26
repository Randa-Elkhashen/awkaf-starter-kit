<template>
  <div>
      <div class="container">
          <div class="center-logo">
            <h1 class="title-description title-description--center">FE Library</h1>
            <img src="../assets/images/banner.png" alt="">
          </div>
      </div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss">
    .center-logo {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 400px;
        h1 {
            color: $primary-color;
        }
    }
</style>