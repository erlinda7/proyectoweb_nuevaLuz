<template>
  <div class="container">
      <br>
      <h5>Registrar Evento</h5>
      <br>
      <br>
      <div class="row justify-content-center">
          <div class="col-sm-6">
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">

    <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
        <b-form-input id="input-1" v-model="form.name" required placeholder="Ingresa un nombre">
        </b-form-input>
    </b-form-group>

    <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
      <b-form-textarea id="textarea-formatter" v-model="text1" placeholder="Ingresa la descripcion" required>
      </b-form-textarea>
    </b-form-group>

    <b-form-group id="input-group-2" label="Lugar del evento" label-for="input-2">
        <b-form-input id="input-2" v-model="form.name" required placeholder="Ingresa el lugar">
        </b-form-input>
    </b-form-group>
    
    <div class="form-group">
      <label >Fecha del evento</label>
      <input type="date" name="bday" min="1000-01-01" max="3000-12-31" class="form-control">
    </div>

    <b-form-group id="input-group-3" label="Potada del evento" label-for="input-3">
    <b-form-file v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
    </b-form-file>
    </b-form-group>
    <div class="mt-3">Selecciona una opcion: {{ file ? file.name : '' }}</div>
      <b-button type="submit" variant="primary">Submit</b-button>
      <b-button type="reset" variant="danger">Reset</b-button>
    </b-form>
    <b-card class="mt-3" header="Form Data Result">
      <pre class="m-0">{{ form }}</pre>
    </b-card>
    </div>
    </div>
  </div>
</template>

<script>
export default {
    data() {
      return {
        file: null,
        text1:'',
        selected: null,
        options: [
          { value: null, text: 'Please select an option' },
          { value: 'a', text: 'This is First option' },
          { value: 'b', text: 'Selected Option' },
          { value: { C: '3PO' }, text: 'This is an option with object value' },
          { value: 'd', text: 'This one is disabled', disabled: true }
        ],
        form: {
          fecha: '',
          email: '',
          name: '',
          food: null,
          checked: []
        },
        foods: [{ text: 'Select One', value: null }, 'Carrots', 'Beans', 'Tomatoes', 'Corn'],
        show: true
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        alert(JSON.stringify(this.form))
      },
      onReset(evt) {
        evt.preventDefault()
        // Reset our form values
        this.form.email = ''
        this.form.name = ''
        this.form.food = null
        this.form.checked = []
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>

<style>

</style>