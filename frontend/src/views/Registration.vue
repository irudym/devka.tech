<template>
  <div class="registration">
    <div class="row">
      <div class="col-md-7">
        <error-message v-show="errorMessage" v-bind:message="errorMessage" />
        <div class="row">
          <div class="col-sm">
            <float-label label="Имя" v-bind:error="errors.first_name">
              <input name="firstname" type="text" autocomplete="off" v-model="firstName" />
            </float-label>
          </div>
          <div class="col-sm">
            <float-label label="Фамилия" v-bind:error="errors.second_name">
              <input name="secondname" type="text" autocomplete="off" v-model="secondName" />
            </float-label>
          </div>
        </div>
        <float-label label="Nickname" v-bind:error="errors.nickname">
          <input name="nickname" type="text" autocomplete="off" v-model="nickname" />
        </float-label>
        <float-label label="Электронная почта" v-bind:error="errors.email">
          <input name="email" type="text" autocomplete="off" v-model="email" />
        </float-label>
        <float-label label="Пароль" v-bind:error="errors.password">
          <input name="password" type="password" autocomplete="off" v-model="password" />
        </float-label>
        <pink-button title="Зарегистрироваться" :style="{fontWeight: '500', fontSize: '1rem', padding: '0.5rem 1rem', marginLeft: '8px'}" @click="submit"/>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import '../assets/bootstrap-grid.css';

import FloatLabel from '../components/FloatLabel.vue';
import PinkButton from '../components/PinkButton.vue';
import ErrorMessage from '../components/ErrorMessage.vue';
import { signup } from '@/lib/api';

export default {
  name: 'Registration',
  components: {
    FloatLabel,
    PinkButton,
    ErrorMessage,
  },
  data: function () {
    return  {
      firstName: '',
      secondName: '',
      nickname: '',
      email: '',
      password: '',
      errorMessage: null,
      errors: {
        first_name: null,
        second_name: null,
        nickname: null,
        email: null,
        password: null,
      },
    };
  }, 
  methods: {
    ...mapActions(['changePageTitle', 'loginUser']),
    validate() {
      const errors={};
      if (!this.nickname.trim()) {
        errors.nickname = 'Пожалуйста, укажите nickname, который будет вас идентифицировать';
      }
      if (!this.password.trim()) {
        console.log("REG: password error");
        errors.password = 'Пароль не может быть пустым!';
      }
      if (!this.email.trim()) {
        errors.email = 'Укажите email, адрес используется для входа на сайт';
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
        // signup the user
        const { firstName, secondName, nickname, email, password } = this;
        try {
          const response = await signup({
            url: '//127.0.0.1:3030',
            user: {
              first_name: firstName,
              last_name: secondName,
              nickname,
              email,
              password,
            }
          });
          console.log('User created: ', response);
          // login the user
          this.loginUser({...response, email});

          //TODO:: go somewhere
          // go back ?
          this.$router.go(-1);
        } catch (error) {
          console.log('Error: ', error.message);
          // show error_message
          this.errorMessage = error.message;
        }
      }
    },
  },
  mounted: function () {
    this.changePageTitle('Регистрация');
  },
};
</script>

<style lang="scss" scoped>

.registration {
  padding-top: 2rem;
}

</style>
