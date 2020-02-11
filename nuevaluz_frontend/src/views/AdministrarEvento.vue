<template>
  <div class="container">
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
    <!--FORMULARIO PARA CREAR EVENTO-->
    <div class="row justify-content-center">
      <div class="col-sm-6">
        <b-form @submit="onSubmit" v-if="show" >
          <h1>Registrar Evento</h1>
          <br><br>
          <b-form-group id="input-group-3" label="Portada del evento" label-for="input-3" >
            <b-form-file
              v-model="file"
              :state="Boolean(file)"
              placeholder="Selecciona Imagen"
              drop-placeholder="Drop file here..."
            ></b-form-file>
          </b-form-group>
      
          <b-form-group id="input-group-3" label-for="input-3" description="Debe seleccionar el afiche del aevento">
            <b-form inline>
              <b-input v-model="form.imagen" disabled></b-input>
              <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
            </b-form>
          </b-form-group>
            <br>
          <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
            <b-form-input
              id="input-1"
              v-model="form.nombre"
              required
              placeholder="Ingresa un nombre"
            ></b-form-input>
          </b-form-group>
          <br>
          <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
            <b-form-textarea
              id="textarea-formatter"
              v-model="form.descripcion"
              placeholder="Ingresa la descripcion"
              required
            ></b-form-textarea>
          </b-form-group>
          <br>
          <b-form-group id="input-group-2" label="Lugar del evento" label-for="input-2">
            <b-form-input id="input-2" v-model="form.lugar" required placeholder="Ingresa el lugar"></b-form-input>
          </b-form-group>
          <br>
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
            <br>
          <b-button type="submit" variant="primary">Crear Evento</b-button>
        </b-form>
        <br><br>
      </div>
    </div>
    <div>
      <!--FORMULARIO DE MODIFICACION DE EVENTO-->
      <div class="row justify-content-center">
        <div class="col-sm-6">
          <b-form @submit="onUpdate" v-if="!show">
            <h1>Actualizar Evento</h1>
            <br><br>
            <b-form-group id="input-group-3" label="Portada del evento" label-for="input-3">
              <b-form-file
                v-model="file"
                :state="Boolean(file)"
                placeholder="Selecciona  Imagen"
                drop-placeholder="Drop file here..."
              ></b-form-file>
            </b-form-group>
            
            <b-form-group id="input-group-3" label-for="input-3" description="Debe seleccionar el afiche del evento">
              <b-form inline>
                <b-input v-model="evento.imagen" disabled></b-input>
                <b-button variant="primary" v-on:click="actualizarImagen()">Guardar Imagen</b-button>
              </b-form>
            </b-form-group>
            <br>
            <b-form-group id="input-group-1" label="Nombre del evento:" label-for="input-1">
              <b-form-input
                id="input-1"
                v-model="evento.titulo"
                required
                placeholder="Ingresa un nombre"
              ></b-form-input>
            </b-form-group>
              <br>
            <b-form-group label="Descripcion del evento" label-for="textarea-formatter">
              <b-form-textarea
                id="textarea-formatter"
                v-model="evento.descripcion"
                placeholder="Ingresa la descripcion"
                required
              ></b-form-textarea>
            </b-form-group>
              <br>
            <b-form-group id="input-group-2" label="Lugar del evento" label-for="input-2">
              <b-form-input
                id="input-2"
                v-model="evento.lugar"
                required
                placeholder="Ingresa el lugar"
              ></b-form-input>
            </b-form-group>
              <br>
            <div class="form-group">
              <label>Fecha del evento</label>
              <input v-model="evento.fecha" min="1000-01-01" max="3000-12-31" class="form-control" />
            </div>
            <br>
            <!-- <div class="mt-3">Selecciona una opcion: {{ file ? file.name : '' }}</div> -->
            <b-button type="update" variant="primary">Actualizar Evento</b-button>
          </b-form>
          <br><br>
          <!-- <b-card class="mt-3" header="Form Data Result">
          <pre class="m-0">{{ evento }}</pre>
          </b-card>-->
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
            <td>
              <button class="btn btn-warning" v-on:click="cargarDatos(evento)">Modificar</button>
            </td>
            <td>
              <b-button variant="danger" id="show-btn" @click="showModal(index)">Eliminar</b-button>
              <b-modal :ref="'modal_'+index" hide-footer title="Seguro de Eliminar el Evento:">
                <div class="d-block text-center">
                  <h3>{{evento.titulo}}</h3>
                </div>
                <b-button
                  class="mt-3"
                  variant="danger"
                  block
                  @click="eliminarEvento(evento.id_evento, index)"
                >Eliminar</b-button>
                <b-button class="mt-3" variant="primary" block @click="hideModal(index)">Cancelar</b-button>
              </b-modal>
            </td>
            <!-- <td><button class="btn btn-danger" v-on:click="eliminarEvento(evento.id_evento)" >Eliminar</button></td> -->
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import {mapState} from 'vuex'
import router from "../router/index";

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
      showModal(index) {
        let modal_id = "modal_"+index
        this.$refs[modal_id][0].show()
      },
      hideModal(index) {
        let modal_id = "modal_"+index
        this.$refs[modal_id][0].hide()
      },
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
          alert('Imagen guardada')
      },
      async actualizarImagen(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.evento.imagen = '/images/'+res.data.filename
            console.log(res.data)
          })
          alert('Imagen actualizada')
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
          this.file=""
          this.form.nombre= ""
          this.form.descripcion= ""
          this.form.lugar= ""
          this.form.fecha= ""
          this.form.imagen= ""
          alert('Evento Creado')
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
      async eliminarEvento(id, index){
        try {
          await axios.delete(this.url+'/evento/'+id);
          this.obtenerevento()
         // alert('Evento Eliminado')
         this.hideModal(index) 
        } catch (error) {
          console.log(error);
        }
      },
      onSubmit(evt) {
        evt.preventDefault()
        alert('Evento Creado Exitosamente')
        this.enviarFormulario();

      },
      onUpdate(evt) {
        evt.preventDefault()
        alert('Evento Actualizado Exitosamente')
        this.actualizarFormulario()
        this.show=true;
        alert('Evento Actualizado')
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
      },
      cerrarSesion(){
      //console.log('cerrarSesion');
      router.app.$auth.token(false)
      },
    },
    created() {
        this.obtenerevento();
    },
  }
</script>

<style>
</style>