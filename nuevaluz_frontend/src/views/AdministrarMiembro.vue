<template>
  <div>
    <div id="miembros">
      <div class="container">
        <div id="registrar " class="row justify-content-center">
          <div class="col-sm-6">
            <h1>Registrar Miembro</h1>
            <b-form @submit="onSubmit" v-if="show" >
              <b-form-group id="input-group-1" label="Potada del evento" label-for="input-1">
                <b-form-file
                  v-model="file"
                  :state="Boolean(file)"
                  placeholder="Ingresa Imagen"
                  drop-placeholder="Drop file here..."
                ></b-form-file>
              </b-form-group>

              <b-form-group id="input-group-1" label-for="input-1">
                <b-form inline>
                  <b-input v-model="form.imagen" disabled></b-input>
                  <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                </b-form>
              </b-form-group>

              <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
                <b-form-input
                  id="input-1"
                  v-model="form.nombre"
                  required
                  placeholder="Ingresa un nombre"
                ></b-form-input>
              </b-form-group>

              <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
                <b-form-textarea
                  id="textarea-formatter"
                  v-model="form.descripcion"
                  placeholder="Ingresa la descripcion"
                  required
                ></b-form-textarea>
              </b-form-group>

              <b-form-group id="input-group-1" label="Lugar del evento" label-for="input-1">
                <b-form-input
                  id="input-1"
                  v-model="form.lugar"
                  required
                  placeholder="Ingresa el lugar"
                ></b-form-input>
              </b-form-group>

              <div class="form-group">
                <label>Fecha del evento</label>
                <input
                  v-model="form.fecha"
                  type="date"
                  name="bday"
                  min="1000-01-01"
                  max="3000-12-31"
                  class="form-control"
                />
              </div>

              <div class="mt-3">Selecciona una opcion: {{ file ? file.name : '' }}</div>
              <b-button type="submit" variant="primary">Submit</b-button>
            </b-form>
          </div>
        </div>
        <div id="actualizar row justify-content-center">
          <h1>Actualizar Miembro</h1>
          
        </div>
      </div>

      <!-- listar todos los miembros -->
      <div id="listar">
        <h1>Lista de Miembros</h1>
        <!-- {{miembros}} -->
        <div class="tableFixHead">
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Telefono</th>
                <th scope="col">Fecha Conversion</th>
                <th scope="col">Iglesia Conversion</th>
                <th scope="col">Fecha Bautizo</th>
                <th scope="col">Iglesia Bautizo</th>
                <th scope="col">Cargo</th>
                <th scope="col">Actualizar</th>
                <th scope="col">Eliminar</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(miembro,index) of miembros" :key="index">
                <td scope="row">{{miembro.nombre}}</td>
                <td scope="row">{{miembro.apellido_paterno}}</td>
                <td scope="row">{{miembro.apellido_materno}}</td>
                <td scope="row">{{miembro.telefono}}</td>
                <td scope="row">{{miembro.fecha_conversion}}</td>
                <td scope="row">{{miembro.iglesia_conversion}}</td>
                <td scope="row">{{miembro.fecha_bautizo}}</td>
                <td scope="row">{{miembro.iglesia_bautizo}}</td>
                <td scope="row">{{miembro.nombre_cargo}}</td>
                <td>
                  <button class="btn btn-warning" v-on:click="cargarDatos(miembro)">Modificar</button>
                </td>
                <td>
                  <button
                    class="btn btn-danger"
                    v-on:click="eliminarMiembro(miembro.id_miembro)"
                  >Eliminar</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
export default {
  data() {
    return {
      miembros: [],
      form: {
        id: "",
        nombre: "",
        descripcion: "",
        lugar: "",
        fecha: "",
        imagen: ""
      },
      show: true
    };
  },
  computed: {
    ...mapState(["url"])
  },
  created() {
    this.obtenerMiembros();
  },
  methods: {
    async obtenerMiembros() {
      try {
        const respuesta = await axios.get(this.url + "/listaMiembros");
        this.miembros = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api : ", error);
      }
    },
    onSubmit(evt) {
      evt.preventDefault();
      alert(JSON.stringify(this.form));
      this.enviarFormulario();
    }
  }
};
</script>

<style>
#miembros #listar .tableFixHead {
  overflow-y: auto;
  height: 500px;
}
#miembros #listar .tableFixHead thead th {
  position: sticky;
  top: 0;
}
</style>