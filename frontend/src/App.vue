<template>
  <div id="app">
    <SymptomPicker/>
  </div>
</template>

<script>
import SymptomPicker from './components/SymptomPicker.vue'

export default {
  name: 'App',
  components: {
    SymptomPicker
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
