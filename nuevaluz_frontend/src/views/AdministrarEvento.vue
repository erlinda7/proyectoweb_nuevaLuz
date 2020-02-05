<template>
  <div class="container">
      <br>
      <div class="row">
        <div class="col-sm">
          <router-link to="/AdministrarMiembro"><button class="btn btn-primary">Ir al formulario de Miembro</button></router-link>
        </div>
        <div class="col-sm">
          <router-link to="/AdministrarMinisterio"><button class="btn btn-primary">Ir al formulario de Ministerio</button></router-link>
        </div>
      </div>
      <br>
    <!--FORMULARIO PARA CREAR EVENTO-->
    <div class="row justify-content-center">
      <div class="col-sm-6">
        <b-form @submit="onSubmit" v-if="show">
          <h1>Registrar Evento</h1>
          <b-form-group id="input-group-3" label="Potada del evento" label-for="input-3">
            <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
            </b-form-file>
          </b-form-group>

          <b-form-group id="input-group-3" label-for="input-3">
            <b-form inline>
              <b-input v-model="form.imagen" disabled></b-input>
              <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
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

            <b-button type="submit" variant="primary">Submit</b-button>
        </b-form>
        
      </div>
    </div>
    <div>
      <!--FORMULARIO DE MODIFICACION DE EVENTO-->
      <div class="row justify-content-center">
      <div class="col-sm-6">
        <b-form @submit="onUpdate" v-if="!show">
            <h1>Actualizar Evento</h1>
          <b-form-group id="input-group-3" label="Potada del evento" label-for="input-3">
            <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
            </b-form-file>
          </b-form-group>

          <b-form-group id="input-group-3" label-for="input-3">
            <b-form inline>
              <b-input v-model="evento.imagen" disabled></b-input>
              <b-button variant="primary" v-on:click="actualizarImagen()">Guardar Imagen</b-button>
            </b-form>
          </b-form-group>
      
          <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
            <b-form-input id="input-1" v-model="evento.titulo" required placeholder="Ingresa un nombre">
            </b-form-input>
          </b-form-group>

          <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
            <b-form-textarea id="textarea-formatter" v-model="evento.descripcion" placeholder="Ingresa la descripcion" required>
            </b-form-textarea>
          </b-form-group>

          <b-form-group id="input-group-2" label="Lugar del evento" label-for="input-2">
            <b-form-input id="input-2" v-model="evento.lugar" required placeholder="Ingresa el lugar">
            </b-form-input>
          </b-form-group>
    
          <div class="form-group">
            <label >Fecha del evento</label>
            <input v-model="evento.fecha" min="1000-01-01" max="3000-12-31" class="form-control">
          </div>
  
          <div class="mt-3">Selecciona una opcion: {{ file ? file.name : '' }}</div>
            <b-button type="update" variant="primary">Actualizar</b-button>
        </b-form>
        <!-- <b-card class="mt-3" header="Form Data Result">
          <pre class="m-0">{{ evento }}</pre>
        </b-card> -->
      </div>
    </div>
    <!--LISTA DE EVENTOS-->
    </div>
    <h1>Lista de Eventos</h1>
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
          <tr v-for="(evento,index) of eventos" :key="index">
            <th scope="row">{{evento.titulo}}</th>
            <td><button class="btn btn-warning" v-on:click="cargarDatos(evento)" >Modificar</button></td>
            <td><button class="btn btn-danger" v-on:click="eliminarEvento(evento.id_evento)" >Eliminar</button></td>
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
        form: {
          id: '',
          nombre: '',
          descripcion: '',
          lugar: '',
          fecha: '',
          imagen: ''
        },
        evento:{
          id_evento: 0,
          titulo: '',
          descripcion: '',
          lugar: '',
          fecha: '',
          imagen: '',
          id_iglesia: 1,
        },
        eventos: [],
        show: true
      }
    },
    computed: {
      ...mapState(['url'])
    },
    methods: {
      async obtenerevento() {
        try {
          const respuesta = await axios.get(this.url+"/evento");
          this.eventos = respuesta.data;
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
      async actualizarImagen(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.evento.imagen = '/images/'+res.data.filename
            console.log(res.data)
          })
      },
      async enviarFormulario() {
       try {
        const res = await axios.post(
          this.url+"/evento",
          {
            titulo: this.form.nombre,
            descripcion: this.form.descripcion,
            lugar: this.form.lugar,
            fecha: this.form.fecha,
            imagen: this.form.imagen,
            id_iglesia: 1
          }
        );
        this.obtenerevento()
        console.log(res.data)
       } catch (e) {
        console.error(e);
        }
      },
      async actualizarFormulario(){
       try { 
        await axios.put(
          this.url+"/evento/"+this.evento.id_evento,
          {
            titulo: this.evento.titulo,
            descripcion: this.evento.descripcion,
            lugar: this.evento.lugar,
            fecha: this.evento.fecha,
            imagen: this.evento.imagen,
            id_iglesia: 1
          }
        );
        this.obtenerevento()
       }catch (e){
         console.error(e);
       }  
    },
      async eliminarEvento(id){
        try {
          await axios.delete(this.url+'/evento/'+id);
          this.obtenerevento()
        } catch (error) {
          console.log(error);
        }
      },
      onSubmit(evt) {
        evt.preventDefault()
        alert(JSON.stringify(this.form))
        this.enviarFormulario();
      },
      onUpdate(evt) {
        evt.preventDefault()
        alert(JSON.stringify(this.evento))
        this.actualizarFormulario()
      },
      cargarDatos(event) {
        this.show = false;
        this.evento.id_evento = event.id_evento
        this.evento.titulo = event.titulo
        this.evento.descripcion = event.descripcion
        this.evento.lugar = event.lugar
        let fecha2= new Date(event.fecha.split("-").reverse().join())
        //let fecha2= new Date(event.fecha.replace(/ /g,""))
        this.evento.fecha = fecha2.getFullYear()+'-'+(fecha2.getMonth()+1)+'-'+fecha2.getDate()
        this.evento.imagen = event.imagen
        console.log(this.evento.id);
      }
    },
    created() {
        this.obtenerevento();
    },
  }
</script>

<style>
</style>