<template>
  <div>
    <h1>Select your diagnosis:</h1>
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
  name: 'DiagnosisPicker',
  data() {
    return {
      options: [],
      value: ''
    }
  }, 
  mounted () {
    axios
      .get('http://localhost:3000/diagnoses')
      .then(response => (this.options = response.data))
  },
  methods: {
    onSelect(selected) {
      this.$emit('diagnosis-selected', selected)
    }
  }
}
</script>

