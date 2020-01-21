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
        <router-link class="nav-link" to="/">INICIO<span class="sr-only">(current)</span></router-link>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          NUEVA LUZ
        </a>
        <div id="fondoDrop" class="dropdown-menu" aria-labelledby="navbarDropdown">
          <router-link class="dropdown-item" to="/NuevaLuz_Historia">HISTORIA</router-link>
          <router-link class="dropdown-item" to="/NuevaLuz_QuienesSomos">QUIENES SOMOS</router-link>
          <router-link class="dropdown-item" to="/NuevaLuz_Liderazgo">LIDERAZGO</router-link>
        </div>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" to="/Ministerios">MINISTERIOS</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" to="/Directorio">DIRECTORIO</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" to="/Publicaciones">PUBLICACIONES</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" to="/Contacto">CONTACTO</router-link>
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
    background-color: rgb(251,251,226);
}
#fondoDrop{
    background-color: rgb(251,251,226);
}

</style>