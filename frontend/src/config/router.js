import Vue from 'vue';
import Router from 'vue-router';
import Popular from '../views/Popular.vue';
import AskQuestion from '../views/AskQuestion.vue';
import Registration from '../views/Registration.vue';
import Login from '../views/Login.vue';
import Settings from '../views/Settings.vue';
import My from '../views/My.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'popular',
      component: Popular,
    },
    {
      path: '/my',
      name: 'my',
      component: My,
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ '../views/About.vue'),
    },
    {
      path: '/ask',
      name: 'ask',
      component: AskQuestion,
    },
    {
      path: '/signup',
      name: 'signup',
      component: Registration,
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/settings',
      name: 'settings',
      component: Settings,
    },
  ],
});
