<template>
  <div class="popular row">
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

import { fetchQuestions } from '../lib/api';
import { serverUrl } from '../config/globals';

export default {
  name: 'Popular',
  components: {
    QuestionCard,
  },
  data: function () {
    return {
      questions: [
        {
          id: 100,
          type: 1,
          title: 'Как заккомиттить код на github',
          type_image: '',
          description: 'Подруги, подскажите, как зааплоадить изменения на github, чтобы они были отдельным форком?',
          comments: 2,
          views: 4,
          stars: 2,
          tags: [{id: 1, text: 'github'}, {id:2, text: 'dev'}, {id: 3, text: 'ногти'}, 
          {id: 4, text: 'ruby'}, {id: 5, text: 'javascript'}],
          user: {id: 1, nickname: '__anuka__'},
          created_at: '22/03/2019',
        },
        {
          id: 101,
          type: 2,
          title: 'Какая длина ногтей лучше всего подходит для Python?',
          type_image: '',
          description: 'Девчёнки, посоветуйте оптимальную длину ногтей, чтобы быстро печатать код на питоне? Там же табуляция часто используется, и длинный ноготь на мизинчике мешает',
          comments: 10,
          views: 30,
          stars: 4,
          tags: [{id: 6, text: 'python'}, {id: 7, text: 'ногти'}],
          user: {id: 2, nickname: 'dev_chushka'},
          created_at: '22/03/2019',
        },
      ],
    };
  },
  methods: {
    ...mapActions(['changePageTitle', 'getToken']),
  },
  mounted: async function () {
    console.log('Popular mounted');
    this.changePageTitle('Популярные вопросы');

    // fetch questions
    try {
      const data = await fetchQuestions({ url: serverUrl, token: this.getToken });      
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
