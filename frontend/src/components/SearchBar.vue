<template>
  <div class="bar-container">
    <div class="row">
      <div class="col-lg-9">
        <input type="text" placeholder="НАЙТИ"/>
      </div>
    </div>
  </div>
</template>

<script>
import '../assets/bootstrap-grid.css';

export default {
  name: 'SearchBar',
}
</script>

<style lang="scss" scoped>
@import '../styles/layout.scss';
@import '../styles/colours.scss';

.bar-container {
  input {
    border: 1px solid $form_border-colour;
    border-radius: 8px;
    width: 100%;
    font-size: 1rem;
    padding: 0rem 0.5rem 0 0.5rem;
    outline: none;
    height: 2rem;
  }
}
</style>


