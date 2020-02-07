<template>
  <div>
    <inicioCarrusel />
    <img class="img-fluid" src="@/assets/separador.png" alt="" width="40%">
    <Bienvenida />
    <img class="img-fluid" src="@/assets/separador.png" alt="" width="40%">
    <div class="links">
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/historia1.jpg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <router-link id="diseñoSuperior1" to="/NuevaLuz_Historia" class="card-title"> HISTORIA </router-link>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/misiones1.jpeg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <router-link  id="diseñoSuperior1" to="/NuevaLuz_QuienesSomos" class="card-title">CAMINANDO</router-link >
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/liderazgo.jpg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <router-link id="diseñoSuperior1" to="/NuevaLuz_Liderazgo" class="card-title">LIDERAZGO</router-link>
              </div>
            </div>
          </div>
        </div>
        <br>
      </div>
    </div>
    <br />
  </div>
</template>

<script>
import inicioCarrusel from "@/components/inicioCarrusel";
import Bienvenida from "@/components/Bienvenida";
export default {
  components: {
    inicioCarrusel,
    Bienvenida
  }
};
</script>

<style>
#diseñoSuperior1{
  color: white;
  background-color: rgb(0, 31, 58);
  height: 40px;
  font-family: 'Times New Roman', Times, serif;
  border: wheat 5px double;
  font-weight: bold;
  font-size: 22px;
  border-radius: 5px;
  
}
</style>