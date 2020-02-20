<template>
  <div class="settings">
    <div class="row">
      <div class="col-md-7">
        <error-message v-show="errorMessage" v-bind:message="errorMessage" />
        <float-label label="Nickname" v-bind:error="errors.nickname">
          <input name="nickname" type="text" autocomplete="off" v-model="nickname" />
        </float-label>
        <div class="avatar-block">
          <div class="row">
            <div class="col-md-6">
              <img class="avatar-body" v-for="body in bodyPictures" v-bind:src="body.picture" :key="body.id" v-show="body.id == bodyPictures[currentBody].id">
              <img class="avatar-eyes" v-for="eyes in eyesPictures" v-bind:src="eyes.picture" :key="eyes.id" v-show="eyes.id == eyesPictures[currentEyes].id">
            </div>
            <div class="col-md-6">
              <div class="control">
                <div class="row">
                  <div class="col-4">
                    <pink-button title="<" @click="bodyPrev"/>
                  </div>
                  <div class="col-4">
                    Тело
                  </div>
                  <div class="col-4">
                    <pink-button title=">" @click="bodyNext"/>
                  </div>
                </div>
                <div class="row">
                  <div class="col-4">
                    <pink-button title="<" />
                  </div>
                  <div class="col-4">
                    Прическа
                  </div>
                  <div class="col-4">
                    <pink-button title=">" />
                  </div>
                </div>
                <div class="row">
                  <div class="col-4">
                    <pink-button title="<" @click="eyesPrev" />
                  </div>
                  <div class="col-4">
                    Глаза
                  </div>
                  <div class="col-4">
                    <pink-button title=">" @click="eyesNext" />
                  </div>
                </div>
                <div class="row">
                  <div class="col-4">
                    <pink-button title="<" />
                  </div>
                  <div class="col-4">
                    Нос
                  </div>
                  <div class="col-4">
                    <pink-button title=">" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import '../assets/bootstrap-grid.css';

import FloatLabel from '../components/FloatLabel.vue';
import PinkButton from '../components/PinkButton.vue';
import ErrorMessage from '../components/ErrorMessage.vue';

import { fetchBodyImages, fetchEyesImages } from '../lib/api';
import { serverUrl } from '../config/globals';

export default {
  name: "Settings",
  components: {
    FloatLabel,
    PinkButton,
    ErrorMessage,
  },
  data() {
    return {
      nickname: '',
      errorMessage: null,
      bodyPictures: [],
      eyesPictures: [],
      currentBody: 0,
      currentEyes: 0,
      errors: {
        nickname: null,
      },
    };
  },
  methods: {
    ...mapActions(['changePageTitle']),
    bodyNext() {
      this.currentBody += 1;
      if (this.currentBody >= this.bodyPictures.length) {
        this.currentBody = 0;
      }
    },
    bodyPrev() {
      this.currentBody -= 1;
      if (this.currentBody < 0) {
        this.currentBody = this.bodyPictures.length - 1;
      }
    },
    eyesNext() {
      this.currentEyes += 1;
      this.currentEyes %= this.eyesPictures.length;
    },
    eyesPrev() {
      this.currentEyes -= 1;
      if (this.currentEyes < 0) {
        this.currentEyes = this.eyesPictures.length - 1;
      }
    },
  },
  computed: {
    ...mapGetters(['isLogged', 'getToken']),
  },
  mounted: async function () {
    if (!this.isLogged) {
      this.$router.push('/login');
    }
    this.changePageTitle('Настройки');

    //load images
    try {
      const data = await fetchBodyImages({ url: serverUrl });
      console.log("DATA: ", data);
      this.bodyPictures = [...data];

      const eyes_data = await fetchEyesImages({ url: serverUrl });
      console.log("EYES DATA: ", eyes_data);
      this.eyesPictures = [...eyes_data];
      
    } catch (error) {
      console.log('Cannot load images due to error: ', error.message);
      this.errorMessage = error.message;
    }
  },
};
</script>

<style lang="scss" scoped>
@import '../styles/colours.scss';

.settings {
  padding-top: 2rem;
}

.avatar-block {
  background: $card-colour;
  width: 100%;
  padding: 1rem;
}

.avatar-body {
  border-radius: 50%;
  height: 200px;
  width: 200px;
  position: absolute;
  top: 0;
  left: 0;
}

.avatar-eyes {
  height: 200px;
  width: 200px;
  position: absolute;
  top: 0;
  left: 0;
}

.control {
  margin: auto;
}

</style>
