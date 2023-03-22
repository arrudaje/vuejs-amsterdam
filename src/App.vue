<template>
  <VueperSlides
    fade
    fixedHeight
    :arrows="false"
    class="app-slides"
  >
    <VueperSlide
      v-for="(slide, index) in slides"
      :key="index"
      class="app-slide"
    >
      <template #content>
        <img :src="logo" class="app-slide__img" />
        <Component :is="slide"/>
      </template>
    </VueperSlide>
  </VueperSlides>
</template>

<script setup>
import { VueperSlides, VueperSlide } from 'vueperslides';
import 'vueperslides/dist/vueperslides.css';
import { slides } from './components';
import logo from './assets/vuejs.png';

</script>

<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-size: 36px;
}

h1 {
  font-size: 70px;
}

h5 {
  margin-bottom: 0;
}
</style>

<style scoped>
.app-slides {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  height: 100vh;
  width: 100vw;
  color: #332211;
}

.app-slide {
  background: linear-gradient(to bottom, #ddffdd 0%, #fff9f5 15%, #fff9f5 100%);
  padding: 50px;
}

.app-slide__img {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 100px;
  transform: rotate(30deg);
}
</style>
