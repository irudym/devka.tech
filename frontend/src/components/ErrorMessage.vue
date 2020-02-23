<template>
  <div class="row">
    <div class="col">
      <div class="error-message">
        {{message}}
      </div>
    </div>
  </div>
</template>

<script>
import '../assets/bootstrap-grid.css';

export default {
  name: 'ErrorMessage',
  props: {
    message: String,
  },
};
</script>

<style lang="scss" scoped>
@import '../styles/colours.scss';

.error-message {
  border-left: 4px solid $warning-colour;
  width: 100%;
  height: 4rem;
  padding: 1rem;
  margin-bottom: 3rem;
  background: $input_background-colour;
}

</style>
