<template>
  <div class="container">
    <div class="loginadmin">
      <b-form @submit.stop.prevent @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group id="input-group-2" label="Usuario:" label-for="input-2">
          <b-form-input id="input-2" v-model="form.usuario" required placeholder="Ingrese Usuario"></b-form-input>
        </b-form-group>
<br>
        <label for="text-password" >Contraseña</label>
        <b-input
          type="password"
          id="text-password"
          aria-describedby="password-help-block"
          placeholder="Ingrese Contraseña"
          v-model="form.contrasenia"
          required
        ></b-input>
        <br /><br>
        <b-button type="submit" variant="primary" class="boton">Iniciar Sesión</b-button>
        <b-button type="reset" variant="danger" class="boton">Limpiar</b-button>
      </b-form>

    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        usuario: "",
        contrasenia: ""
      },
      show: true,
      estadouser:false
    };
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      alert(JSON.stringify(this.form));
      this.login();
    },
    login(){
        //router.logear(this.estadouser)
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
  margin-top: 100px;
  margin-bottom: 200px;
  
  height: 350px;
}
.loginadmin .boton{
  margin-right: 20px
}
</style>