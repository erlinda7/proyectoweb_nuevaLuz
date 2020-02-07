<template>
  <div class="container">
    <h1 class="titulo">
      OFICIALIA DE LA IGLESIA
      <span>"NUEVA LUZ"</span>
    </h1>
    <div class="directorio">
        <div class="row caja">
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">PASTORES</div>
              <div v-for="(pastor, index) in pastores" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">ANCIANOS</div>
              <div v-for="(pastor, index) in ancianos" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row caja">
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">DIACONOS</div>
              <div v-for="(pastor, index) in diaconos" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">DIACONIZAS</div>
              <div v-for="(pastor, index) in diaconizas" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row caja">
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem;height:400px">
              <div class="subtitulo">TESOREROS</div>
              <div v-for="(pastor, index) in tesoreros" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">SECRETARIO</div>
              <div v-for="(pastor, index) in secretarios" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row caja">
          <div class="col-sm">
            <div class="card border-dark mb-3 fondocaja" style="max-width: 30rem; height:400px">
              <div class="subtitulo">SUPERINTENDENTES</div>
              <div v-for="(pastor, index) in superintendentes" :key="index">
                <p class="card-text texto">{{pastor.nombre}} {{pastor.apellido_paterno}}</p>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import {mapState} from "vuex"
export default {
  data: () => ({
    directorios: [],
    pastores: [],
    ancianos: [],
    diaconos: [],
    diaconizas: [],
    tesoreros: [],
    secretarios: [],
    superintendentes: []
  }),
  computed: {
    ...mapState(['url'])
  },
  created() {
    this.obtenerdirectorio();
  },
  methods: {
    async obtenerdirectorio() {
      try {
        const respuesta = await axios.get(this.url+"/directorio");
        this.directorios = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
      this.filtrarPastor();
      this.filtrarAnciano();
      this.filtrarDiacono();
      this.filtrarDiaconiza();
      this.filtrarTesorero();
      this.filtrarSecretario();
      this.filtrarsuperintendente();
    },

    filtrarPastor() {
      this.pastores = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Pastor"
      );
    },
    filtrarAnciano() {
      this.ancianos = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Anciano"
      );
    },
    filtrarDiacono() {
      this.diaconos = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Diacono"
      );
    },
    filtrarDiaconiza() {
      this.diaconizas = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Diaconiza"
      );
    },
    filtrarTesorero() {
      this.tesoreros = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Tesorero"
      );
    },
    filtrarSecretario() {
      this.secretarios = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Secretario"
      );
    },
    filtrarsuperintendente() {
      this.superintendentes = this.directorios.filter(
        directorio => directorio.nombre_cargo === "Superintendente"
      );
    }
  }
};
</script>

<style>
.contanier .titulo {
  color: black;
  font-size: 40px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
}
.contanier .titulo span {
  color: rgb(0, 31, 58);
  font-size: 45px;
}
.directorio .subtitulo {
  color: rgb(0, 31, 58);
  font-size: 25px;
  font-family: "serif", Times New Roman, Times;
  padding: 5px;
  margin-bottom: 35px;
}
.directorio .texto {
  color: black;
  font-size: 18px;
  padding-top: 5px;
  margin-left: 6rem;
  text-align: left;
}
.directorio .caja {
  margin-top: 10px;
  margin-bottom: 60px;
}
.directorio .fondocaja {
  background-image: url("../assets/fondo_pr.jpg");
  background-repeat: no-repeat;
  background-size: 100%;
}
</style>