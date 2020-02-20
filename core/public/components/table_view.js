Vue.component('tableview', {
  template: `
    <table class="table">
      <thead>
        <tr>
          <th>delete</th>
          <th>id</th>
          <th>picture</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="picture in pictures" :key="picture.id">
          <td><button class="btn btn-danger" @click="pictureDelete(picture.id)">x</button></td>
          <td>{{picture.id}}</td>
          <td>
            <img :src="picture.picture" alt="" class="img-thumbnail">
          </td> 
        </tr>
      </tbody>
    </table>
  `,
  props: ['pictures'],
  methods: {
    pictureDelete(id) {      
      this.$emit('delete', id);
    }
  }
});