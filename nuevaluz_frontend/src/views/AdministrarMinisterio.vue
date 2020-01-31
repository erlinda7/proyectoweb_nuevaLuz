<template>
  <div class="container">
      <br>
      <h5>Gestionar Ministerio</h5>
      {{form}}
      <br>
      <br>
      <!--Formulario de Creacion de Nuevo Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onSubmit" v-if="show">
                  <b-form-group id="input-group-1" label="Imagen de Ministerio" label-for="input-1">
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-2" label-for="input-2">
                    <b-form inline>
                      <b-form-input v-model="form.imagen" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-3" label="Foto del Responsable" label-for="input-3">
                    <b-form-file  v-model="file2" :state="Boolean(file)" placeholder="Ingresa foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-4" label-for="input-4">
                    <b-form inline>
                      <b-form-input v-model="form.foto" disabled></b-form-input>
                      <b-button variant="primary" v-on:click="enviarFoto()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-5" label="Nombre del Ministerio" label-for="input-5">
                    <b-form-input id="input-5" v-model="form.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-6" label="Lema del ministerio" label-for="input-6" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-6" v-model="form.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   

                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="form.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>

                  <b-form-group id="input-group-7" label="Ubicacion del ministerio" label-for="input-7">
                    <b-form-input id="input-7" v-model="form.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  
                  <b-form-group id="input-group-8" label="Nombre completo del Responsable" label-for="input-8">
                    <b-form-input id="input-8" v-model="form.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-9" label="E-mail del Responsable" label-for="input-9" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-9" v-model="form.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-10" label="Telefono o Celular del Responsable" label-for="input-10">
                    <b-form-input id="input-10" v-model="form.telefono" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>

                  <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div>
                    <b-button type="submit" variant="primary">Crear Ministerio</b-button>
              </b-form>
          </div>
      </div>
      <!--Formulario de Modificacion de Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onSubmit" v-if="!show">
                  <b-form-group id="input-group-11" label="Imagen de Ministerio" label-for="input-11">
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-12" label-for="input-12">
                    <b-form inline>
                      <b-form-input v-model="ministerio.imagen" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-13" label="Foto del Responsable" label-for="input-13">
                    <b-form-file  v-model="file2" :state="Boolean(file)" placeholder="Ingresa foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-14" label-for="input-14">
                    <b-form inline>
                      <b-form-input v-model="ministerio.foto" disabled></b-form-input>
                      <b-button variant="primary" v-on:click="enviarFoto()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-15" label="Nombre del Ministerio" label-for="input-15">
                    <b-form-input id="input-15" v-model="ministerio.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-16" label="Lema del ministerio" label-for="input-16" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-16" v-model="ministerio.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   

                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="ministerio.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>

                  <b-form-group id="input-group-17" label="Ubicacion del ministerio" label-for="input-17">
                    <b-form-input id="input-17" v-model="ministerio.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  
                  <b-form-group id="input-group-18" label="Nombre completo del Responsable" label-for="input-18">
                    <b-form-input id="input-18" v-model="ministerio.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-19" label="E-mail del Responsable" label-for="input-19" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-19" v-model="ministerio.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-20" label="Telefono o Celular del Responsable" label-for="input-20">
                    <b-form-input id="input-20" v-model="ministerio.telefono" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>

                  <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div>
                    <b-button type="submit" variant="primary">Crear Ministerio</b-button>
              </b-form>
          </div>
      </div>
      <b-card class="mt-3" header="Form Data Result">
          <pre class="m-0">{{ form }}</pre>
        </b-card>
      <!--Lista de Ministerios-->
      <div>
          <h5>Lista de Ministerios</h5>
      </div>
      <div>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Actualizar</th>
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(ministerio,index) of ministerios" :key="index">
            <th scope="row">{{ministerio.nombre}}</th>
            <td><button class="btn btn-warning" v-on:click="cargarDatos(ministerio)" >Modificar</button></td>
            <td><button class="btn btn-danger" v-on:click="eliminarEvento(ministerio.id_ministerio)" >Eliminar</button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import {mapState} from 'vuex'

export default {
    data() {
      return {
        file: null,
        file2: null,
        form: {
          nombre: '',
          lema:'',
          descripcion: '',
          lugar: '',
          responsable: '',
          email:'',
          telefono:'',
          imagen: '',
          foto: ''
        },
        ministerio:{
          id_ministerio: 0,
          nombre: '',
          lema:'',
          descripcion: '',
          lugar: '',
          responsable: '',
          email:'',
          telefono:'',
          foto:'',
          imagen: '',
          id_iglesia: 1
        },
        ministerios: [],
        show: true
      }
    },
    computed:{
        ...mapState(['url'])
    },
    methods: {
        async obtenerministerio() {
        try {
          const respuesta = await axios.get(this.url+"/ministerio");
          this.ministerios = respuesta.data;
        } catch (error) {
          console.log("error al conectar al api: ", error);
        }
      },
        async enviarImagen(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.form.imagen = '/images/'+res.data.filename
            console.log(res.data)
          })
      },
        async enviarFoto(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.form.foto = '/images/'+res.data.filename
            console.log(res.data)
          })
      },
      async enviarFormulario() {
       try {
        const res = await axios.post(
          this.url+"/ministerio",
          {
            nombre: this.form.nombre,
            descripcion_corta: this.form.lema,
            descripcion: this.form.descripcion,
            lugar: this.form.lugar,
            nombre_responsable: this.form.responsable,
            email: this.form.email,
            telefono: this.form.telefono,
            foto: this.form.foto,
            imagen: this.form.imagen,
            id_iglesia: 1
          }
        );
        this.obtenerministerio();
        console.log(res.data)
       } catch (e) {
        console.error(e);
        }
      },
        onSubmit(evt) {

        evt.preventDefault()
        alert(JSON.stringify(this.form))
        this.enviarFormulario();
      },
    },
    created() {
        this.obtenerministerio();
    },
}
</script>

<style>

</style>