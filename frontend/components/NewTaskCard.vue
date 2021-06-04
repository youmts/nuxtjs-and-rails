<template>
  <b-list-group-item>
    <b-form inline @submit.stop.prevent>
      <b-form-input
        class="card-text"
        v-model="title"
        placeholder="新しいタスク"
        @change="onChange"
        ></b-form-input>
    </b-form>
  </b-list-group-item>
</template>

<script lang="ts">
import Vue, {PropType} from 'vue'

class Data {
  title!: string
}

export default Vue.extend({
  props: {
    handleNewTask : {
      type: Function as PropType<(title: string) => void>,
      required: true
    }
  },
  data(): Data {
    return {
      title: ""
    }
  },
  methods: {
    onChange() {
      console.log("onChange")
      this.handleNewTask(this.title)
      this.title = ""
    }
  }
})
</script>

<style lang="scss">
.card-text
{
  border: none;
  border-color: transparent;
}
</style>