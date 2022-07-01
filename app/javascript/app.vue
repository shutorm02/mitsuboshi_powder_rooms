<template>
  <p class="mt-3 text-gray-500">
    {{ message }}
  </p>
</template>

<script>
import { ref } from 'vue'

export default {
  setup() {
    const message = ref('Hello World')
    return { message }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: left;
}
</style>
