<template>
  <div class="container">
    <h1 class="titulo">
      MINISTERIOS DE LA IGLESIA
      <span>"NUEVA LUZ"</span>
    </h1>
    <div class="row row-cols-1 row-cols-md-2">
      <div  v-for="(ministerio,index) in ministerios" :key="index">
        <div class="col mb-4">
          <div class="card" style="max-width: 30rem; margin:auto; margin-bottom: 100px">
            <router-link style="text-decoration: none" :to="{name:'Ministerio_Descripcion', params:{id:ministerio.id_ministerio}}">
              <img :src="url+`${ministerio.imagen}`" class="card-img-top" alt="imagen" height="350px"/>
              <div class="card-img-overlay">
                <h5 id="diseñoSuperior" class="card-title centradoVerticalTitulo">{{ministerio.nombre}}</h5> 
              </div>
              <div id="diseñoInferior1" class="card-body">
                <h5 id="titulo" class="card-title">{{ministerio.nombre}}</h5>
                <p id="texto" class="card-text">{{ministerio.descripcion_corta}}</p>
              </div>
            </router-link>
          </div>
        </div>
      </div>
      <router-view/>
  </div>
  </div>
</template>

<script>
import axios from "axios";
import {mapState} from "vuex";

export default {
  data: () => ({
    ministerios: []
  }),
  computed: {
    ...mapState(['url'])
  },
  created() {
    this.obtenerMinisterio();
  },
  methods: {
    async obtenerMinisterio() {
      try {
        const respuesta = await axios.get(this.url+"/listaMinisterios");
        this.ministerios = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
    }
  }
};
</script>

<style>

#diseñoSuperior{
  color: white;
  background-color: green;
  height: 60px;
  font-family: 'Times New Roman', Times, serif;
  border: greenyellow 5px double;
  font-weight: bold;
  font-size: 22px;
  border-radius: 5px;
  
}
.centrarTodo{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap
}
#textMinisterio{
  text-decoration: none
}
.container .titulo {
  color: rgb(0, 31, 58);
  font-size: 40px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
  
}
#diseñoInferior1{
  background-color: rgb(0, 31, 58);
  color:  white;
  font-family: 'Times New Roman', Times, serif;
  height: 140px;
}
#diseñoInferior1 #titulo{
  font-weight: bold;
  font-size: 20px;
  
}
#diseñoInferior1 #texto{
  font-size: 17px;
  text-align: center;
  color: wheat
}
.centradoVerticalTitulo{
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>