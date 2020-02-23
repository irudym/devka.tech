<template>
  <div class="input-container">
    <pill v-for="pill in pills" v-bind:text="pill" closeable @close="removeTag" />
    <input
      v-model="tagText"
      @focus="focus"
      @blur="blur"
      v-on:keyup.space="addPill"
      v-on:keyup.enter="addPill"
      v-on:keyup.backspace="removeLastPill"
      ref="tagInput"/>
   </div>
</template>

<script>
import Pill from './Pill.vue';

export default {
  name: 'TagInput',
  components: {
    Pill,
  },
  props: {
    tags: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      pills: [],
      tagText: '',
    };
  },
  methods: {
    focus() {
      this.$emit('focus');
    },
    blur() {
      this.$emit('blur');
    },
    addPill() {
      const text = `${this.tagText}`;
      if (text.trim() !== '') {
        this.pills.push(text.toLowerCase());
        // update input
        this.$emit('input', this.pills);
      }
      this.tagText = '';
      this.$refs.tagInput.value = ' ';
    },
    clear() {
      console.log('CALL CLEAR');
      this.tagText = '';
      this.$refs.tagInput.value = '';
    },
    removeTag(tag) {
      console.log('Remove tag: ', tag);
      this.pills = this.pills.filter(pill => pill !== tag);
      // update input
      this.$emit('input', this.pills);
    },
    removeLastPill() {
      // in case input in empty
      if (this.tagText === '') {
        const text = this.pills[this.pills.length - 1];
        this.pills = this.pills.slice(0, this.pills.length - 1);
        // add pill's text to input (to edit it)
        this.tagText = text;
        this.$emit('input', this.pills);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../styles/colours.scss';

.input-container {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  border: 1px solid $form_border-colour;
  border-radius: 2px;
  background: $input_background-colour;
  padding: 0.6rem 8px;

  input {
    border: 0;
    outline: none;
    font-size: 1rem;
    flex-grow: 1;
    width: 2rem;
  }
}

</style>
