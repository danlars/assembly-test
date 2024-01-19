<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
// import './wasm/emcc'
</script>

<template>
  <header>
    <div class="wrapper">
      <nav class="navigation">
        <RouterLink class="link-item" to="/"><span class="primary">Math</span></RouterLink>
        <RouterLink class="link-item" to="/image"><span class="primary">Image editing</span></RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style lang="scss" scoped>
.navigation {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding-bottom: 0.5rem;
  padding-top: 0.5rem;
  padding-inline-start: 1rem;
  padding-inline-end: 1rem;
  border-bottom: 1px solid #535353;
  background-color: rgba(58, 146, 205, 0.05);
}

.link-item {
  padding-bottom: 0.5rem;
  padding-top: 0.5rem;
  padding-inline-start: 1rem;
  padding-inline-end: 1rem;
  border-radius: 5px;
  color: rgb(37, 37, 45);
  text-decoration: none;
  font-weight: bold;
  text-transform: uppercase;
  font-size: 0.7rem;
  background-color: transparent;
  position: relative;
  overflow: hidden;

  .primary {
    position: sticky;
    z-index: 1;
  }

  &:hover,
  &:focus-visible {
    background-color: rgba(58, 146, 205, 1);
    color: #ffffff;

    &:before {
      content: '';
      background-color: #000000;
      opacity: 0.15;
      position: absolute;
      inset: 0;
    }
  }
}
</style>
