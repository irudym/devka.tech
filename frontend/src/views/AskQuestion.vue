<template>
  <div class="ask-question">
    <div class='advices'>
      <i>“Хочешь получить умный ответ - спрашивай умно”</i>
      <p>
        Хотя, не бывает глупых вопросов и все хороши, но ниже несколько советов, как задать вопрос, чтобы получить ответ, который Вы действительно ищите:
      </p>
      <ol>
        <li>Пишите только то, что имеете в виду, избегайте пространных объяснений</li>
        <li>Избегайте намеков, пишите конкретно, что интересует (люди не экстрасенсы и понять, о чем Вы думаете может быть порой очень сложно)</li>
        <li>Делайте уточнения, приводите примеры, которые помогут понять суть вашей проблемы</li>
      </ol>
      <div class="row">
        <div class="col-md-8">
          <error-message v-show="errorMessage" v-bind:message="errorMessage" />
          <float-label label="Заголовок" v-bind:error="errors.title">
            <input name="title" type="text" autocomplete="off" v-model="title" />
          </float-label>
          <float-label label="Описание" :error="errors.description">
            <textarea name="description" v-model="description" />
          </float-label>
          <float-label label="Tэги">
            <tag-input v-model="tags" />
          </float-label>
          <pink-button title="Опубликовать" :style="{fontWeight: '500', fontSize: '1rem', padding: '0.5rem 1rem', marginLeft: '8px'}" @click="submit"/>
        </div>
        <div class="col-md-4"></div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import '../assets/bootstrap-grid.css';

import FloatLabel from '../components/FloatLabel.vue';
import TagInput from '../components/TagInput.vue';
import PinkButton from '../components/PinkButton.vue';
import ErrorMessage from '../components/ErrorMessage.vue';
import { createQuestion } from '@/lib/api';

export default {
  name: "AskQuestion",
  components: {
    FloatLabel,
    TagInput,
    PinkButton,
    ErrorMessage,
  },
  data: function () {
    return {
      title: '',
      description: '',
      tags: [],
      errorMessage: null,
      errors: {
        title: null,
        description: null,
      },
    };
  },
  methods: {
    ...mapActions(['changePageTitle']),
    validate() {
      console.log('VLD: ');
      console.log('==> Title: ', this.title);
      console.log('==> Descr: ', this.description);
      console.log('==>  Tags: ', this.tags);
      const errors = {};
      if (!this.title.trim()) {
        errors.title = 'заголовок не может быть пустым';
      }
      if (!this.description.trim()) {
        errors.description = 'пожалуйста, опишите ваш вопрос';
      }
      if (Object.keys(errors).length !== 0) {
        // show errors
        this.errors = errors;
        return errors;
      }
      return null;
    },
    async submit() {
      if (!this.validate()) {
        this.errors = {};
        // submit
        const { title, description, tags } = this;

        try {
          const response = await createQuestion({ url: '//127.0.0.1:3030',
            question: {
              title,
              description,
              tags
            },
            token: this.getToken,
          });
          this.errorMessage = null;
          
          // TODO: need to route to question view (with comments)
          this.$router.push('/');
        } catch (error) {
          console.log('Cannot post question due to: ', error);
          // show error_message
          this.errorMessage = error.message;
        }
      }
    },
  },
  computed: {
    ...mapGetters(['isLogged', 'getToken']),
  },
  mounted: function () {
    console.log('Ask question mounted');
    console.log('Is logged: ', this.isLogged);

    if (!this.isLogged) {
      this.$router.push('/login');
    }
    
    this.changePageTitle('Задать вопрос');
  },
};
</script>

<style scoped>

.ask-question {
  padding-top: 1rem;
}

</style>
