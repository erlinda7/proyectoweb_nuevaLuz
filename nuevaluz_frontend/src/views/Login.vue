<template>
  <div class="container">
    <br />
    <div>
      <!----->
      <h4>
        <b>Login</b>
      </h4>
      <div class="loginadmin" v-if="ir">
        <b-form @submit.stop.prevent @submit="onSubmit" @reset="onReset" v-if="show">
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
          <br />
          <div >
            <b-button type="submit" variant="primary" class="boton">Iniciar Sesión</b-button>
            <b-button type="reset" variant="danger" class="boton">Limpiar</b-button>
          </div>
          
        </b-form>
        
      </div>
      <div  v-if="!ir">
            <h5>Autentificacion Correcta</h5>
            <router-link to= "/Administrar" ><button class="btn btn-primary">Ir a Gestionar</button></router-link>
          </div>
    </div>
    <div>
      <!---->
    </div>
    <br />
    <br />
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
import router from "../router/index";

export default {
  data() {
    return {
      form: {
        usuario: "",
        contrasenia: ""
      },
      show: true,
      estadouser: false,
      ir: true
    };
  },
  computed: {
    ...mapState(["url"])
  },
  methods: {
    async autentificacion() {
      try {
        const res = await axios.post(this.url + "/autenticar", {
          nombre_user: this.form.usuario,
          contrasenia: this.form.contrasenia
        });
        router.app.$auth.token(res.data.mensaje); //true
        router.app.$auth.guardarIdUsuario(res.data.id_usuario);
        console.log(res.data.mensaje, '  res_data_mensaje');
        
        if (res.data.mensaje) {
          this.ir = false;
        }
      } catch (error) {
        console.log(error);
        //router.app.$auth.token("false");
        alert("Usuario o contraseña incorrectas");
        (this.form.usuario = ""), (this.form.contrasenia = "");
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
  }
};
</script>
<style>
.loginadmin {
  margin: auto;
  width: 400px;
  border: 1px rgb(0, 31, 58) solid;
  padding: 30px 30px;
  margin-top: 50px;
  margin-bottom: 50px;

  height: 350px;
}
.loginadmin .boton {
  margin-right: 20px;
}
</style>