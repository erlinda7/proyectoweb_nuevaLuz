<template>
  <div class="container">
    <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active" data-interval="10000">
          <img id="bordeCir" src="@/assets/Carrusel_Inicio1.jpeg" class="d-block w-100" alt="..." height="500px"/>
        </div>
        <div class="carousel-item" data-interval="2000">
          <img id="bordeCir" src="@/assets/Carrusel_Inicio2.png" class="d-block w-100" alt="..." height="500px"/>
        </div>
        <div class="carousel-item">
          <img id="bordeCir" src="@/assets/Carrusel_Inicio3.jpeg" class="d-block w-100" alt="..." height="500px"/>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
#bordeCir{
  border-radius: 5px
}
</style>