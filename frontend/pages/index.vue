<template>
  <div class="container">
    <div>
      <button class="btn btn-primary" @click="getSomething">
        タスク取得
      </button>
      <task-card-deck class="mt-4" :tasks="tasks" :handleNewTask="onNewTask" />
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
    async getSomething() {
      const response = await this.$axios.$get('http://localhost:5000/api/v1/tasks')
      this.tasks = JSON.parse(response.tasks)
      console.log(this.tasks)
    },
    async onNewTask(title: string) {
      console.log(title)
      const newTask: TaskData = {
        title
      }
      this.tasks.unshift(newTask)
    }
  },
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
