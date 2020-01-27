<template>
  <div class="container">
    <h1 class="titulo">
      MINISTERIO DE LA IGLESIA
      <span>"NUEVA LUZ"</span>
    </h1>
    <div class="row">
      <div class="col-sm-5">
        
        <div class="row justify-content-center">
          <div v-for="(ministerio, index) in ministerios" :key="index">
            <div v-if="ministerio.id_ministerio==$route.params.id">
            <div class="col-sm">
              <div class="card" style="width: 20rem; margin: auto;">
                <img src="@/assets/fondoBlanco.jpg" class="card-img-top" alt="..." />
                <div class="card-img-overlay">
                  <img style="margin-top: 30px " :src="require('@/fotos/' + ministerio.foto)" alt="" width="200px">
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-sm-7">
        <div v-for="(ministerio, index) in ministerios" :key="index">
          <div v-if="ministerio.id_ministerio==$route.params.id">
            <h2>Informacion del Ministerio {{ministerio.nombre}}</h2>
            <h4>descripcion:</h4>
            <p>{{ministerio.descripcion}}</p>
            <p>lugar:{{ministerio.lugar}}</p>
            <p>nombre_responsable:{{ministerio.nombre_responsable}}</p>
            <p>email:{{ministerio.email}}</p>
            <p>telefono:{{ministerio.telefono}}</p>
          </div>
        </div>
      </div>
    </div>
    <!--
    <div v-for="(ministerio,index) in ministerios" :key="index">
      <div v-if="ministerio.id_ministerio==$route.params.id">
        <p>id_ministerio:{{ministerio.id_ministerio}}</p>
        <p>Titulo:{{ministerio.nombre}}</p>
        <p>descripcion:{{ministerio.descripcion}}</p>
        <p>lugar:{{ministerio.lugar}}</p>
        <p>nombre_responsable:{{ministerio.nombre_responsable}}</p>
        <p>email:{{ministerio.email}}</p>
        <p>telefono:{{ministerio.telefono}}</p>
        <img :src="require('@/fotos/' + ministerio.foto)" alt="imagen" width="20%" />
        <br />
        <br />
      </div>
    </div>
    -->
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    ministerios: [],
    id: 0
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
        console.log(this.ministerios);
      }
    },
    //no uso este metodo para filtrar, por que al recargar(F5) se pierde todo
    //estoy usando v-if
    filtrarMinisterioId() {
      return (this.ministerioSeleccionado = this.ministerios.filter(
        ministerio => ministerio.id_ministerio === this.$route.params.id
      ));
    }
  }
};
</script>


<style>
.container .titulo {
  color: black;
  font-size: 40px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
}
</style>