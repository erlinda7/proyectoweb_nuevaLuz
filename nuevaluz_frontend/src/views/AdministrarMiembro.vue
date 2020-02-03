<template>
  <div>
    <div id="miembros">
      <div class="container">
        <div id="registrar " class="row justify-content-center">
          <div class="col-sm-6">
            <br />
            <br />
            <h1>Registrar Miembro</h1>
            <b-form @submit="onSubmit" v-if="show">
              <br />
              <b-form-group id="input-group-1" label="Nombre" label-for="input-1">
                <b-form-input
                  id="input-1"
                  v-model="form.nombre"
                  required
                  placeholder="Ingrese nombre del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-2" label="Apellido Paterno" label-for="input-2">
                <b-form-input
                  id="input-2"
                  v-model="form.apellido_paterno"
                  required
                  placeholder="Ingrese apellido paterno del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-3" label="Apellido Materno" label-for="input-3">
                <b-form-input
                  id="input-3"
                  v-model="form.apellido_materno"
                  required
                  placeholder="Ingrese apellido materno del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- telefono -->
              <b-form-group
                id="input-group-4"
                label="Telefono o Celular"
                label-for="input-4"
                description="En caso de no contar colocar '0'"
              >
                <b-form-input
                  id="input-4"
                  v-model="form.telefono"
                  required
                  placeholder="Ingrese el telefono o celular materno del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- fecha_nac -->
              <b-form-group
                id="input-group-5"
                label="Fecha de Nacimiento"
                label-for="input-5"
                description="En caso de no contar con la fecha colocar '01/01/0001'"
              >
                <input
                  v-model="form.fecha_nac"
                  type="date"
                  name="bday"
                  min="1000-01-01"
                  max="3000-12-31"
                  class="form-control"
                />
              </b-form-group>
              <br />

              <!-- fecha_coversion -->
              <b-form-group
                id="input-group-6"
                label="Fecha de Conversión"
                label-for="input-6"
                description="En caso de no contar con la fecha colocar '01/01/0001'"
              >
                <input
                  v-model="form.fecha_conversion"
                  type="date"
                  name="bday"
                  min="1000-01-01"
                  max="3000-12-31"
                  class="form-control"
                />
              </b-form-group>
              <br />

              <!-- iglesia_conversion -->
              <b-form-group
                id="input-group-7"
                label="Iglesia de Conversión"
                label-for="input-7"
                description="En caso de recordar colocar 'pendiente'"
              >
                <b-form-input
                  id="input-5"
                  v-model="form.iglesia_conversion"
                  required
                  placeholder="Ingresa la iglesia de conversión"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- fecha_bautizo -->
              <b-form-group
                id="input-group-8"
                label="Fecha de Bautizo"
                label-for="input-8"
                description="En caso de no contar con la fecha colocar '01/01/0001'"
              >
                <input
                  v-model="form.fecha_bautizo"
                  type="date"
                  name="bday"
                  min="1000-01-01"
                  max="3000-12-31"
                  class="form-control"
                />
              </b-form-group>
              <br />

              <!-- iglesia_bautizo -->
              <b-form-group
                id="input-group-9"
                label="Iglesia de Bautizo"
                label-for="input-9"
                description="En caso de recordar colocar 'pendiente'"
              >
                <b-form-input
                  id="input-6"
                  v-model="form.iglesia_bautizo"
                  required
                  placeholder="Ingresa la iglesia de Bautizo"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- nom_completo_pastor_bautizo -->
              <b-form-group
                id="input-group-10"
                label="Nombre del Pastor de bautizo"
                label-for="input-10"
                description="En caso de recordar colocar 'pendiente'"
              >
                <b-form-input
                  id="input-10"
                  v-model="form.nom_completo_pastor_bautizo"
                  required
                  placeholder="Ingrese el nombre del pastor del bautizo"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- nombre_cargo -->
              <b-form-group
                id="input-group-11"
                label="Seleccione Cargo"
                label-for="input-11"
                description="En caso de no contar seleccionar 'Ninguno'"
              >
                <b-form-select v-model="form.cargo_lider" name="selectCargo" @change="cargoSeleccionado()">
                  <option disabled>Seleccione una opción</option>
                  <option
                    v-for="(cargo,index) in cargos"
                    :key="index"
                    :value="cargo"

                  >{{cargo.nombre_cargo}}</option>
                </b-form-select>
              </b-form-group>
 
              <!-- cuando selecciona cargo diferente de 'Ninguno' v-show -->
              <div class="cargo" v-if="gestion">
                <label for>Gestión del cargo seleccionado:</label>
                <!-- fecha_inicio -->
                <b-form-group id="input-group-12" label="Fecha Inicio" label-for="input-12">
                  <input
                    v-model="form.fecha_inicio"
                    type="date"
                    name="bday"
                    min="1000-01-01"
                    max="3000-12-31"
                    class="form-control"
                  />
                </b-form-group>
                <!-- fecha_fin -->
                <b-form-group id="input-group-12" label="Fecha Fin" label-for="input-12">
                  <input
                    v-model="form.fecha_fin"
                    type="date"
                    name="bday"
                    min="1000-01-01"
                    max="3000-12-31"
                    class="form-control"
                  />
                </b-form-group>
                <br />
              </div>

              <!-- cuando seleciona cargo pastor o anciano v-show -->
              <div class="foto">
                <b-form-group id="input-group-13" label="Fotografía" label-for="input-13">
                  <b-form-file
                    v-model="file"
                    :state="Boolean(file)"
                    placeholder="Seleccionar Foto"
                    drop-placeholder="Drop file here..."
                  ></b-form-file>
                </b-form-group>

                <b-form-group
                  id="input-group-14"
                  label-for="input-14"
                  description="La fotografia debe ser tipo '.png' fondo transparente de tamaño 1000x1000"
                >
                  <b-form inline>
                    <b-input v-model="form.foto" disabled></b-input>
                    <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                </b-form-group>
              </div>

              <b-button type="submit" variant="primary">Registrar</b-button>
            </b-form>

            <b-card class="mt-3" header="Form Data Result">
              <pre class="m-0">{{ form }}</pre>
            </b-card>
          </div>
        </div>

        <!-- para actualizar miembros v-show -->
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
      gestion:false,
      file: null,
      miembros: [],
      cargos: [],
      form: {
        id: 0,
        nombre: "",
        apellido_paterno: "",
        apellido_materno: "",
        telefono: "",
        fecha_nac: "",
        fecha_conversion: "",
        iglesia_conversion: "",
        fecha_bautizo: "",
        iglesia_bautizo: "",
        nom_completo_pastor_bautizo: "",
        cargo_lider: {},
        fecha_inicio: "",
        fecha_fin: "",
        foto: ""
      },
      show: true
    };
  },
  computed: {
    ...mapState(["url"])
  },
  created() {
    this.obtenerMiembros();
    this.obtenerCargos();
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
    async obtenerCargos() {
      try {
        const respuesta = await axios.get(this.url + "/listaCargoLider");
        this.cargos = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api : ", error);
      }
    },
    cargoSeleccionado() {
       
      this.gestion=true
      
    },
   
    onSubmit(evt) {
      evt.preventDefault();
      alert(JSON.stringify(this.form));
      // this.enviarFormulario();
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

#miembros .cargo{
  border: 1px black dashed;
  padding: 10px;
}
</style>