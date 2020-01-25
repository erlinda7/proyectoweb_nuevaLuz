<template>
  <div id="contanier">
    <div class="pastores">
      <h1>PASTORES</h1>
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <div class="card" style="width: 18rem;">
              <img src="@/fotos/pastor1.jpg" class="card-img-top" alt="..." />
              <div class="card-body">
                <h5 class="card-title">Pastor General</h5>
                <p class="card-text">Nombre</p>
              </div>
            </div>
          </div>
          <div class="col-sm">One of three columns</div>
        </div>
      </div>
    </div>
    <div class="ancianos">
      <H1>ANCIANOS</H1>
      <div class="container">
        <div class="row">
          <div class="col-sm">One of three columns</div>
          <div class="col-sm">One of three columns</div>
        </div>
        <div class="row">
          <div class="col-sm">One of three columns</div>
          <div class="col-sm">One of three columns</div>
          <div class="col-sm">One of three columns</div>
        </div>
      </div>
    </div>


    <!-- ----------------------------- -->
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
    <!-- ---------------------- -->
  </div>
</template>

<script>
import axios from "axios";
export default {
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
</style>