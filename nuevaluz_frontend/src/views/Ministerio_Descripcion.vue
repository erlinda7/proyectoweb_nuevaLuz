<template>
  <div class="container">
    <h1 class="titulo">
      <div v-for="(ministerio, index) in ministerios" :key="index">
        <div v-if="ministerio.id_ministerio==$route.params.id">
          MINISTERIO DE LA IGLESIA
          <span>"NUEVA LUZ"</span>
          {{ministerio.nombre}}
        </div>
      </div>
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
      <div class="col-sm-7" style="margin-bottom: 100px">
        <div v-for="(ministerio, index) in ministerios" :key="index">
          <div v-if="ministerio.id_ministerio==$route.params.id">
            <h4 class="descripcion">Descripcion:</h4>
            <p class="letras">{{ministerio.descripcion}}</p>
            <div class="row">
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Lugar:</p>
                  <p style="margin: 0px">Nombre Responsable:</p>
                  <p style="margin: 0px">Email:</p>
                  <p style="margin: 0px">Telefono:</p>
                </div>
              </div>
               <div class="col-sm-7">
                <div class="detalles"> 
                  <p style="margin: 0px">{{ministerio.lugar}}</p>
                  <p style="margin: 0px">{{ministerio.nombre_responsable}}</p>
                  <p style="margin: 0px">{{ministerio.email}}</p>
                  <p style="margin: 0px">{{ministerio.telefono}}</p>
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
.container .descripcion{
  background-color: rgb(226, 205, 166);
  font-family: 'Times New Roman', Times, serif;
  text-align: left;
  font-weight: bold;
  padding-left: 15px;
  padding-right: 15px

}
.container .letras{
  background-color: white;
  font-family: 'Times New Roman', Times, serif;
  text-align: left;
  text-align: justify;
  padding-left: 15px;
  padding-right: 15px
}
.container .detallesTitulo{
  font-size: 15px;
  margin-top:  1px;
  margin-bottom: 1px;
  font-family: 'Times New Roman', Times, serif;
  text-align: left;
  padding-left: 15px;
  padding-right: 15px;
  font-weight: bold;
}
.container .detalles{
  font-size: 15px;
  margin-top:  1px;
  margin-bottom: 1px;
  font-family: 'Times New Roman', Times, serif;
  text-align: left;
  padding-left: 15px;
  padding-right: 15px
}
</style>