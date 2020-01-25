<template>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
      <div class="col mb-4">
        <div class="card " style="max-width: 20rem; margin:auto">
         <img src="@/assets/fotoiglesia.jpg" class="card-img-top" alt="...">
         <div class="card-img-overlay ">
           <h5 class="card-title circulo">Evangelistassdasdsasdasksks</h5>
         </div>
         <div class="card-body">
           <h5 class="card-title">Card title</h5>
           <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
         </div>
        </div>
      </div>
      <div class="col mb-4">
        <div class="card">
          <img src="" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
          </div>
        </div>
      </div>
      <div class="col mb-4">
        <div class="card">
          <img src="" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
          </div>
        </div>
      </div>
      <div class="col mb-4">
       <div class="card">
         <img src="" class="card-img-top" alt="...">
        <div class="card-body">
         <h5 class="card-title">Card title</h5>
         <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        </div>
       </div>
      </div>
  </div>
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
.circulo {
  font-family: 'Times New Roman', Times, serif;
  color: white;
  margin: auto;
  width: 200px;
  height: 200px;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  background: green;
  opacity: 0.8;
  filter: alpha(opacity=50);
  padding-top: 75px;
  font-size: 30px;
  font-weight: bold;
  
}
.centrarTodo{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap
}
</style>