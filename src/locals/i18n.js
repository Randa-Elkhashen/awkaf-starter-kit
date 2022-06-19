import en from "./en.json";
import ar from "./ar.json";
import { createI18n } from "vue-i18n";

const i18n = createI18n({
    legacy: false,
    locale: "ar",
    messages: {
        en,
        ar
    }
});

export default i18n;