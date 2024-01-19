<template>
  <div class="image-view">
    <h1>Image edit</h1>
    <form @submit="onSubmit">
      <input accept="image/*" type="file" @change="onChangeImage" />
      <br />
      <label>Rotate</label>
      <br />
      <input type="number" v-model="rotate" max="360" min="0" placeholder="Rotate image" />
      <br />
      <label>Zoom</label>
      <br />
      <input type="number" v-model="resize" min="0" placeholder="Zoom" />
      <br /><br />
      <button type="submit">Submit</button>
    </form>
    <div class="image-preview">
      <div class="preview" v-if="originalImage">
        <p>Original image</p>
        <img :src="originalImage" />
      </div>
      <div class="preview" v-if="newImage">
        <p>New image</p>
        <img :src="newImage" />
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { ref, type Ref } from 'vue'
import { Call } from 'wasm-imagemagick'

const rotate = ref('0')
const resize = ref('100')
const imageFile = ref(null) as Ref<File | null>
const originalImage = ref(null) as Ref<string | null>
const newImage = ref(null) as Ref<string | null>
const onChangeImage = async (event: Event) => {
  const input = event.target as HTMLInputElement
  const files = input.files ?? []
  const image = files[0]

  if (image == null) {
    return
  }

  imageFile.value = image
}
const onSubmit = async (event: Event) => {
  event.preventDefault()
  if (imageFile.value == null) {
    return
  }
  try {
    const sourceImageName = 'source.png'
    const outImageName = 'out.png'
    const command = [
      'convert',
      sourceImageName,
      '-rotate',
      `${rotate.value}`,
      '-resize',
      `${resize.value}%`,
      outImageName
    ]
    console.log(command);
    const imageBuffer = new Uint8Array(await imageFile.value.arrayBuffer())
    const inputFiles = [{ name: sourceImageName, content: imageBuffer }]
    const [processedFile] = await Call(inputFiles, command)

    originalImage.value = URL.createObjectURL(imageFile.value)
    newImage.value = URL.createObjectURL(processedFile.blob)
  } catch (error) {
    console.log(error)
  }
}
</script>
<style lang="scss" scoped>
.image-preview {
  display: flex;
  flex-wrap: wrap;
  gap: 2rem;
}

.preview {
  max-width: 200px;
  img {
    max-width: 100%;
  }
}
</style>
