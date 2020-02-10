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
      <div class="adminUser" v-if="irGestionar">
        <b-form @submit.stop.prevent @submit="onSubmit" @reset="onReset">
          <b-form-group id="input-group-2" label="Usuario:" label-for="input-2">
            <b-form-input
              id="input-2"
              v-model="form.nombre_user"
              required
              placeholder="Ingrese Usuario"
            ></b-form-input>
          </b-form-group>
          <br />
          <label for="text-password">Contraseña</label>
          <b-input
            type="password"
            id="text-password"
            aria-describedby="password-help-block"
            placeholder="Ingrese Contraseña"
            v-model="form.contrasenia"
            required
          ></b-input>
          <br>
          <br>
          <label for="text-password">Confirmar Contraseña</label>
          <b-input
            type="password"
            id="text-password1"
            aria-describedby="password-help-block"
            placeholder="Ingrese Contraseña"
            v-model="form.contraseniaC"
            required
          ></b-input>
          <br>
          <div>
            <b-button type="submit" variant="primary" class="boton">Crear Administrador</b-button>
            <b-button type="reset" variant="danger" class="boton">Limpiar</b-button>
          </div>
          
        </b-form>
      </div>
      <div  v-if="!irGestionar">
            <h5>Usuario Creado Exitosamente</h5>
            <router-link to= "/Login" ><button class="btn btn-primary">Ir a Login</button></router-link>
          </div>
      <div>
          <h1>Lista de Usuarios</h1>
          <br>
          <button class="btn btn-primary" @click="obtenerUsuarios()">Ver usuarios</button>
          <br>
          <br>
      </div>
      <div>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Usuario</th>
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(usuario,index) of usuarios" :key="index">
            <th scope="row">{{usuario.nombre_user}}</th>
            <td>
                <b-button variant="danger" id="show-btn" @click="showModal(index)">Eliminar</b-button>
                <b-modal :ref="'modal_'+index" hide-footer title="Seguro de Eliminar el Usuario:">
                <div class="d-block text-center">
                 <h3>{{usuario.nombre_user}}</h3>
                </div>
                <b-button class="mt-3" variant="danger" block @click="eliminarUsuario(usuario.id_usuario, index)">Eliminar</b-button>
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
//import Modal from "../components/Modal";

export default {
    data(){
        return{
            form:{
                nombre_user:'',
                contrasenia:'',
                contraseniaC:''
            },
            usuarios:[],
            irGestionar: true
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
      //<------------------------------------------------>
    async obtenerUsuarios() {
      try {
        const respuesta = await axios.get(this.url + "/usuario/"+router.app.$auth.obtenerIdUsuario());// mandar Id
        this.usuarios = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api : ", error);
      }
    },
    async enviarUsuario() {
      try {
        const resf = await axios.post(this.url + "/usuario", {
          nombre_user: this.form.nombre_user,
          contrasenia: this.form.contrasenia
        });
        console.log(resf.data);
        alert('Usuario Creado Exitosamente')
         this.obtenerUsuarios();
        this.irGestionar = false
      } catch (e) {
        console.error(e);
      }
    },
    async eliminarUsuario(id, index) {
      try {
        await axios.delete(this.url + "/usuario/" + id);
        this.obtenerUsuarios();
        //alert('Usuario Eliminado')
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
      evt.preventDefault();
      if (this.form.contrasenia === this.form.contraseniaC) {
          console.log('creado');
          this.enviarUsuario()
      } else {
          alert('Las contraseñas no coinciden')
          this.form.contrasenia = ''
          this.form.contraseniaC = ''
      }
      //boton iniciar sesion
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.usuario = "";
      this.form.contrasenia = "";
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    }
    },

}
</script>

<style>
.adminUser {
  margin: auto;
  width: 400px;
  border: 1px rgb(0, 31, 58) solid;
  padding: 30px 30px;
  margin-top: 50px;
  margin-bottom: 50px;

  height: 420px;
}
.adminUser .boton {
  margin-right: 20px;
}
</style>