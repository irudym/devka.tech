<template>
  <button class="pink-button" :style="buttonStyle" v-on:click.stop.prevent="$emit('click')">{{title}}</button>
</template>

<script>
export default {
  name: 'PinkButton',
  props: {
    title: String,
    style: {
      type: Object,
      default: () => ({}),
    },
  },
  computed: {
    buttonStyle () {
     return this.style;
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../styles/layout.scss';
@import '../styles/colours.scss';

.pink-button {
  background: $main_button-colour;
  border: none;
  border-radius: 8px;
  color: $main_button_text-colour;
  font-weight: 600;
  font-size: 1rem;
  padding: 1rem;
  cursor: pointer;
  display: block;
  margin: 1rem 0;
  outline: none;
}

.pink-button:hover {
  background: $main-button-highlight;
}

.pink-button:active {
  padding-top:1.05rem;
  padding-bottom: 0.95rem;
}

</style>
