<template>
  <div class="container">
    <div class="evento">
      <h1 class="titulo1">PRÓXIMOS EVENTOS</h1>
      <div class="container">
        <div class="row caja" v-for="(evento,index) in eventos" :key="index">
          <div class="col-sm">
            <img class="foto" :src="url+`${evento.imagen}`" alt="imagen" width="100%" />
           
          </div>
          <div class="col-sm">
            <h2 class="titulo2">{{evento.titulo}}</h2>
            <h3 class="titulo3">Descripción:</h3>
            <p class="texto">{{evento.descripcion}}</p>
            <h3 class="titulo3">Fecha:</h3>
            <p class="texto">{{evento.fecha}}</p>
            <h3 class="titulo3">Lugar:</h3>
            <p class="texto" >{{evento.lugar}}</p>
          </div>
        </div>
      </div>
    </div>
   
  </div>
</template>

<script>
import axios from "axios";
import {mapState} from "vuex";

export default {
  data: () => ({
    eventos: []
  }),
  computed: {
    ...mapState(['url'])
  },
  created() {
    this.obtenerevento();
  },
  methods: {
    async obtenerevento() {
      try {
        const respuesta = await axios.get(this.url+"/evento");
        this.eventos = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
    },
  }
};
</script>

<style>
.evento .caja{
  margin-bottom: 80px;
  border: 2px  rgb(0, 31, 58) solid;
  padding-top: 30px;
  padding-bottom: 30px
}
.evento .titulo1{
   color: black;
  font-size: 40px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
}
.evento .titulo2{
  color: rgb(0, 31, 58);
  font-size: 30px;
  font-family: "serif", Times New Roman, Times;
  text-align: center;
  font-weight: bold;
  margin-bottom: 70px;
  margin-top: 40px
}
.evento .titulo3{
  color: rgb(0, 31, 58);
  font-size: 27px;
  font-family: "serif", Times New Roman, Times;
  text-align: left;
  font-weight: bold
}
.evento .texto{
  color: black;
  font-size: 18px;
  text-align: justify;
  margin-bottom: 50px
}
</style>