<template>
  <div class="container">
      <br>
      <h5>Registrar Evento</h5>
      <br>
      <br>
      <div class="row justify-content-center">
          <div class="col-sm-6">
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">

    <b-form-group id="input-group-3" label="Potada del evento" label-for="input-3">
      <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
      </b-form-file>
      </b-form-group>

      <b-form-group id="input-group-3" label-for="input-3">
      <b-form inline>
        <b-input v-model="exito" placeholder="Jane Doe" disabled></b-input>
        <b-button variant="primary">Guardar Imagen</b-button>
      </b-form>
    </b-form-group>
      
    <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
        <b-form-input id="input-1" v-model="form.nombre" required placeholder="Ingresa un nombre">
        </b-form-input>
    </b-form-group>

    <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
      <b-form-textarea id="textarea-formatter" v-model="form.descripcion" placeholder="Ingresa la descripcion" required>
      </b-form-textarea>
    </b-form-group>

    <b-form-group id="input-group-2" label="Lugar del evento" label-for="input-2">
        <b-form-input id="input-2" v-model="form.lugar" required placeholder="Ingresa el lugar">
        </b-form-input>
    </b-form-group>
    
    <div class="form-group">
      <label >Fecha del evento</label>
      <input v-model="form.fecha" type="date" name="bday" min="1000-01-01" max="3000-12-31" class="form-control">
    </div>
  
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
import axios from 'axios'
export default {
    data() {
      return {
        exito: '',
        imagenes:{},
        file: null,
        form: {
          nombre: '',
          descripcion: '',
          lugar: '',
          fecha: '',
        },
        show: true
      }
    },
    methods: {
      
      async enviarImagen(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post('http://localhost:3000/subir', fd)
          .then(res => {
            this.imagenes = [res.data]
            console.log(res.data)
          })
      },
      async enviarFormulario() {
      try {
        const res = await axios.post(
          "http://localhost:3000/evento",
          {
            titulo: this.nombre,
            descripcion: this.descripcion,
            lugar: this.lugar,
            imagen: `/images/${this.NombreImg()}`,
            id_iglesia: 1
          }
        );
        console.log(res.data)
      } catch (e) {
        console.error(e);
      }
    },
      NombreImg(){
        let nombre = this.imagenes[0];
        console.log(nombre.filename);
        this.exito = 'imagen guardada';
        return nombre.filename
      },
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