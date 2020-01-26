<template>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
      <div  v-for="(ministerio,index) in ministerios" :key="index">
        <div class="col mb-4">
          <div class="card " style="max-width: 20rem; margin:auto">
            <router-link style="text-decoration: none" :to="{name:'Ministerio_Descripcion', params:{id:ministerio.id_ministerio}}">
              <img :src="require('@/assets/' + ministerio.imagen)" class="card-img-top" alt="imagen" />
              <div class="card-img-overlay">
                <h5 style="color: white" class="card-title">{{ministerio.nombre}}</h5> <!--disañar circulo-->
              </div>
              <div style="color:black" class="card-body">
                <h5>{{ministerio.nombre}}</h5>
                <p class="card-text">:{{ministerio.descripcion_corta}}</p>
              </div>
            </router-link>
          </div>
        </div>
      </div>
      <router-view/>
  </div>
    <!--
    <div v-for="(ministerio,index) in ministerios" :key="index">
        <p>id_ministerio:{{ministerio.id_ministerio}}</p>
        <p>Titulo:{{ministerio.nombre}}</p>
        <p>descripcion_corta:{{ministerio.descripcion_corta}}</p>
         <img :src="require('@/assets/' + ministerio.imagen)" alt="imagen" width="50%" />
        <br><br>
    </div>
    -->
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
  width: 180px;
  height: 180px;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  background: green;
  opacity: 0.8;
  filter: alpha(opacity=50);
  padding-top: 50px;
  font-size: 30px;
  font-weight: bold;
  
}
.centrarTodo{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap
}
#textMinisterio{
  text-decoration: none
}
</style>