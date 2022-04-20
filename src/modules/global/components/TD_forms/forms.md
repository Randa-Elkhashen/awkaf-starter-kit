# Forms

# Example

## Text Input

```html
<!-- text input example -->
    <div
    class="mb-2 form-floating td-field-group"
    >
    <input
        placeholder=" "
        autocomplete="off"
        type="text"
        class="form-control td-field-group__field"
        id="floatingEmail"
        v-model="form.email"
    />
    <label for="floatingEmail" class="form-label  td-field-group__label"
        >Email</label
    >
    <span class="td-field-group__validate-message" >field is required </span>
</div>
```

## Text Input class tree and Modifiers

- td-field-group
  - td-field-group__field
  - td-field-group__label
  - td-field-group__validate-message
  - td-field-group__photo
  - td-field-group__icon-container
    - td-field-group__icon-container__icon
- td-field-group--required
- td-field-group--invalid
- td-field-group--valid
- td-field-group--photo-picker
- td-field-group--date-picker
- td-field-group--date-picker
- td-field-group--radio-list

# variables and Colors

```scss
/* field group colors*/
$fieldGroupLabelFocusColor : var(--field-group-focus-label-color);
$fieldGroupLabelColor : $secondary-color;
$fieldGroupBorderColor : $fieldGroupLabelColor;
$errorColor:var(--field-group-error-color);
$field-group-error-bg:var(--field-group-error-bg);
$field-group-valid-color:var(--field-group-valid-color);
$field-group-valid-bg:var(--field-group-valid-bg);
$fieldGroupCounterColor:var(--field-group-counter-color);
$requiredColor : $errorColor;
$fieldGroupRadioColor : var(--field-group-radio);
$fieldGroupCheckedRadioColor : var(--field-group-radio-checked);
$field-group-icon-hover-bg : var(--field-group-icon-hover-bg);
```
