<template>
  <div class="container">
    <h1 class="titulo">
      <div v-for="(ministerio, index) in ministerios" :key="index">
        <div v-if="ministerio.id_ministerio==$route.params.id">
          MINISTERIO DE LA IGLESIA
          <span>"NUEVA LUZ"</span>
          <br><br>
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
              <div class="card" style="width: 25rem; margin: auto;">
                <img src="@/assets/fondoRosa.jpg" class="card-img-top" alt="..." height="450px"/>
                <div class="card-img-overlay">
                  <img style="margin-top: 60px" :src="url+`${ministerio.foto}`" alt="" width="200px">
                </div>
              </div>
            </div>
            </div>
          </div>
        </div> 

      </div>
      <div class="col-sm-7" style="margin-bottom: 100px;">
        <div v-for="(ministerio, index) in ministerios" :key="index">
          <div v-if="ministerio.id_ministerio==$route.params.id">
            <h4 class="descripcion">Descripcion:</h4>
            <p class="letras">{{ministerio.descripcion}}</p>
            <div class="row">
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Lugar:</p>
                </div>
              </div>
               <div class="col-sm-7">
                <div class="detalles"> 
                  <p style="margin: 0px">{{ministerio.lugar}}</p>
                </div>
               </div>
            </div>
            <div class="row">
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Nombre Responsable:</p>
                </div>
              </div>
               <div class="col-sm-7">
                <div class="detalles"> 
                  <p style="margin: 0px">{{ministerio.nombre_responsable}}</p>
                </div>
               </div>
            </div>
            <div class="row">
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Email:</p>
                </div>
              </div>
               <div class="col-sm-7">
                <div class="detalles"> 
                  <p style="margin: 0px">{{ministerio.email}}</p>
                </div>
               </div>
            </div>
            <div class="row">
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Telefono:</p>
                </div>
              </div>
               <div class="col-sm-7">
                <div class="detalles"> 
                  <p style="margin: 0px">{{ministerio.telefono}}</p>
                </div>
               </div>
            </div>
            <div class="row"> 
              <div class="col-sm-5">
                <div class="detallesTitulo">
                  <p style="margin: 0px">Horario:</p>
                </div>
              </div>
              <div class="col-sm-7">
                <div class="detalles">
                  <p style="margin: 0px">{{ministerio.dia}}</p>
                  <p style="margin: 0px"><b>De: </b>{{ministerio.hora_inicio}}<b> a </b>{{ministerio.hora_fin}}<b> Hrs. </b></p>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <div>
     <h4 class="titulo">Visita Nuestros Ministerios</h4>
   </div>
   <!----->
   <div class="row justify-content-center">
      <div  v-for="(ministerio,index) in ministerios" :key="index">
        <div class="col mb-4">
          <div class="card" style="max-width: 10rem; margin:auto; margin-bottom: 30px">
            <router-link style="text-decoration: none" :to="{name:'Ministerio_Descripcion', params:{id:ministerio.id_ministerio}}">
              <img :src="url+`${ministerio.imagen}`" class="card-img-top" alt="imagen" height="160px"/>
              <div id="diseñoInferior" class="card-body">
                <h5 id="titulo" class="card-title">{{ministerio.nombre}}</h5>
              </div>
            </router-link>
          </div>
        </div>
      </div>
      <router-view/>
  </div>
   <!----->
  </div>
</template>

<script>
import axios from "axios";
import {mapState} from "vuex";

export default {
  data: () => ({
    ministerios: [],
    id: 0
  }),
  computed:{
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
        console.log(this.ministerios);
      }
    },
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
  padding-right: 15px;
 

}
.container .letras{
  background-color: white;
  font-family: 'Times New Roman', Times, serif;
  text-align: left;
  text-align: justify;
  padding-left: 15px;
  padding-right: 15px;
  font-size: 20px;
  padding-top: 20px;
  margin-bottom: 50px; 
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
#diseñoInferior{
  background-color: rgb(0, 31, 58);
  color:  wheat;
  font-family: 'Times New Roman', Times, serif;
  height: 90px;
}
#diseñoInferior #titulo{
  font-weight: bold;
  font-size: 15px;
}

</style>