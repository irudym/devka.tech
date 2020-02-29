<template>
  <div class="tags row">
    <div class="col-lg-9">
        <question-card v-for="question in questions" :key="question.id" v-bind:question="question"/>
    </div>
    <div class="col-lg-3" />
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import '../assets/bootstrap-grid.css';
import QuestionCard from '../components/QuestionCard.vue';
import { fetchTaggedQuestions } from '../lib/api';
import { serverUrl } from '../config/globals';

export default {
  name: 'Tags',
  props: ['tag'],
  components: {
    QuestionCard,
  },
  data() {
    return {
      questions: [],
    };
  },
  methods: {
    ...mapActions(['changePageTitle']),
  },
  async mounted() {
    console.log('Tags mounted');
    this.changePageTitle(`Вопросы с тэгом ${this.tag}`);

    // fetch questions
    try {
      const data = await fetchTaggedQuestions({ url: serverUrl, tag: this.tag });
      this.questions = [...data];
    } catch (error) {
      console.log('Cannot load questions due to error: ', error.message);
      // TODO: show error
    }
  },
};
</script>

<style lang="scss" scoped>
.popular {
  padding-top: 1rem;
}
</style>
