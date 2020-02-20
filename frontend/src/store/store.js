import Vue from 'vue';
import Vuex from 'vuex';
import * as Cookies from 'js-cookie';

import * as types from './types';

const COOKIE_NICKNAME = 'devka-nickname';
const COOKIE_EMAIL = 'devka-email';
const COOKIE_AUTH_TOKEN = 'devka-auth_token';


Vue.use(Vuex);

const initialState = {
  pageTitle: 'Популярные вопросы',
  user: {
    nickname: Cookies.get(COOKIE_NICKNAME),
    email: Cookies.get(COOKIE_EMAIL),
    auth_token: Cookies.get(COOKIE_AUTH_TOKEN),
  },
};


export default new Vuex.Store({
  state: {
    ...initialState,
  },
  mutations: {
    [types.CHANGE_PAGE_TITLE](state, payload) {
      state.pageTitle = payload.title;
    },
    [types.LOGIN_USER](state, payload) {
      state.user = { ...payload.user };

      // put data to cookies
      Cookies.set(COOKIE_NICKNAME, state.user.nickname);
      Cookies.set(COOKIE_AUTH_TOKEN, state.user.auth_token);
      Cookies.set(COOKIE_EMAIL, state.user.email);
    },
    [types.LOGOUT_USER](state, payload) {
      state.user = {
        nickname: null,
        auth_token: null,
        email: null,
      };
    },
  },
  actions: {
    changePageTitle(context, title) {
      context.commit(types.CHANGE_PAGE_TITLE, { title });
    },
    loginUser(context, user) {
      context.commit(types.LOGIN_USER, { user });
    },
    logoutUser(context) {
      context.commit(types.LOGOUT_USER, {});
    },
  },
  getters: {
    isLogged: state => state.user.nickname && state.user.email && state.user.auth_token,
    getToken: state => state.user.auth_token,
  },
});
