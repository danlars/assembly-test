<template>
    <input :value="modelValue" :step="stepAttribute" @input="onInput" type="number" />
</template>
<script lang="ts" setup>
import { computed } from 'vue';

const props = defineProps<{
    modelValue: null | number,
    step?: string,
}>();
const emit = defineEmits(['update:modelValue']);
const stepAttribute = computed(() => {
    let step = 'any';
    if (props.step != null) {
        step = props.step;
    }
    return step;
});
const onInput = (event: Event) => {
    const inputElement = event.target as HTMLInputElement;
    const value = inputElement.value;
    let result: null | number = null;
    if (value !== '') {
        result = Number(value);
    }
    emit('update:modelValue', result);
};
</script>