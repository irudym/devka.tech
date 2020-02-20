Vue.component('uploader', {
  template: `<div class="uploader">
              <img v-show="image" class="img-thumbnail" :src="image" />
              <input v-on:change="input" :id="inputId" type="file" accept="image/*" capture="camera" class="imagepicker" />
                <label :for="inputId">
              <div class="picker">+</div>
              </label>
            </div>`,
  props: ['value', 'id'],
  data: function () {
    return {
      image: null,
    };
  },
  methods: {
    input(e) {
      const files = e.target.files;
      if (files && files[0]) {
        let reader = new FileReader();
  
        // reader.onloadstart = () => this.setState({ loading: true });
        reader.onload = (event) => {
          const result = event.target.result;
          
          this.image = result;
          this.$emit('input', result);
        };
  
        reader.readAsDataURL(files[0]);
      }
      this.$emit('input', e);
    }
  },
  computed: {
    inputId() {
      return `image_uploader_${this.id}`;
    }
  },
  watch: {
    value: function(newVal) {
      if (newVal === null) this.image = newVal;
    },
  },
});