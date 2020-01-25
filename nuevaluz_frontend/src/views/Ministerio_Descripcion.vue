<template>
  <div>
    <p>vista Femenil---///Aqui se implementara todas vitas de descrpcion ministerios por id</p>
    
    <div v-for="(ministerio,index) in filtrarMinisterioId()" :key="index">
      <p>id_ministerio:{{ministerio.id_ministerio}}</p>
      <p>Titulo:{{ministerio.nombre}}</p>
      <p>descripcion:{{ministerio.descripcion}}</p>
      <p>lugar:{{ministerio.lugar}}</p>
      <p>nombre_responsable:{{ministerio.nombre_responsable}}</p>
      <p>email:{{ministerio.email}}</p>
      <p>telefono:{{ministerio.telefono}}</p>
      <img :src="require('@/fotos/' + ministerio.foto)" alt="imagen" width="20%" />
      <br />
      <br />
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
      }
    },
    obtenerId() {
      this.id = 1;   //implementar parmas.id
      return this.id;
    },
    filtrarMinisterioId() {
      return (this.ministerioSeleccionado = this.ministerios.filter(
        ministerio => ministerio.id_ministerio === this.obtenerId()
      ));
    }
  }
};
</script>


<style>
</style>