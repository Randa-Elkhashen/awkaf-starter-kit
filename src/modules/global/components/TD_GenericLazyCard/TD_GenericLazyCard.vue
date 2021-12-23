<template>
<div class="container">
    <div class="col-12">
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
    
</template>

<script>
import "./TD_listing.scss"

export default {

}
</script>

<style>

</style>