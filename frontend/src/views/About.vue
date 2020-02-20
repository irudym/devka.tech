<template>
  <div class="about">
    <h1>This is an about page</h1>
  </div>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'About',
  methods: {
    ...mapActions(['changePageTitle']),
  },
  mounted: function () {
    console.log('About mounted');
    this.changePageTitle('О проекте');
  },
}
</script>

