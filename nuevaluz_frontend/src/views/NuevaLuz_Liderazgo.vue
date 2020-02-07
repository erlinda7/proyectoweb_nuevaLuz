<template>
<div>
  <nuevaLuzCarrusel/>
  <div class="container">
    <div>
      <div class="title"> 
        <h1><b> PASTORES </b></h1>
      </div>
        <div class="row justify-content-center">
          <div v-for="(pastor, index) in pastores" :key="index">
            <div class="col-sm">
              <div class="card" style="width: 18rem; margin: auto; margin-bottom: 30px">
                <img src="@/assets/fondoBlanco.jpg" class="card-img-top" alt="..." />
                <div class="card-img-overlay">
                  <img :src="`http://localhost:3000${pastor.foto}`" alt="" width="266px">
                </div>
                <div class="card-body">
                  <h5 class="card-title text"><b>{{pastor.nombre_cargo}}</b></h5>
                  <p class="card-text text" >{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
               </div>
              </div>
            </div>
          </div>
        </div>
    </div>
    <div>
      <div class="title">
        <H1><b> ANCIANOS </b></H1>
      </div>
      <div class="row justify-content-center">
          <div v-for="(anciano, index) in ancianos" :key="index">
            <div  class="col-sm">
              <div class="card" style="width: 18rem; margin: auto; margin-bottom: 100px">
                <img src="@/assets/fondoBlanco.jpg" class="card-img-top" alt="..." />
                <div class="card-img-overlay">
                  <img :src="url+`${anciano.foto}`" alt="" width="266px">
                </div>
                <div class="card-body">
                  <h5 class="card-title text"><b>{{anciano.nombre_cargo}}</b></h5>
                  <p class="card-text text">{{anciano.nombre}} {{anciano.apellido_paterno}}</p>
               </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</div>
</template>

<script>
import nuevaLuzCarrusel from '@/components/nuevaLuzCarrusel'
import axios from "axios";
import {mapState} from "vuex"
export default {
  components:{
    nuevaLuzCarrusel
  },
  data: () => ({
    lideres: [],
    pastores: [],
    ancianos: []
  }),
  computed:{
    ...mapState(['url'])
  },
  created() {
    this.obtenerlideres();
  },
  methods: {
    async obtenerlideres() {
      try {
        const respuesta = await axios.get(this.url+"/liderazgo");
        this.lideres = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
      this.filtrarPastor();
      this.filtrarAnciano();
    },
    filtrarPastor() {
      this.pastores = this.lideres.filter(
        lider => lider.nombre_cargo === "Pastor"
      );
    },
    filtrarAnciano() {
      this.ancianos = this.lideres.filter(
        lider => lider.nombre_cargo === "Anciano"
      );
    }
  }
};
</script>

<style>
.container .title {
  color: rgb(0, 31, 58);
  font-size: 60px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
}
.container .text{
  color: rgb(0, 31, 58);;
  font-family: 'Times New Roman', Times, serif;
  font-size: 25px
  
}
</style>