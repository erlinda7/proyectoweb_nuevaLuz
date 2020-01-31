<template>
  <div class="container principal">
    <div class="contacto">
      <div class="container">
        <div class="row">
          <div class="col-sm" v-for="(iglesia, index ) of iglesias" :key="index">
            <h1 class="titulo">
              Union Cristiana Evangelica
              <span>"{{iglesia.nombre}}"</span>
            </h1>
            <ul class="lista">
              <li>
                <img src="@/assets/llamada.png" class="margen" alt />
                <p class="texto">{{iglesia.telefono}}</p>
              </li>
              <li>
                <img src="@/assets/whatsapp.png" class="margen" alt />
                <p class="texto">{{iglesia.whatsapp}}</p>
              </li>
              <li>
                <img src="@/assets/email.png" class="margen" alt />
                <p class="texto">{{iglesia.email}}</p>
              </li>
              <li>
                <img src="@/assets/adress.png" class="margen" alt />
                <p class="texto">{{iglesia.direccion}}</p>
              </li>
            </ul>
          </div>
          <div class="col-sm imagen">
            <img src="@/assets/iglesiacontacto2.jpeg" alt width="100%" />
          </div>
        </div>
        <div class="row ">
          <div class="col-sm mapa">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3808.103799429662!2d-66.2863191860438!3d-17.358737588095725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x93e30aff63d3579b%3A0x9d86b21882f93f4!2sIglesia%20UCE.%20NUEVA%20LUZ%20Ironcollo!5e0!3m2!1ses!2sbo!4v1579893806933!5m2!1ses!2sbo"
              width="99%"
              height="600px"
              frameborder="1px"
              style="border:1px  rgb(0, 31, 58) dashed ;"
              allowfullscreen
            ></iframe>
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
    iglesias: []
  }),
  computed:{
    ...mapState(['url'])
  },
  created() {
    this.obtenerIglesia();
  },
  methods: {
    async obtenerIglesia() {
      try {
        const respuesta = await axios.get(this.url+"/iglesia");
        this.iglesias = respuesta.data;
      } catch (error) {
        console.log("error al conectar al api: ", error);
      }
    }
  }
};
</script>

<style>
.principal .contacto {
  margin-top: 100px;
}
.contacto .lista {
  list-style-type: none;
  margin-top: 50px;
}
.contacto .lista li {
  padding-bottom: 10px;
  padding-top: 10px;
  position: relative;
}
.contacto .lista img {
  margin-right: 15px;
  float: left;
  margin-top: 0;
}
.contacto .texto {
  text-align: left;
  color: black;
  font-size: 18px;
  padding-left: 30px;
  font-weight: normal;
}
.titulo {
  color: rgb(0, 31, 58);
  font-size: 40px;
  font-family: "serif", Times New Roman, Times;
  padding: 5px;
  margin-bottom: 25px;
  font-weight: bold;
}
.contacto .mapa {
  margin-top: 100px;
  margin-bottom: 100px;
}
</style>