<!-- Needed NPM Installs -->
<!-- npm i axios vue-social-sharing vue-clipboard2 -->

<template>
    <section class="social-media">
        <div>
            <a v-clipboard:copy="CopyLink" v-clipboard:success="onCopy">
                <img src="../../src/assets/copy-link.svg" width="25px"/>
            </a>
            <ShareNetwork network="facebook"
                          key="facebook"
                          :url="fullUrl"
                          :title="sharing.title"
                          :description="sharing.description">
                <i class="icon-facebook"> facebook </i>
            </ShareNetwork>
            <ShareNetwork network="twitter"
                          key="twitter"
                          :url="shortenUrl"
                          :title="sharing.title"
                          :description="sharing.description"
                          :twitterUser="sharing.twitterUser">
                <i class="icon-twitter">twitter </i>
            </ShareNetwork>
            <ShareNetwork network="whatsapp"
                          key="whatsapp"
                          :url="fullUrl"
                          :title="sharing.title"
                          :description="sharing.description">
                <i class="icon-whatsapp">whatsapp</i>
            </ShareNetwork>
        </div>

        <div class="toaster" v-bind:class="{'show-toaster': isToaster}">
            link Copied
        </div>
    </section>
</template>

<style lang="scss">
$start: left;
$end: right;

.social-media {
    display: flex;
    justify-content: center;
    padding: 60px;
}

.toaster {
    font-size: calc(var(--fontModifier) * calc(16px + (20 - 16) * ((100vw - 768px) / (1366 - 768))));
    font-weight: bold;
    border-radius: 5px;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    position: fixed;
    #{$end}: 10px;
    bottom: -85px;
    transition: 0.5s;
    z-index: 10;
}

.show-toaster {
    bottom: 10px;
}

</style>

<script>

    import axios from 'axios';
    import Vue from 'vue';
    import ShareNetwork from 'vue-social-sharing'
    import VueClipboard from 'vue-clipboard2'

    Vue.use(ShareNetwork);
    Vue.use(VueClipboard);

    let socialThis;
    let baseUrl = document.location.origin;
    let apiUrl = baseUrl + "";
    let pageURL = window.location.protocol + "//" + window.location.host + window.location.pathname + window.location.search;

export default {
    data: function() { 
      return {
            CopyLink: pageURL,
            isToaster: false,
            sharing: {
                url: '',
                title: '',
                description: ''
            },
            shortenUrl: "",
            fullUrl: "",
            networks: [
                { network: 'facebook', name: 'Facebook', icon: 'icon-facebook' },
                { network: 'whatsapp', name: 'Whatsapp', icon: 'icon-whatsapp' },
                { network: 'twitter', name: 'Twitter', icon: 'icon-twitter' }
            ]
        }
    },
    methods: {
        onCopy: function () {
            socialThis.isToaster = true;
            setTimeout(() => {
                socialThis.isToaster = false;
            }, 2000);
        }
    },
    computed: {},
    mounted() {
        socialThis = this;
        socialThis.sharing.title = "";
        socialThis.sharing.description = "";

        let pageUrlWithoutSpacing = pageURL.replaceAll("%20", "");

        socialThis.fullUrl = pageURL;

        axios.get(`${apiUrl}/api/tinyurl/index?url=${pageUrlWithoutSpacing}`)
            .then((res) => {
                socialThis.shortenUrl = res.data;
            })
            .catch(() => {
                socialThis.shortenUrl = pageURL;
            })  

    }
}
</script>