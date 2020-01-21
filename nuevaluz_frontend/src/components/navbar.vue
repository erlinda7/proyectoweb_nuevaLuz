<template>
  <header>
      <nav class="navbar navbar-expand-lg navbar-light fondoNav">
        <img src="@/assets/NUEVA_LUZ_FOND_TRANS.png" alt="" width="7%">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">INICIO<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          NUEVA LUZ
        </a>
        <div id="fondoDrop" class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">HISTORIA</a>
          <a class="dropdown-item" href="#">QUIENES SOMOS</a>
          <a class="dropdown-item" href="#">LIDERAZGO</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">MINISTERIOS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">DIRECTORIO</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PUBLICACIONES</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">CONTACTO</a>
      </li>
    </ul>
  </div>
</nav>
  </header>
</template>

<script>
export default {

}
</script>

<style>
.fondoNav{
    background-color: rgb(235,220,161);
}
#fondoDrop{
    background-color: rgb(235,220,161);
}

</style>