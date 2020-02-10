<template>
  <div class="container">
      <br>
      <div class="row">
        <div  class="col-sm">
          <router-link to="/Login"><button style="float: right" class="btn btn-danger" v-on:click="cerrarSesion()">Cerrar Sesion</button></router-link>
          <router-link to="/Administrar"><button style="float: right" class="btn btn-primary">Atras</button></router-link>
        </div>
      </div>
      <br>
      <!--Formulario de Creacion de Nuevo Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onSubmit" v-if="show">
               
                 <h1>Registrar Ministerio</h1>
                  <br><br>
                  <b-form-group id="input-group-1" label="Imagen de Ministerio" label-for="input-1">
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Selecciona Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-2" label-for="input-2"  description="La fotografia debe representar al ministerio 'una foto del ministerio'">
                    <b-form inline>
                      <b-form-input v-model="form.imagen" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>
                  <br><br>
                  <b-form-group id="input-group-3" label="Foto del Responsable" label-for="input-3">
                    <b-form-file  v-model="file2" :state="Boolean(file2)" placeholder="Selecciona foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-4" label-for="input-4" description="La fotografia debe ser tipo '.png' fondo transparente de tamaño 1000x1800 pixeles 'cuerpo entero de perfil'">
                    <b-form inline>
                      <b-form-input v-model="form.foto" required disabled></b-form-input>
                      <b-button variant="primary" v-on:click="enviarFoto()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-5" label="Nombre del Ministerio" label-for="input-5">
                    <b-form-input id="input-5" v-model="form.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-6" label="Lema del ministerio" label-for="input-6" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-6" v-model="form.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   
                  <br>
                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="form.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-7" label="Ubicacion del ministerio" label-for="input-7">
                    <b-form-input id="input-7" v-model="form.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-8" label="Nombre completo del Responsable" label-for="input-8">
                    <b-form-input id="input-8" v-model="form.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-9" label="E-mail del Responsable" label-for="input-9" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-9" v-model="form.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-10" label="Telefono o Celular del Responsable" label-for="input-10">
                    <b-form-input id="input-10" v-model="form.telefono" required placeholder="Ingresa el Telefono  o Celular">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-11" label="Dia que se efectua el Ministerio" label-for="input-11">
                     <b-form-input id="input-11" v-model="form.dia" required placeholder="Ingrese el dia que se reune el ministerio">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-12" label="Hora de inicio" label-for="input-10" description="Usar el Formato hora:minuto:segundo  Ejemplo:  20:00:00">
                    <b-form-input id="input-12" v-model="form.hora_inicio" required placeholder="00:00:00">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-13" label="Hora fin" label-for="input-13" description="Usar el Formato  hora:minuto:segundo  Ejemplo:  22:00:00">
                    <b-form-input id="input-13" v-model="form.hora_fin" required placeholder="00:00:00">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <!-- <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div> -->
                    <b-button type="submit" variant="primary">Crear Ministerio</b-button>
                    <br><br><br>
              </b-form>
          </div>
      </div>
      <!--Formulario de Modificacion de Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onUpdate" v-if="!show">
                <h1>Actualizar Ministerio</h1>
                <br>
                  <b-form-group id="input-group-21" label="Imagen de Ministerio" label-for="input-21" >
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Selecciona Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-22" label-for="input-22" description="La fotografia debe representar al ministerio 'una foto del ministerio'">
                    <b-form inline>
                      <b-form-input v-model="ministerio.imagen" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="actualizarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-23" label="Foto del Responsable" label-for="input-23">
                    <b-form-file  v-model="file2" :state="Boolean(file)" placeholder="Selecciona foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>
                    
                  <b-form-group id="input-group-24" label-for="input-24" description="La fotografia debe ser tipo '.png' fondo transparente de tamaño 1000x1800 pixeles 'cuerpo entero de perfil'">
                    <b-form inline>
                      <b-form-input v-model="ministerio.foto" required disabled></b-form-input>
                      <b-button variant="primary" v-on:click="actualizarFoto()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-15" label="Nombre del Ministerio" label-for="input-15">
                    <b-form-input id="input-15" v-model="ministerio.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-16" label="Lema del ministerio" label-for="input-16" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-16" v-model="ministerio.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   
                  <br>
                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="ministerio.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-17" label="Ubicacion del ministerio" label-for="input-17">
                    <b-form-input id="input-17" v-model="ministerio.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-18" label="Nombre completo del Responsable" label-for="input-18">
                    <b-form-input id="input-18" v-model="ministerio.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-19" label="E-mail del Responsable" label-for="input-19" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-19" v-model="ministerio.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-20" label="Telefono o Celular del Responsable" label-for="input-20">
                    <b-form-input id="input-20" v-model="ministerio.telefono" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>
                  <br>
                  <b-form-group id="input-group-27" label="Dia que se efectua el Ministerio" label-for="input-27">
                    <b-form-input id="input-27" v-model="ministerio.dia" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-25" label="Hora de inicio" label-for="input-25" description="Usar el Formato hora:minuto:segundo  Ejemplo:  20:00:00">
                    <b-form-input id="input-25" v-model="ministerio.hora_inicio" required placeholder="00:00:00">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <b-form-group id="input-group-26" label="Hora fin" label-for="input-26" description="Usar el Formato hora:minuto:segundo  Ejemplo:  23:00:00">
                    <b-form-input id="input-26" v-model="ministerio.hora_fin" required placeholder="00:00:00">
                    </b-form-input>
                  </b-form-group>
                    <br>
                  <!-- <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div> -->
                    <b-button type="update" variant="primary">Modificar Ministerio</b-button>
                    <br><br><br>
              </b-form>
          </div>
      </div>
      <!-- <b-card class="mt-3" header="Form Data Result">
          <pre class="m-0">{{ ministerio }}</pre>
        </b-card> -->
      <!--Lista de Ministerios-->
      <div>
          <h1>Lista de Ministerios</h1>
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
            <td><button class="btn btn-warning" v-on:click="cargarDatos(ministerio)"> Modificar</button></td>
            <td>
              <b-button variant="danger" id="show-btn" @click="showModal(index)">Eliminar</b-button>
                <b-modal :ref="'modal_'+index" hide-footer title="Seguro de Eliminar el Ministerio:">
                <div class="d-block text-center">
                 <h3>{{ministerio.nombre}}</h3>
                </div>
                <b-button class="mt-3" variant="danger" block @click="eliminarMinisterio(ministerio.id_ministerio, index)">Eliminar</b-button>
                <b-button class="mt-3" variant="primary" block @click="hideModal(index)" >Cancelar</b-button>
               </b-modal>
            </td>
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
        file2: null,
        form: {
          nombre: '',
          lema:'',
          descripcion: '',
          lugar: '',
          responsable: '',
          email:'',
          telefono:'',
          foto: '',
          imagen: '',
          dia: '',
          hora_inicio: '',
          hora_fin: ''
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
          id_iglesia: 1,
          id_reunion_ministerio: '',
          dia: '',
          hora_inicio: '',
          hora_fin: ''
        },
        ministerios: [],
        show: true
      }
    },
    computed:{
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
        async obtenerministerio() {
        try {
          const respuesta = await axios.get(this.url+"/listaMinisterios");
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
          alert('Imagen Guardada')
      },
        async enviarFoto(){
        const fd = new FormData();
        fd.append('file',this.file2)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.form.foto = '/images/'+res.data.filename
            console.log(res.data)
          })
          alert('Foto Guardada')
      },
      async actualizarImagen(){
        const fd = new FormData();
        fd.append('file',this.file)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.ministerio.imagen = '/images/'+res.data.filename
            console.log(res.data)
          })
          alert('Imagen actualizada')
      },
        async actualizarFoto(){
        const fd = new FormData();
        fd.append('file',this.file2)
        axios.post(this.url+'/subir', fd)
          .then(res => {
            this.ministerio.foto = '/images/'+res.data.filename
            console.log(res.data)
          })
          alert('Foto actualizada')
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
        console.log(res.data)
        this.agregarHorarioMinisterio(res.data.id)
        
       } catch (e) {
        console.error(e);
        }
      },
      async actualizarFormulario(){
       try { 
        await axios.put(
          this.url+"/ministerio/"+this.ministerio.id_ministerio,
          {
            nombre: this.ministerio.nombre,
            descripcion_corta: this.ministerio.lema,
            descripcion: this.ministerio.descripcion,
            lugar: this.ministerio.lugar,
            nombre_responsable: this.ministerio.responsable,
            email: this.ministerio.email,
            telefono: this.ministerio.telefono,
            foto: this.ministerio.foto,
            imagen: this.ministerio.imagen,
            id_iglesia: 1
          }
        );
        console.log(this.id_reunion_ministerio);
        this.actualizarHorarioMinisterio(this.ministerio.id_reunion_ministerio)
       }catch (e){
         console.error(e);
       }  
    },
      async actualizarHorarioMinisterio(id) {
        try {
          const res = await axios.put(
            this.url+"/ministerioReunion/"+id,
            {
              dia: this.ministerio.dia,
              hora_inicio: this.ministerio.hora_inicio,
              hora_fin: this.ministerio.hora_fin,
              id_ministerio: this.ministerio.id_ministerio
            }
          )
          console.log(res.data); 
          this.obtenerministerio()

        } catch (error) {
          console.log(error);
        }
      },
        async agregarHorarioMinisterio(id) {
          try {
            const res = await axios.post(
              this.url+"/ministerioReunion",
              {
                dia: this.form.dia,
                hora_inicio: this.form.hora_inicio,
                hora_fin: this.form.hora_fin,
                id_ministerio: id
              }
            );
            console.log(res.data);            
            this.obtenerministerio()
            this.file="";
            this.form.imagen="";
            this.file2="";
            this.form.foto="";
            this.form.nombre="";
            this.form.lema="";
            this.form.descripcion="";
            this.form.lugar="";
            this.form.responsable="";
            this.form.email= "";
            this.form.telefono="";
            this.form.dia="";
            this.form.hora_inicio="";
            this.form.hora_fin="";

          } catch (error) {
            console.log(error);
          }
        },
      cargarDatos(minis) {
          this.show = false;
          this.ministerio.id_ministerio = minis.id_ministerio,
          this.ministerio.nombre= minis.nombre,
          this.ministerio.lema = minis.descripcion_corta,
          this.ministerio.descripcion = minis.descripcion,
          this.ministerio.lugar = minis.lugar,
          this.ministerio.responsable = minis.nombre_responsable,
          this.ministerio.email = minis.email,
          this.ministerio.telefono = minis.telefono,
          this.ministerio.foto = minis.foto,
          this.ministerio.imagen = minis.imagen,
          this.ministerio.id_iglesia = 1,
          this.ministerio.id_reunion_ministerio = minis.id_reunion_ministerio
          this.ministerio.dia = minis.dia,
          this.ministerio.hora_inicio = minis.hora_inicio,
          this.ministerio.hora_fin = minis.hora_fin
      },
      async eliminarMinisterio(id, index){
        try {
          await axios.delete(this.url+'/ministerio/'+id)
          this.obtenerministerio()
         //alert('Ministerio Eliminado')
         this.hideModal(index) 
        } catch (error) {
          console.log(error);
        }
      },
      cerrarSesion(){
      //console.log('cerrarSesion');
      router.app.$auth.token(false)
    },
      onSubmit(evt) {
        evt.preventDefault()
        alert('Ministerio Creado Exitosamente')
        this.enviarFormulario();
        alert('Ministerio Creado')
      },
      onUpdate(evt){
        evt.preventDefault()
        alert('Ministerio Actualizado Exitosamente')
        this.actualizarFormulario()
        this.show=true;
        alert('Ministerio Actualizada')
      }
    },
    created() {
        this.obtenerministerio();
    },
}
</script>

<style>

</style>