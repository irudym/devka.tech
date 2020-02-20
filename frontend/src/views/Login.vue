<template>
  <div class="login">
    <div class="row">
        <div class="col-lg-2" />
        <div class="col-lg-4">
          <error-message v-show="errorMessage" v-bind:message="errorMessage" />
          <float-label label="Электронная почта" v-bind:error="errors.email">
            <input name="email" type="text" autocomplete="off" v-model="email" />
          </float-label>
          <float-label label="Пароль" v-bind:error="errors.password">
            <input name="password" type="password" autocomplete="off" v-model="password" />
          </float-label>
          <pink-button title="Войти" :style="{fontWeight: '500', fontSize: '1rem', padding: '0.5rem 1rem', marginLeft: '8px'}" @click="submit"/>
        </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import FloatLabel from '../components/FloatLabel.vue';
import PinkButton from '../components/PinkButton.vue';
import ErrorMessage from '../components/ErrorMessage.vue';
import { login } from '@/lib/api';

export default {
  name: 'Login',
  components: {
    FloatLabel,
    PinkButton,
    ErrorMessage,
  },
  data: function () {
    return  {
      email: '',
      password: '',
      errorMessage: null,
      errors: {
        email: null,
        password: null,
      },
    };
  },
  methods: {
    ...mapActions(['changePageTitle', 'loginUser']),
    validate() {
      const errors = {};
      if (!this.password.trim()) {
        errors.password = 'Пароль не может быть пустым!';
      }
      if (!this.email.trim()) {
        errors.email = 'Пожалуйста, укажите email, который использовался при регистрации';
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
        const { email, password } = this;
        try {
          const response = await login({ url: '//127.0.0.1:3030',
            credentials: {
              email,
              password,
            },
          });
          this.errorMessage = null;
          console.log('Logged-in: ', response);

          // call vuex store to set current user
          const user = {
            email,
            auth_token: response.auth_token,
            nickname: response.nickname,
          };
          this.loginUser(user);
          
          // go back
          this.$router.go(-1);
        } catch (error) {
          console.log('Cannot login due to: ', error);
          // show error_message
          this.errorMessage = error.message;
        }
      }
    },
  },
  mounted: function () {
    this.changePageTitle('Вход');
    console.log("ROUTER: ", this.$router);
    
  },
};
</script>

<style lang="scss" scoped>

.login {
  padding-top: 2rem;
}

</style>
