<template>
  <div>
    <inicioCarrusel />
    <Bienvenida />
    <div class="links">
      <div class="container">
        <div class="row">
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/historia1.jpg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <h5 class="card-title">HISTORIA</h5>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/misiones1.jpeg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <h5 class="card-title">CAMINANDO</h5>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card bg-dark text-white">
              <img src="@/assets/liderazgo.jpg" class="card-img" alt="..." height="300PX" />
              <div class="card-img-overlay">
                <h5 class="card-title">LIDERAZGO</h5>
              </div>
            </div>
          </div>
        </div>
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
</style>