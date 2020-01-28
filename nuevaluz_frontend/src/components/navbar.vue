<template>
  <header id="linea">
    <nav class="navbar navbar-expand-lg navbar-light fondoNav">
      <img src="@/assets/NUEVA_LUZ_FOND_TRANS.png" alt width="7%" />
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li id="colorTamañoLetra" class="nav-item active">
            <router-link id="colorTamañoLetra" class="nav-link" to="/">
              INICIO
              <span class="sr-only">(current)</span>
            </router-link>
          </li>
          <li id="colorTamañoLetra" class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="colorTamañoLetra"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >NUEVA LUZ</a>
            <div id="fondoDrop" class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link
                id="colorTamañoLetra"
                class="dropdown-item"
                to="/NuevaLuz_Historia"
              >HISTORIA</router-link>
              <router-link
                id="colorTamañoLetra"
                class="dropdown-item"
                to="/NuevaLuz_QuienesSomos"
              >QUIENES SOMOS</router-link>
              <router-link
                id="colorTamañoLetra"
                class="dropdown-item"
                to="/NuevaLuz_Liderazgo"
              >LIDERAZGO</router-link>
            </div>
          </li>
          <li id="colorTamañoLetra" class="nav-item">
            <router-link id="colorTamañoLetra" class="nav-link" to="/Ministerios">MINISTERIOS</router-link>
          </li>
          <li id="colorTamañoLetra" class="nav-item">
            <router-link id="colorTamañoLetra" class="nav-link" to="/Directorio">DIRECTORIO</router-link>
          </li>
          <li id="colorTamañoLetra" class="nav-item">
            <router-link id="colorTamañoLetra" class="nav-link" to="/Publicaciones">PUBLICACIONES</router-link>
          </li>
          <li id="colorTamañoLetra" class="nav-item">
            <router-link id="colorTamañoLetra" class="nav-link" to="/Contacto">CONTACTO</router-link>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
export default {};
</script>

<style>
.fondoNav {
  background-color: rgb(251, 251, 226);
}
#fondoDrop {
  background-color: rgb(251, 251, 226);
}
#colorTamañoLetra {
  color: rgb(0, 31, 58);
  font-size: 19px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  padding-left: 15px;
}
#colorTamañoLetra :hover {
  color: rgb(66, 111, 150);
}
#linea {
  border-bottom: 2px solid rgb(0, 31, 58);
}
</style>