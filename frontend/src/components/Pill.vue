<template>
  <div class="pill" @click="$emit('click', text)">
    {{text}}
    <div v-show="closeable">
      <button @click.stop.prevent="clickOnPill">X</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Pill',
  props: {
    text: String,
    closeable: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    clickOnPill() {
      this.$emit('close', this.text);
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../styles/layout.scss';
@import '../styles/colours.scss';

.pill {
  border-radius: 8px;
  background: $pill-colour;
  color: $pill_text-colour;
  font-size: 0.8rem;
  font-weight: 600;
  text-align: center;
  margin-right: 0.8rem;
  margin-top: 0.2rem;
  padding: 0.2rem 1rem;
  display: flex;
  user-select: none;

  button {
    margin-left: 0.5rem;
    border: 0;
    border-radius: 10px;
    width: 1rem;
    padding: 0;
    height: 1rem;
    background: $pill-colour;
    color: $pill_text-colour;
    cursor: pointer;
    outline: none;
    font-weight: 600;
    font-size: 0.6rem;
  }
}

.pill:hover {
  background: $pill-highlight;
  color: $pill_text-highlight;

  button {
    background: $pill-colour;
  }
}
</style>
