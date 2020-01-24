<template>
  <div class="contanier">
    <h1>PROXIMOS EVENTOS</h1>
    <div class="evento">
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <div class="card mb-3 " v-for="(evento,index) in eventos" :key="index" style="max-width: 100%; ">
              <div class="row no-gutters">
                <div class="col-md-4">
                  <img src="../eventos/culto.jpg" class="card-img" alt="..." />
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h2>{{evento.titulo}}</h2>
                    <h5 class="card-title">Descripción</h5>
                    <p class="card-text">{{evento.descripcion}}</p>
                    <h5 class="card-title">Fecha</h5>
                    <p class="card-text">{{evento.fecha}}</p>
                    <h5 class="card-title">Lugar</h5>
                    <p class="card-text">{{evento.lugar}}</p>
                  </div>
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
import axios from "axios";
export default {
  data: () => ({
    eventos: [],
    img: "@/assets/logo.png"
  }),
  created() {
    this.obtenerevento();
  },
  methods: {
    async obtenerevento() {
      try {
        const respuesta = await axios.get("http://localhost:3000/evento");
        this.eventos = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
      
    }
  }
};
</script>

<style>
</style>