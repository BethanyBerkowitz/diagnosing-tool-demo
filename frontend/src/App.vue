<template>
  <div id="app">
    <SymptomPicker v-on:symptom-selected="onSymptomSelected"/>
    <h1 v-if="diagnosisGuess">Maybe your diagnosis is: <span id="diagnosis">{{diagnosisGuess.description}}</span></h1>
  </div>
</template>

<script>
import axios from 'axios'
import SymptomPicker from './components/SymptomPicker.vue'

export default {
  name: 'App',
  components: {
    SymptomPicker
  }, 
  data() {
    return {
      diagnosisGuess: undefined,
    }
  },
  methods: {
    onSymptomSelected(symptomId) {
      axios
      .get(`http://localhost:3000/most_frequent_diagnosis/${symptomId}`)
      .then(response => (this.diagnosisGuess = response.data))
    }
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
#diagnosis {
  color: orange;
}
</style>
