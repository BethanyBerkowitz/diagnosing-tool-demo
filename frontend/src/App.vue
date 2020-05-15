<template>
  <div id="app">
    <SymptomPicker v-on:symptom-selected="onSymptomSelected"/>
    <div v-if="diagnosisGuess && !message">
      <h1>Maybe your diagnosis is: <span id="diagnosis">{{diagnosisGuess.description}}</span></h1>
      <el-button type="success" v-on:click="onDiagnosisConfirmed(diagnosisGuess.id)">Yes, that's it!</el-button>
      <el-button type="danger" v-on:click="onDiagnosisDenied">No way</el-button>
    </div>
    <h2 v-if="message">{{message}}</h2>
    <div v-if="showDiagnosisPicker">
      <DiagnosisPicker v-on:diagnosis-selected="onDiagnosisSelected"/>
      <el-button v-if="diagnosisSelected" type="success" v-on:click="onDiagnosisConfirmed(diagnosisSelected)">Submit</el-button>
    </div>
    <el-button v-on:click="reset">Start over</el-button>
  </div>
</template>

<script>
import axios from 'axios'
import SymptomPicker from './components/SymptomPicker.vue'
import DiagnosisPicker from './components/DiagnosisPicker.vue'

export default {
  name: 'App',
  components: {
    SymptomPicker, 
    DiagnosisPicker
  }, 
  
  data() {
    return this.defaultData()
  },
  methods: {
    defaultData() {
      return {
        symptomSelected: undefined, 
        diagnosisSelected: undefined,
        diagnosisGuess: undefined,
        showDiagnosisPicker: false,
        message: '', 
      }
    },

    onSymptomSelected(symptomId) {
      this.symptomSelected = symptomId
      axios
        .get(`http://localhost:3000/most_frequent_diagnosis/${symptomId}`)
        .then(response => (this.diagnosisGuess = response.data))
    }, 

    onDiagnosisSelected(diagnosisId) {
      this.diagnosisSelected = diagnosisId
    }, 

    onDiagnosisConfirmed(diagnosisId) {
      this.message = "Great, thank you!"
      this.showDiagnosisPicker = false
      axios
        .post('http://localhost:3000/diagnosis_frequencies/', { 
          symptom_id: this.symptomSelected, 
          diagnosis_id: diagnosisId
        })
    },

    onDiagnosisDenied() {
      this.message = "Oops, sorry. Can you pick your diagnosis from one of these?"
      this.showDiagnosisPicker = true
    }, 

    reset() {
      Object.assign(this.$data,this.defaultData())
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
.el-button {
  margin: 20px;
}
</style>
