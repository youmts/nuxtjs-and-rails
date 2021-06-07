<template>
  <div class="container">
    <div>
      <task-card-deck class="mt-4" :tasks="tasks" :handleNewTask="onNewTask" :handleEditTask="onEditTask" />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import TaskCardDeck from '../components/TaskCardDeck.vue'
import { TaskData } from '../types/task'

class Data {
  tasks!: TaskData[];
  editingTask!: TaskData;
}

const URL = 'http://localhost:5000/api/v1/'

export default Vue.extend({
  components: {
    TaskCardDeck,
  },
  data(): Data {
    return {
      tasks: [],
      editingTask: { title: 'dummy' }
    }
  },
  methods: {
    async getTasks() {
      const response = await this.$axios.$get(`${URL}tasks`)
      this.tasks = response.data
      console.log(this.tasks)
    },
    async onNewTask(title: string) {
      // TODO: avoid cors
      const response = await this.$axios.$post(`${URL}tasks`, { title })
      console.log(title)
      // TODO: error check
      const newTask = response.data
      console.log(newTask)
      this.tasks.unshift(newTask)
    },
    async onEditTask(index: number, title: string) {
      console.log(index, title)
      this.tasks[index] = {
        ...this.tasks[index],
        title
      },
      console.log(this.tasks[index])
    }
  },
  mounted: async function() {
    await this.getTasks()
  }
})
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
