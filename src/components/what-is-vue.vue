<template>
  <h1>
    What is Vue?
  </h1>
  <p>
    It's an open-source Javascript framework to build web user interfaces
  </p>
  <p>
    Said to be progressive, approachable, performant and versatile
  </p>
  <p>
    Has solid foundations on reactivity, internal rendering engine and a strong community
  </p>
  <p class="competitors">
    <img :src="react" />
    <img :src="svelte" />
    <img :src="angular" />
  </p>
</template>

<script setup>
import react from '../assets/react.png';
import svelte from '../assets/svelte.png';
import angular from '../assets/angular.png';
</script>

<style scoped>
.competitors {
  display: flex;
  justify-content: space-between;
  margin: 50px 200px;
}

.competitors img {
  height: 150px;
}
</style>
