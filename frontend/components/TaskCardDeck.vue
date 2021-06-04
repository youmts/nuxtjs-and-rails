<template>
  <b-list-group>
    <new-task-card :handleNewTask="handleNewTask" />
    <task-card v-for="task in tasks" :key="task.id" v-bind="task" />
  </b-list-group>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue'
import TaskCard from './TaskCard.vue'
import NewTaskCard from './NewTaskCard.vue'
import { TaskData } from '../types/task'

export default Vue.extend({
  components: {
    TaskCard,
    NewTaskCard,
  },
  props: {
    tasks: {
      type: Array as PropType<TaskData[]>,
      required: true,
    },
    handleNewTask : {
      type: Function as PropType<(title: string) => void>,
      required: true
    }
  },
})
</script>