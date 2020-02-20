<template>
  <div class="topbar">
    <div class="stripe">
      <div class="header-content">
        <div class="search-bar">
          <search-bar />
        </div>
        <div class="title">
          {{title}}
          <pink-button title="Задать вопрос" v-on:click="onAsk" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import PinkButton from './PinkButton.vue';
import SearchBar from './SearchBar.vue';

export default {
  name: 'Topbar',
  components: {
    PinkButton,
    SearchBar,
  },
  computed: mapState({
    title: (state) => state.pageTitle,
  }),
  methods: {
    onAsk: function () {
      console.log("Ask a quesiton clicked!");
      this.$router.push('/ask');
    }
  }
};
</script>

<style lang="scss" scoped>
@import '../styles/layout.scss';
@import '../styles/colours.scss';
@import '../styles/_variables.scss';

.topbar {
  position: fixed;
  background: transparent;
  top: 0;
  width: 100%;
  height: $topbar_height;
  z-index: 200;

  .stripe {
    margin-top: 70px;
    padding: 0.2rem 0;
    background: $header-colour;
  }

  .logo-block {
    position: fixed;
    top: 0;
    left: 0;
    width: $sidebar_width;
    height: 70px;
    background: $sidebar-colour;
  }
}
.title {
  font-size: 1.5rem;
  font-weight: 600;
  color: $header_title-colour;
}

.header-content {
  margin-left: $sidebar_width;

  @media screen and (max-width: map-get($grid-breakpoints, sm)) {
    margin-left: 1rem;
  }

  .search-bar {
    position: relative;
    top: -3.4rem;
    margin-right: 1rem;
  }
}
</style>
