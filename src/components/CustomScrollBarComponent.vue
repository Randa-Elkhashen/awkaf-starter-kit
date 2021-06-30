<!-- Needed NPM Installs -->
<!-- npm install vue-multiselect --save -->
<!-- npm i simple-scrollbar --save -->

<template>
    <div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <multiselect v-model="value" :options="options" :show-labels="false"></multiselect>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss">
    .ss-scroll {
        background-color: gray;
        opacity:1;
    }

    .multiselect__content-wrapper {
        height: 200px;
    }
</style>

<script>


    import SimpleScrollbar from 'simple-scrollbar';
    import 'simple-scrollbar/simple-scrollbar.css'

    import Multiselect from 'vue-multiselect'
    import "vue-multiselect/dist/vue-multiselect.min.css";

    export default {
        name: 'CustomScrollBarComponent',
        components: {
            Multiselect 
        },
        data: function () {
            return {
                value: null,
                options: ['list', 'of', 'options', 'options2', 'options3', 'options4', 'options5', 'options6']
            }
        },
        methods: {

        },
        computed: {},
        mounted() {
            SimpleScrollbar.initEl(document.querySelector(".multiselect__content-wrapper"));
            const domChangeObserver = new MutationObserver(mutation => {
                if (!mutation[0].target.classList.contains("ss-container")) {
                    SimpleScrollbar.initEl(document.querySelector(".multiselect__content-wrapper"));
                }
            });

            domChangeObserver.observe(document.querySelector(".multiselect__content-wrapper"), {
                attributes: true
            });
        }
    }
</script>