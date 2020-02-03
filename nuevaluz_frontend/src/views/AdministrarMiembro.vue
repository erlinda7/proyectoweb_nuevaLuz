<template>
  <div>
    <div id="miembros">
      <div class="container">
        <div id="registrar row justify-content-center">
          <h1>Registrar Miembro</h1>
          <div class="col-sm-6">
            
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
      miembros: []
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