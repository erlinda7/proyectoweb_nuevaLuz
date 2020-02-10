<template>
  <div>
    <br />
    <div class="row">
      <div class="col-sm">
        <router-link to="/Login">
          <button
            style="float: right"
            class="btn btn-danger"
            v-on:click="cerrarSesion()"
          >Cerrar Sesion</button>
        </router-link>
        <router-link to="/Administrar">
          <button style="float: right" class="btn btn-primary">Atras</button>
        </router-link>
      </div>
    </div>
    <br />
    <div id="miembros">
      <div class="container">
        <!-- para registrar nuevo miembro v-show -->
        <div id="registrar" class="row justify-content-center" v-if="show">
          <div class="col-sm-6">
            <h1>Registrar Miembro</h1>
            <b-form @submit="onSubmit">
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

              <b-form-group
                id="input-group-0"
                label="Telefono o Celular"
                label-for="input-0"
                description="En caso de no contar colocar '0'"
              >
                <b-form-input
                  id="input-0"
                  v-model="form.telefono"
                  required
                  placeholder="Ingrese el telefono o celular del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-4" label="Estado Civil" label-for="input-4">
                <b-form-input
                  id="input-4"
                  v-model="form.estado_civil"
                  required
                  placeholder="Ingrese el Estado Civil del miembro"
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
                <b-form-select
                  v-model="form.cargo_lider"
                  name="selectCargo"
                  @change="cargoSeleccionado()"
                >
                  <option disabled>Seleccione una opción</option>
                  <option
                    v-for="(cargo,index) in cargos"
                    :key="index"
                    :value="cargo"
                  >{{cargo.nombre_cargo}}</option>
                </b-form-select>
              </b-form-group>
              <br />

              <!-- cuando selecciona cargo diferente de 'Ninguno' v-show -->
              <div class="cargo" v-if="gestion">
                <label class="colorTexto">Gestión del cargo seleccionado:</label>
                <br />
                <br />

                <!-- fecha_inicio -->
                <b-form-group
                  id="input-group-12"
                  label="Fecha Inicio del Cargo"
                  label-for="input-12"
                >
                  <input
                    v-model="form.fecha_inicio"
                    type="date"
                    name="bday"
                    min="1000-01-01"
                    max="3000-12-31"
                    class="form-control"
                  />
                </b-form-group>
                <br />

                <!-- fecha_fin -->
                <b-form-group id="input-group-12" label="Fecha Fin del Cargo" label-for="input-12">
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
              <div class="foto" v-if="mostrarInputFoto()">
                <label for>
                  <p class="colorTexto">Fotografía</p>
                </label>
                <b-form-group id="input-group-13" label-for="input-13">
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
                  description="La fotografia debe ser tipo '.png' fondo transparente de tamaño 1000x1000 pixeles 'medio cuerpo'"
                >
                  <b-form inline>
                    <b-input v-model="form.foto" required disabled></b-input>
                    <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                </b-form-group>
                <br />
              </div>
              <br />

              <b-button type="submit" variant="primary">Registrar Miembro</b-button>
            </b-form>
            <br />
            <br />
            <br />
            <!-- <b-card class="mt-3" header="Form Data Result">
              <pre class="m-0">{{ form }}</pre>
            </b-card>-->
          </div>
        </div>

        <!-- para actualizar miembros v-show -->
        <div id="actualizar" class="row justify-content-center" v-if="!show">
          <div class="col-sm-6">
            <br />
            <br />
            <h1>Actualizar Miembro</h1>
            <!--  -->
            <b-form @submit="onUpdate">
              <br />
              <b-form-group id="input-group-1" label="Nombre" label-for="input-1">
                <b-form-input
                  id="input-1"
                  v-model="miembro.nombre"
                  required
                  placeholder="Ingrese nombre del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-2" label="Apellido Paterno" label-for="input-2">
                <b-form-input
                  id="input-2"
                  v-model="miembro.apellido_paterno"
                  required
                  placeholder="Ingrese apellido paterno del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-3" label="Apellido Materno" label-for="input-3">
                <b-form-input
                  id="input-3"
                  v-model="miembro.apellido_materno"
                  required
                  placeholder="Ingrese apellido materno del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group
                id="input-group-4"
                label="Telefono o Celular"
                label-for="input-4"
                description="En caso de no contar colocar '0'"
              >
                <b-form-input
                  id="input-4"
                  v-model="miembro.telefono"
                  required
                  placeholder="Ingrese el telefono o celular del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <b-form-group id="input-group-5" label="Estado Civil" label-for="input-5">
                <b-form-input
                  id="input-5"
                  v-model="miembro.estado_civil"
                  required
                  placeholder="Ingrese el Estado Civil del miembro"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- fecha_nac -->
              <b-form-group
                id="input-group-5"
                label="Fecha de Nacimiento"
                label-for="input-5"
                description="formato de fecha requerida '2020-12-23'"
              >
                <b-form-input
                  id="input-5"
                  v-model="miembro.fecha_nac"
                  required
                  placeholder="Ingrese fecha"
                  min="1000-01-01"
                  max="3000-12-31"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- fecha_coversion -->
              <b-form-group
                id="input-group-6"
                label="Fecha de Conversión"
                label-for="input-6"
                description="formato de fecha requerida '2020-12-23'"
              >
                <b-form-input
                  id="input-6"
                  v-model="miembro.fecha_conversion"
                  required
                  placeholder="Ingrese fecha"
                  min="1000-01-01"
                  max="3000-12-31"
                ></b-form-input>
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
                  id="input-7"
                  v-model="miembro.iglesia_conversion"
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
                description="formato de fecha requerida '2020-12-23'"
              >
                <b-form-input
                  id="input-8"
                  v-model="miembro.fecha_bautizo"
                  required
                  placeholder="Ingrese fecha"
                  min="1000-01-01"
                  max="3000-12-31"
                ></b-form-input>
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
                  id="input-9"
                  v-model="miembro.iglesia_bautizo"
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
                  v-model="miembro.nom_completo_pastor_bautizo"
                  required
                  placeholder="Ingrese el nombre del pastor del bautizo"
                ></b-form-input>
              </b-form-group>
              <br />

              <!-- actualizar cargo  -->
              <div>
                <b-form-group id="input-group-11" label-for="input-11" label="Cargo">
                  <b-form inline>
                    <b-input v-model="inputCargo" disabled></b-input>
                    <b-button variant="primary" @click="cambiarCargo()">Modificar Cargo</b-button>
                  </b-form>
                </b-form-group>
              </div>

              <!-- nombre_cargo -->
              <div v-if="mostrarCargo">
                <b-form-group
                  id="input-group-12"
                  label="Seleccione Cargo"
                  label-for="input-12"
                  description="En caso de no contar seleccionar 'Ninguno'"
                >
                  <b-form-select
                    v-model="miembro.cargo_lider"
                    name="selectCargo"
                    @change="cargoSeleccionadoAct()"
                  >
                    <option disabled>Seleccione una opción</option>
                    <option
                      v-for="(cargoAct,index) in cargosAct"
                      :key="index"
                      :value="cargoAct"
                    >{{cargoAct.nombre_cargo}}</option>
                  </b-form-select>
                </b-form-group>
                <br />
              </div>

              <!-- cuando selecciona cargo diferente de 'Ninguno' v-show -->
              <div class="cargo" v-if="gestionAct">
                <label class="colorTexto">Gestión del cargo seleccionado:</label>
                <br />
                <br />

                <!-- fecha_inicio -->
                <b-form-group
                  id="input-group-16"
                  label="Fecha Inicio del Cargo"
                  label-for="input-16"
                  description="formato de fecha requerida '2020-12-23'"
                >
                  <b-form-input
                    id="input-16"
                    v-model="miembro.fecha_inicio"
                    required
                    placeholder="Ingrese fecha"
                    min="1000-01-01"
                    max="3000-12-31"
                  ></b-form-input>
                </b-form-group>
                <br />

                <!-- fecha_fin -->
                <b-form-group
                  id="input-group-17"
                  label="Fecha Fin del Cargo "
                  label-for="input-17"
                  description="formato de fecha requerida '2020-12-23'"
                >
                  <b-form-input
                    id="input-17"
                    v-model="miembro.fecha_fin"
                    required
                    placeholder="Ingrese fecha"
                    min="1000-01-01"
                    max="3000-12-31"
                  ></b-form-input>
                </b-form-group>
                <br />
              </div>

              <!-- cuando seleciona cargo pastor o anciano v-show -->
              <div class="foto" v-if="mostrardivFoto">
                <label for>
                  <p class="colorTexto">Fotografía</p>
                </label>
                <b-form-group id="input-group-15" label-for="input-15">
                  <b-form-file
                    v-model="file"
                    :state="Boolean(file)"
                    placeholder="Seleccionar Foto"
                    drop-placeholder="Drop file here..."
                  ></b-form-file>
                </b-form-group>

                <b-form-group
                  id="input-group-16"
                  label-for="input-16"
                  description="La fotografia debe ser tipo '.png' fondo transparente de tamaño 1000x1000 pixeles  'medio cuerpo'"
                >
                  <b-form inline>
                    <b-input v-model="miembro.foto" required disabled></b-input>
                    <b-button variant="primary" v-on:click="actualizarFoto()">Guardar Imagen</b-button>
                  </b-form>
                </b-form-group>
                <br />
              </div>
              <br />

              <b-button type="submit" variant="primary">Actualizar Miembro</b-button>
            </b-form>
            <br />
            <br />
            <!-- <b-card class="mt-3" header="Form Data Result">
              <pre class="m-0">{{ miembro }}</pre>
            </b-card>-->
          </div>
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
                  <b-button variant="danger" id="show-btn" @click="showModal(index)">Eliminar</b-button>
                  <b-modal :ref="'modal_'+index" hide-footer title="Seguro de Eliminar al Miembro:">
                    <div class="d-block text-center">
                      <h3>{{miembro.nombre}} {{miembro.apellido_paterno}} {{miembro.apellido_materno}}</h3>
                    </div>
                    <b-button
                      class="mt-3"
                      variant="danger"
                      block
                      @click="eliminarMiembro(miembro.id_miembro, index)"
                    >Eliminar</b-button>
                    <b-button
                      class="mt-3"
                      variant="primary"
                      block
                      @click="hideModal(index)"
                    >Cancelar</b-button>
                  </b-modal>
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
import router from "../router/index";

