<template>
  <div class="contanier">
    <p>vista ministerios</p>
    <router-link to="/Ministerio_Descripcion">Ministerio Descripcion</router-link>
    <br />
    <router-link to="/Ministerio_Juvenil">Juvenil</router-link>
    <br />
    <router-link to="/Ministerio_Prejuvenil">Prejuvenil</router-link>
    <br />
    <router-link to="/Ministerio_Misioneros">Misioneros</router-link>
    <br />
    <router-link to="/Ministerio_Evangelistas">Evangelistas</router-link>
    <br />
    <router-link to="/Ministerio_Tesoritos">Tesoritos</router-link>
    <br />
    <router-link to="/Ministerio_Joyitas">Joyitas</router-link>
    <br />
    <router-link to="/Ministerio_HoritaFeliz">HoritaFeliz</router-link>
    <br />
    <router-link to="/Ministerio_Oanza">Oanza</router-link>

    <br />
    <br />
    <div v-for="(ministerio,index) in ministerios" :key="index">
        <p>id_ministerio:{{ministerio.id_ministerio}}</p>
        <p>Titulo:{{ministerio.nombre}}</p>
        <p>descripcion_corta:{{ministerio.descripcion_corta}}</p>
         <img :src="require('@/assets/' + ministerio.imagen)" alt="imagen" width="50%" />
        <br><br>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    ministerios: []
  }),
  created() {
    this.obtenerMinisterio();
  },
  methods: {
    async obtenerMinisterio() {
      try {
        const respuesta = await axios.get("http://localhost:3000/ministerio");
        this.ministerios = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
    }
  }
};
</script>

<style>
</style>