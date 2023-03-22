<template>
  <h1>How Vue Drives Global Trade</h1>
  <img :src="adblock" class="adblock" />
</template>

<script setup>
import adblock from '@/assets/adblock.png';
</script>

<style scoped>
.adblock {
  width: 500px;
  position: absolute;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;
}
</style>
