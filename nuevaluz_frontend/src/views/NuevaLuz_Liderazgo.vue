<template>
<div>
  <nuevaLuzCarrusel/>
  <div class="container">
    <div class="pastores">
      <h1>PASTORES</h1>
      
        <div class="row justify-content-center">
          <div v-for="(pastor, index) in pastores" :key="index">
            <div class="col-sm">
              <div class="card" style="width: 18rem; margin: auto;">
                <img src="@/assets/fondoBlanco.jpg" class="card-img-top" alt="..." />
                <div class="card-img-overlay">
                  <img style="margin-top: 30px " :src="require('@/fotos/'+ pastor.foto)" alt="" width="150px">
                </div>
                <div class="card-body">
                  <h5 class="card-title">{{pastor.nombre_cargo}}</h5>
                  <p class="card-text">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
               </div>
              </div>
            </div>
          </div>
        </div>
    </div>
    <div class="ancianos">
      <H1>ANCIANOS</H1>
      <div class="row justify-content-center">
          <div v-for="(anciano, index) in ancianos" :key="index">
            <div class="col-sm">
              <div class="card" style="width: 18rem; margin: auto;">
                <img src="@/assets/fondoBlanco.jpg" class="card-img-top" alt="..." />
                <div class="card-img-overlay">
                  <img style="margin-top: 50px " :src="require('@/fotos/'+ anciano.foto)" alt="" width="150px">
                </div>
                <div class="card-body">
                  <h5 class="card-title">{{anciano.nombre_cargo}}</h5>
                  <p class="card-text">{{anciano.nombre}} {{anciano.apellido_paterno}}</p>
               </div>
              </div>
            </div>
          </div>
        </div>
    </div>


    <!-- ----------------------------- 
    <br>
    <br>
    <p>---------------------------desde backend---------------</p><br>
    <h1>pastores</h1>
    <div v-for="(pastor, index) in pastores" :key="index">
      <img :src="require('@/fotos/'+ pastor.foto)" alt="" width="20%">
      <p>{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
      <p>{{pastor.nombre_cargo}}</p>
    </div>

    <h1>ancianos</h1>
    <div>
      <div v-for="(anciano, index) in ancianos" :key="index">
      <img :src="require('@/fotos/'+ anciano.foto)" alt="" width="20%">
      <p>{{anciano.nombre}} {{anciano.apellido_paterno}}</p>
      <p>{{anciano.nombre_cargo}}</p>
    </div>
    </div>
     ---------------------- -->
  </div>
</div>
</template>

<script>
import nuevaLuzCarrusel from '@/components/nuevaLuzCarrusel'
import axios from "axios";
export default {
  components:{
    nuevaLuzCarrusel
  },
  data: () => ({
    lideres: [],
    pastores: [],
    ancianos: []
  }),
  created() {
    this.obtenerlideres();
  },
  methods: {
    async obtenerlideres() {
      try {
        const respuesta = await axios.get("http://localhost:3000/liderazgo");
        this.lideres = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
      this.filtrarPastor();
      this.filtrarAnciano();
    },
    filtrarPastor() {
      this.pastores = this.lideres.filter(
        lider => lider.nombre_cargo === "pastor"
      );
    },
    filtrarAnciano() {
      this.ancianos = this.lideres.filter(
        lider => lider.nombre_cargo === "anciano"
      );
    }
  }
};
</script>

<style>
.imgAtras{
  position: relative;
}
.imgFrente{
  position: absolute;
  top:0px;
  left:0px;
  border:none;
}
</style>