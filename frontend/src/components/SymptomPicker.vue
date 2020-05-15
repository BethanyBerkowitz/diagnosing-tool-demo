<template>
  <div>
    <h1>Select your symptom:</h1>
    <el-select v-model="value" placeholder="Select" v-on:change="onSelect">
      <el-option
        v-for="item in options"
        :key="item.id"
        :label="item.description"
        :value="item.id">
      </el-option>
    </el-select>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'SymptomPicker',
  data() {
    return {
      options: [],
      value: ''
    }
  }, 
  mounted () {
    axios
      .get('http://localhost:3000/symptoms')
      .then(response => (this.options = response.data))
  },
  methods: {
    onSelect(selected) {
      this.$emit('symptom-selected', selected)
    }
  }
}
</script>

