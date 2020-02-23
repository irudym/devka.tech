<template>
  <div class="my row">
    <div class="col-lg-9">
        <question-card v-for="question in questions" :key="question.id" v-bind:question="question"/>
    </div>
    <div class="col-lg-3" />
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import '../assets/bootstrap-grid.css';
import QuestionCard from '../components/QuestionCard.vue';

import { fetchUserQuestions } from '../lib/api';
import { serverUrl } from '../config/globals';

export default {
  name: 'My',
  components: {
    QuestionCard,
  },
  data() {
    return {
      questions: [{
        id: 100,
        type: 1,
        title: 'Как заккомиттить код на github',
        user: { id: 1, nickname: '__anuka__' },
      }],
    };
  },
  methods: {
    ...mapActions(['changePageTitle']),
  },
  computed: {
    ...mapGetters(['isLogged', 'getUserId']),
  },
  async mounted() {
    if (!this.isLogged) {
      this.$router.push('/login');
    }

    console.log('My mounted');
    this.changePageTitle('Мои вопросы');

    // fetch questions
    try {
      const data = await fetchUserQuestions({ url: serverUrl, user_id: this.getUserId });
      this.questions = [...data];
    } catch (error) {
      console.log('Cannot load questions due to error: ', error.message);
      // TODO: show error
    }
  },
};
</script>

<style lang="scss" scoped>
.my {
  padding-top: 1rem;
}

</style>
