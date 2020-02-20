<template>
  <div class="question-card row">
    <div class="col-sm-3 card d-none d-sm-none d-md-block">
      <div class="info-box">
        <div class="creator-info">
          вопрос от <a class="author" href="#">{{question.user.nickname}}</a>
          <p class="date">{{question.created_at}}</p>
        </div>
      </div>
    </div>
    <div class="col-md-9 col-sm-12 card main-box">
        <h1>{{question.title}}</h1>
        <div class="description">
          {{question.description}}
        </div>
        <div class="tag-holder">
          <pill v-for="tag in question.tags" :key="tag.id" v-bind:text="tag.text" @click="handlePillClick" />
        </div>
    </div>
  </div>
</template>

<script>
import Pill from './Pill.vue';
import '../assets/bootstrap-grid.css';


export default {
  name: 'QuestionCard',
  props: {
    question: Object,
  },
  components: {
    Pill,
  },
  methods: {
    handlePillClick: function (tag) {
      console.log("Click on TAG: ", tag);
      //route to /tags/${tag}
    }
  }
};
</script>

<style lang="scss" scoped>
@import '../styles/layout.scss';
@import '../styles/colours.scss';

.question-card {
  margin-top: 2rem;
}

.card {
  padding: 0 10px; 
}

.info-box {
  background: $card-colour;
  width: 100%;
  height: 100%;
  border-top: 6px solid $green-colour;
  font-size: 0.8rem;

  .creator-info {
    margin-top: 1rem;
    text-align: center;
    .author {
      font-weight: 600;
      color: $author-colour;
      cursor: pointer;
      text-decoration: none;
    }
    .date {
      font-weight: 600;
      font-style: italic;
      color: $input_label-colour;
      margin-top: 0.5rem;
    }

    p {
      margin: 0;
    }
  }
}

.main-box {
  background: $card-colour;
  padding: 1rem 1rem 1rem 128px;
  border-top: 6px solid $green-colour;
}

.description {
  font-size: 0.9rem;
  color: $description-colour;
}

.tag-holder {
  margin-top: 1rem;
  display: flex;
  flex-wrap: wrap;
}

</style>
