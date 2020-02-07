<template>
  <footer class="fondoColor">
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          <ul v-for="(iglesia, index ) of iglesias" :key="index">
            <li>
              <p class="contacto">Contacto</p>
            </li>
            <li>
              <img src="@/assets/llamada.png" class="margen" alt />{{iglesia.telefono}}</li>
            <li>
              <img src="@/assets/whatsapp.png" class="margen" alt />{{iglesia.whatsapp}}</li>
            <li>
              <img src="@/assets/email.png" class="margen" alt />{{iglesia.email}}</li>
            <li>
              <img src="@/assets/adress.png" class="margen" alt />{{iglesia.direccion}}</li>
          </ul>
        </div>
        <div class="col-sm-4">
          <ul>
            <li class="visitanos">
              <a href="https://www.facebook.com/ucenuevaluzironcollo/">
                <i class="fab fa-facebook-square a"></i> Visítanos
              </a>
            </li>
            <li class="textCenter">
              <img class="cuadRedon" src="@/assets/NUEVA_LUZ.jpg" alt width="60%" />
            </li>
          </ul>
        </div>
        <div class="col-sm-4">
            <p class="contacto colorTituloPie">Servicios</p>
            <ul class="sinMargenTB" v-for="(reunion, index ) of reunionesIglesia" :key="index">
                <li ><b>{{reunion.dia}}</b></li>
                <li class="margin-left">{{reunion.titulo}}: {{reunion.hora_inicio}} - {{reunion.hora_fin}}</li>
            </ul>
            <br>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    iglesias: [],
    reunionesIglesia: []
  }),
  created() {
    this.obtenerIglesia();
    this.obtenerReunionesIglesia();
    console.log("ejecutando obtenerIglesia");
    //this.getList()
  },
  methods: {
    async obtenerIglesia() {
            try {
                const respuesta = await axios.get('http://localhost:3000/iglesia');
                this.iglesias = respuesta.data;
            } catch (error) {
                console.log('error al conectar al api: ',error);
            }
        },
    /*getList() {
      axios
        .get("http://localhost:8080/iglesia")
        .then(response => {
          console.log(response.data);
          this.iglesias = response.data;
        })
        .catch(error => console.log(error));
    }*/
    async obtenerReunionesIglesia() {
            try {
                const respuesta = await axios.get('http://localhost:3000/reunion_iglesia');
                this.reunionesIglesia = respuesta.data;
            } catch (error) {
                console.log('error al conectar al api: ',error);
            }
        }
  }
};
</script>

<style>
.fondoColor {
  background-color: rgb(0, 31, 58);
}
ul {
  list-style-type: none;
}
li {
  text-align: left;
  color: rgb(0, 124, 217);
  font-size: 14px;
}
.margen {
  margin-right: 5px;
  margin-top: 15px
}
.contacto {
  font-size: 16px;
  font-weight: bold;
  margin-left: 20px;
  margin-top: 25px;
}
.a {
  font-size: 30px;
}
.cuadRedon {
  border-radius: 20px;
  margin-top: 10px;
}
.visitanos {
  font-size: 16px;
  font-weight: bold;
  margin-top: 15px;
  margin-left: 15px;
  text-align: center
}
.margin-left{
    margin-left: 30px;
}
.colorTituloPie {
  text-align: center;
  color: rgb(0, 124, 217);
}
.sinMargenTB{
    margin-top: 0;
    margin-bottom: 0
}
.textCenter{
    text-align: center
}
</style>