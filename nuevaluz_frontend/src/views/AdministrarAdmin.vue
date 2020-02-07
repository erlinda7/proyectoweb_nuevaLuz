<template>
  <div class="container">
      <div class="adminUser">
        <b-form @submit.stop.prevent @submit="onSubmit" @reset="onReset">
          <b-form-group id="input-group-2" label="Usuario:" label-for="input-2">
            <b-form-input
              id="input-2"
              v-model="form.usuario"
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
            <td><button class="btn btn-danger" v-on:click="eliminarMinisterio(usuario.id_usuario)" >Eliminar</button></td>
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
    data(){
        return{
            form:{
                usuario:'',
                contrasenia:'',
                contraseniaC:''
            },
            usuarios:[]
        }
    },
    computed: {
        ...mapState(['url'])
    },
    methods: {
    async obtenerUsuarios() {
      try {
        const respuesta = await axios.get(this.url + "/usuario/1");// mandar Id
        this.usuarios = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api : ", error);
      }
    },
    onSubmit(evt) {
      evt.preventDefault();
      this.autentificacion();
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