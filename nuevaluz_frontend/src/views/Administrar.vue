<template>
<div class="container">
    <h4>Gestionar</h4>
    <br>
    <br>
  <div class="row">
      <div class="col-sm">
          <h5>Gestionar Miembro</h5>
      </div>
      <div class="col-sm">
          <router-link to="/AdministrarMiembro"><button class="btn btn-primary">Ir al formulario de Miembro</button></router-link>
      </div>
  </div>
  <br>
  <br>
  <div class="row">
      <div class="col-sm">
          <h5>Gestionar Ministerio</h5>
      </div>
      <div class="col-sm">
          <router-link to="/AdministrarMinisterio"><button class="btn btn-primary">Ir al formulario de Ministerio</button></router-link>
      </div>
  </div>
  <br>
  <br>
  <div class="row">
      <div class="col-sm">
          <h5>Gestionar Evento</h5>
      </div>
      <div class="col-sm">
          <router-link to="/AdministrarEvento"><button class="btn btn-primary">Ir al formulario de Evento</button></router-link>
      </div>
  </div>
  <br>
  <br>
  <div class="row">
      <div class="col-sm">
          <h5>Gestionar Administrador</h5>
      </div>
      <div class="col-sm">
          <router-link to="/AdministrarAdmin"><button class="btn btn-primary">Ir al formulario de Administrador</button></router-link>
      </div>
  </div>
  <br>
  <br>
</div>
</template>

<script>
export default {

}
</script>

<style>

</style>