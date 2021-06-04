<template>
  <b-list-group-item>
    <div class="task-text">
      {{ title }}
    </div>
  </b-list-group-item>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    title: {
      type: String,
      required: true,
    }
  },
})
</script>

<style lang="scss">
.task-text {
  text-align: left;
}
</style>