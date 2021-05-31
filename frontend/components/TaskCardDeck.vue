<template>
  <div class="card-deck">
    <task-card v-for="task in tasks" :key="task.id" v-bind="task" />
  </div>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue'
import TaskCard from './TaskCard.vue'
import { TaskData } from '../types/task'

export default Vue.extend({
  components: {
    TaskCard,
  },
  props: {
    tasks: {
      type: Array as PropType<TaskData[]>,
      required: true,
    }
  },
})
</script>