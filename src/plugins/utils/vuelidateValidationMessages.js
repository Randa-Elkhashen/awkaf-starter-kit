import { required, helpers  , minLength } from "@vuelidate/validators";
const requiredMessage = (label) =>
  helpers.withMessage(`${label} is required`, required);
const minMessage = (length) =>
  helpers.withMessage(`min ${length} chars`, minLength(length));

export default { requiredMessage, minMessage };
