<template>
  <b-list-group-item>
    <div class="d-flex align-items-center">
      <b-form-input
        class="card-text"
        v-model="internalTitle"
        @change="onChange"
      ></b-form-input>
      <fa-icon icon="check" />
    </div>
  </b-list-group-item>
</template>

<script lang="ts">
import Vue, {PropType} from 'vue'

class Data {
  internalTitle!: string
}

export default Vue.extend({
  props: {
    title: {
      type: String,
      required: true,
    },
    index: {
      type: Number,
      required: true,
    },
    handleEditTask : {
      type: Function as PropType<(index: number, title: string) => void>,
      required: true
    }
  },
  data(): Data {
    return {
      internalTitle: 'dummy',
    }
  },
  watch: {
    title: {
      immediate: true,
      handler(value) {
        this.internalTitle = value
      }
    }
  },
  methods: {
    onChange() {
      console.log("onChange")
      this.handleEditTask(this.index, this.internalTitle)
      console.log(this.internalTitle)
    }
  },
})
</script>

<style lang="scss">
.task-text {
  text-align: left;
}
</style>

<style lang="scss">
.card-text
{
  border: none;
  border-color: transparent;
}
</style>