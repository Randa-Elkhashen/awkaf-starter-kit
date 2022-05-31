import { useForm as useVeeValidateForm, useField } from "vee-validate";
import { reactive, ref } from "vue";

export default function useForm(schema) {
  const schemaForm = useVeeValidateForm({
    validationSchema: schema.value,
  });
  const form = reactive({ errors: schemaForm.errors });
  for (const field in schema.value.fields) {
    form[field] = useField(field).value;
  }
  const onSuccess = ref(null);
  const onFail = ref(null);
  const onsubmit = ref(
    schemaForm.handleSubmit(
      (values) => onSuccess.value(values),
      ({ values, errors, results }) => onFail.value({ values, errors, results })
    )
  );
  return {
    form,
    onSuccess,
    onFail,
    onsubmit,
    handleSubmit: schemaForm.handleSubmit,
    setDirty() {
      const touchState = {};
      for (const field in form) {
        touchState[field] = true;
      }
      schemaForm.value.setTouched(touchState);
    },
  };
}