export default {
  data() {
    return {
      gestion: false,
      gestionAct: false,
      mostrarCargo: false,
      file: null,
      miembros: [],
      cargos: [],
      cargosAct: [],
      form: {
        id: 0,
        nombre: "",
        apellido_paterno: "",
        apellido_materno: "",
        telefono: "",
        estado_civil: "",
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
      miembro: {
        id_miembro: 0,
        nombre: "",
        apellido_paterno: "",
        apellido_materno: "",
        telefono: "",
        estado_civil: "",
        fecha_nac: "",
        fecha_conversion: "",
        iglesia_conversion: "",
        fecha_bautizo: "",
        iglesia_bautizo: "",
        nom_completo_pastor_bautizo: "",
        cargo_lider: {},
        id_gestion_cargo: 0,
        fecha_inicio: "",
        fecha_fin: "",
        id_fotografia: 0,
        foto: ""
      },
      mostrardivFoto: false,
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
    showModal(index) {
      let modal_id = "modal_" + index;
      this.$refs[modal_id][0].show();
    },
    hideModal(index) {
      let modal_id = "modal_" + index;
      this.$refs[modal_id][0].hide();
    },
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
        this.cargosAct = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api : ", error);
      }
    },

    async enviarImagen() {
      const fd = new FormData();
      fd.append("file", this.file);
      axios.post(this.url + "/subir", fd).then(res => {
        this.form.foto = "/images/" + res.data.filename;
        console.log(res.data);
      });
      alert("Foto guardada");
    },

    async enviarFormulario() {
      try {
        const res = await axios.post(this.url + "/miembro", {
          nombre: this.form.nombre,
          apellido_paterno: this.form.apellido_paterno,
          apellido_materno: this.form.apellido_materno,
          telefono: this.form.telefono,
          estado_civil: this.form.estado_civil,
          fecha_nac: this.form.fecha_nac,
          fecha_conversion: this.form.fecha_conversion,
          iglesia_conversion: this.form.iglesia_conversion,
          fecha_bautizo: this.form.fecha_bautizo,
          iglesia_bautizo: this.form.iglesia_bautizo,
          nom_completo_pastor_bautizo: this.form.nom_completo_pastor_bautizo,
          id_cargo_lider: this.form.cargo_lider.id_cargo_lider
        });
        console.log(res.data.id_miembro);

        let c = this.form.cargo_lider.nombre_cargo;
        if (c != "Ninguno") {
          this.datosGestionCargo(res.data.id);
        }
        if (c == "Pastor") {
          this.datosFotografia(res.data.id);
        } else {
          if (c == "Anciano") {
            this.datosFotografia(res.data.id);
          }
        }
        this.file = "";
        this.form.nombre = "";
        this.form.apellido_paterno = "";
        this.form.apellido_materno = "";
        this.form.telefono = "";
        this.form.estado_civil = "";
        this.form.fecha_nac = "";
        this.form.fecha_conversion = "";
        this.form.iglesia_conversion = "";
        this.form.fecha_bautizo = "";
        this.form.iglesia_bautizo = "";
        this.form.nom_completo_pastor_bautizo = "";
        this.form.fecha_inicio = "";
        this.form.fecha_fin = "";
        this.form.foto = "";

        this.obtenerMiembros();
        alert("Miembro Creado Exitosamente");
      } catch (e) {
        console.error(e);
      }
    },

    //para enviar en lformulario datos de la tabla gestion_cargo
    async datosGestionCargo(id_m) {
      try {
        const resgc = await axios.post(this.url + "/miembroGestionCargo", {
          fecha_inicio: this.form.fecha_inicio,
          fecha_fin: this.form.fecha_fin,
          id_miembro: id_m
        });
        console.log(resgc.data);

      } catch (e) {
        console.error(e);
      }
    },
    //para enviar en lformulario datos de la tabla fotografia
    async datosFotografia(id_m) {
      try {
        const resf = await axios.post(this.url + "/miembroFotografia", {
          foto: this.form.foto,
          id_miembro: id_m
        });
        console.log(resf.data);

      } catch (e) {
        console.error(e);
      }
    },
    //para v-show gestion cargo
    cargoSeleccionado() {
      let car = this.form.cargo_lider;
      if (car.nombre_cargo == "Ninguno") {
        this.gestion = false;
      }
      if (car.nombre_cargo != "Ninguno") {
        this.gestion = true;
      }
      console.log(this.form.cargo_lider.id_cargo_lider);
    },
    //para v-show fotografia
    mostrarInputFoto() {
      let car = this.form.cargo_lider;
      if (car.nombre_cargo == "Pastor") {
        return true;
      } else {
        if (car.nombre_cargo == "Anciano") {
          return true;
        } else {
          return false;
        }
      }
    },
    cerrarSesion() {
      //console.log('cerrarSesion');
      router.app.$auth.token(false);
    },
    //para registrar miembro post
    onSubmit(evt) {
      evt.preventDefault();
      this.enviarFormulario();
    },
    //actualizar miembro---------------------------------------------
    cargarDatos(m) {
      this.show = false;
      //miembro

      this.miembro.id_miembro = m.id_miembro;
      this.miembro.nombre = m.nombre;
      this.miembro.apellido_paterno = m.apellido_paterno;
      this.miembro.apellido_materno = m.apellido_materno;
      this.miembro.telefono = m.telefono;
      this.miembro.estado_civil = m.estado_civil;
      this.miembro.fecha_nac = m.fecha_nac;
      this.miembro.fecha_conversion = m.fecha_conversion;
      this.miembro.iglesia_conversion = m.iglesia_conversion;
      this.miembro.fecha_bautizo = m.fecha_bautizo;
      this.miembro.iglesia_bautizo = m.iglesia_bautizo;
      this.miembro.nom_completo_pastor_bautizo = m.nom_completo_pastor_bautizo;
      this.miembro.cargo_lider.id_cargo_lider = m.id_cargo_lider;
      this.miembro.cargo_lider.nombre_cargo = m.nombre_cargo;
      ///gestion cargo +id_miembro
      this.miembro.id_gestion_cargo = m.id_gestion_cargo;
      this.miembro.fecha_inicio = m.fecha_inicio;
      this.miembro.fecha_fin = m.fecha_fin;
      //fotografia + id_miembro
      this.miembro.id_fotografia = m.id_fotografia;
      this.miembro.foto = m.foto;

      //--
      this.inputCargo = "Cargo Actual : " + m.nombre_cargo;
      this.gestionAct = false;
    },
    cambiarCargo() {
      this.mostrarCargo = true;
    },
    cargoSeleccionadoAct() {
      let car = this.miembro.cargo_lider;
      if (car.nombre_cargo == "Ninguno") {
        this.gestionAct = false;
      }
      if (car.nombre_cargo != "Ninguno") {
        this.gestionAct = true;
      }
      console.log(this.miembro.cargo_lider.id_cargo_lider);
      this.mostrarInputFotoAct();
    },
    mostrarInputFotoAct() {
      let car = this.miembro.cargo_lider;
      if (car.nombre_cargo == "Pastor") {
        this.mostrardivFoto = true;
      } else {
        if (car.nombre_cargo == "Anciano") {
          this.mostrardivFoto = true;
        } else {
          this.mostrardivFoto = false;
        }
      }
    },
    async actualizarFormulario() {
      try {
        await axios.put(this.url + "/miembro/" + this.miembro.id_miembro, {
          nombre: this.miembro.nombre,
          apellido_paterno: this.miembro.apellido_paterno,
          apellido_materno: this.miembro.apellido_materno,
          telefono: this.miembro.telefono,
          estado_civil: this.miembro.estado_civil,
          fecha_nac: this.miembro.fecha_nac,
          fecha_conversion: this.miembro.fecha_conversion,
          iglesia_conversion: this.miembro.iglesia_conversion,
          fecha_bautizo: this.miembro.fecha_bautizo,
          iglesia_bautizo: this.miembro.iglesia_bautizo,
          nom_completo_pastor_bautizo: this.miembro.nom_completo_pastor_bautizo,
          id_cargo_lider: this.miembro.cargo_lider.id_cargo_lider
        });
          console.log('cargo actual: ', );
          
        //----------------------------------------
        let ca = this.miembro.cargo_lider.nombre_cargo;
        if (ca != "Ninguno") {
          //console.log(this.miembro.id_gestion_cargo , 'id_gestion cargo');
          
          if(this.miembro.id_gestion_cargo > 0 ){
            this.actualizarGestionCargo();
          }else{
            this.datosGestionCargoCrearAct(this.miembro.id_miembro)
          }
          
        }
        if (ca == "Pastor") {
          if(this.miembro.id_fotografia > 0){
            this.actualizarFotografia();
          }else{
            this.datosFotografiaCrearAct(this.miembro.id_miembro)
          }
          
        } else {
          if (ca == "Anciano") {
            if(this.miembro.id_fotografia > 0){
              this.actualizarFotografia();
            }else{
              this.datosFotografiaCrearAct(this.miembro.id_miembro)
            }
            
          }
        }
        //---------------------------------------------
        this.obtenerMiembros();
      } catch (e) {
        console.error(e);
      }
    },
    async datosGestionCargoCrearAct(id_m) {
      try {
        const resgc = await axios.post(this.url + "/miembroGestionCargo", {
          fecha_inicio: this.miembro.fecha_inicio,
          fecha_fin: this.miembro.fecha_fin,
          id_miembro: id_m
        });
        console.log(resgc.data);

      } catch (e) {
        console.error(e);
      }
    },
    async datosFotografiaCrearAct(id_m) {
      try {
        const resf = await axios.post(this.url + "/miembroFotografia", {
          foto: this.miembro.foto,
          id_miembro: id_m
        });
        console.log(resf.data);

      } catch (e) {
        console.error(e);
      }
    },
    async actualizarGestionCargo() {
      try {
        await axios.put(
          this.url + "/miembroGestionCargo/" + this.miembro.id_gestion_cargo,
          {
            fecha_inicio: this.miembro.fecha_inicio,
            fecha_fin: this.miembro.fecha_fin,
            id_miembro: this.miembro.id_miembro
          }
        );
        //this.actualizarFotografia();
        // alert('Miembro actualizado')
      } catch (e) {
        console.error(e);
      }
    },
    async actualizarFotografia() {
      try {
        await axios.put(
          this.url + "/miembroFotografia/" + this.miembro.id_fotografia,
          {
            foto: this.miembro.foto,
            id_miembro: this.miembro.id_miembro
          }
        );
      //  this.obtenerMiembros();
        // alert('Miembro actualizado')
        this.show = true;
      } catch (e) {
        console.error(e);
      }
    },
    async actualizarFoto() {
      const fd = new FormData();
      fd.append("file", this.file);
      axios.post(this.url + "/subir", fd).then(res => {
        this.miembro.foto = "/images/" + res.data.filename;
        console.log(res.data);
      });
      alert("Foto actualizada");
    },
    onUpdate(evt) {
      evt.preventDefault();
      this.actualizarFormulario();
      this.obtenerMiembros();
      this.show=true;
      alert("Miembro Actualizado Exitosamente");
    },
    async eliminarMiembro(id,index) {
      try {
        await axios.delete(this.url + "/miembro/" + id);
        this.obtenerMiembros();
        // alert('Miembro eliminado')
        this.hideModal(index)  //para eliminar uno solo y aparesca una sola vez
      } catch (error) {
        console.log(error);
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
#miembros .colorTexto {
  color: blue;
}
</style>