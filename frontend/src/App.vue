<template>
  <div id="app">
    <Topbar />
    <Sidebar v-bind:items="sidemenuItems"/>
    <div class="main">
      <router-view/>
    </div>
  </div>
</template>

<script>
import './assets/bootstrap-grid.css';
import Sidebar from '@/components/Sidebar.vue';
import Topbar from '@/components/Topbar.vue';

export default {
  name: 'App',
  components: {
    Sidebar,
    Topbar,
  },
  data: function () {
    return {
      sidemenuItems: [
        {
          id: 100,
          name: 'Популярные',
          link: '/',
        },
        {
          id: 101,
          name: 'Любимые  ',
          link: '/loved',
        },
        {
          id: 102,
          name: 'Мои',
          link: '/my',
        },
        {
          id: 103,
          name: 'О проекте',
          link: '/about',
        },
        {
          id: 104,
          name: 'Настройки',
          link: '/settings',
        },
      ],
    }
  },
};

</script>

<style lang="scss">
@import './styles/layout.scss';
@import './styles/colours.scss';
@import './styles/_variables.scss';

body {
  background: $background-colour;
  font-size: 14px;
}

#app {
  font-family: 'Roboto', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.main {
  margin-top: $topbar_height;
  padding-left: 1rem;
  padding-top: 1rem;
  margin-left: $sidebar_width;

  margin-right: 1rem;

  @media screen and (max-width: map-get($grid-breakpoints, sm)) {
    margin-left: 0;
  }

  h1 {
    letter-spacing: 0.5px;
    font-family: 'Oswald', sans-serif;
    font-size: 1.5rem;
    font-weight: 500;
  }
}

#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
