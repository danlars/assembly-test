<script setup lang="ts">
import { ref, type Ref } from 'vue'
import InputNumber from '../components/NumberInput.vue'
import { add, subtract } from '../wasm/release'

const a = ref(null) as Ref<null | number>
const b = ref(null) as Ref<null | number>
const action = ref('') as Ref<'' | 'add' | 'subtract'>
const result = ref('') as Ref<'' | number>
const onSubmit = (event: Event) => {
  event.preventDefault()
  if (action.value === '' || a.value == null || b.value == null) {
    return
  }
  switch (action.value) {
    case 'add':
      result.value = add(a.value, b.value)
      break
    case 'subtract':
      result.value = subtract(a.value, b.value)
      break
  }
}
</script>

<template>
  <main>
    <form @submit="onSubmit">
      <div>
        <label>Action</label> <br />
        <select v-model="action">
          <option disabled value="">Please select action</option>
          <option value="add">Add</option>
          <option value="subtract">Subtract</option>
        </select>
      </div>
      <br/><br/>
      <div>
        <label> A </label><br />
        <InputNumber v-model="a" /><br />
      </div>
      <br/><br/>
      <div>
        <label> B </label><br />
        <InputNumber v-model="b" /><br />
      </div>
      <br/><br/>
      <button type="submit">Submit</button>
    </form>
    <p>Result: {{ result }}</p>
  </main>
</template>
