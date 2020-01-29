<template>
  <div>
    <nuevaLuzCarrusel />
    <div class="container">
      <h1 class="tituloHistoria">Asi Comienza Nuestra Historia</h1>
      <div class="row historia">
        <div class="col-sm-5">
          <img class="img-fluid" src="@/assets/IglesiaConstruccion.jpg" alt />
          <br>
          <p>Construccion de la Iglesia "Nueva Luz"</p>
          <br>
          <br>
          <br>
          <br>
          <img class="img-fluid" src="@/assets/IglesiaConstruccion2.jpg" alt />
          <br>
          <p>Iglesia "Nueva luz" Gestión 2008</p>
        </div>
        <div class="col-sm-7 parrafo">
          <p>
            En los años 1996 y 1997 se abrió como una avanzada de la iglesia Nueva Sinaí de Quillacollo,
            en casa del hermano Filiberto Quintana, posteriormente se organizó como Iglesia el año 1999
            con 3 ancianos de la Iglesia Madre Sinaí, con una membrecía de 38 miembros.
          </p>
          <p>
            En el año 2000 fue aprobado en la asamblea nacional de la UCE. Como la iglesia Nueva Luz
            de Ironcollo y posteriormente fueron elegidos los siguientes Líderes de la iglesia:
            Anciano: Luis Duran - Diáconos: Crescencio Quintana - Tesorero: Florencio Quispe -
            Secretario: Sabino Aguilar.
          </p>
          <p>
            De esta forma encamino bajo la Voluntad del Señor
            En el año 1999 y 2000 fue el primer pastor Víctor Barra
          </p>
          <p>
            Al siguiente año 2001 fue como obrero el Pastor Juan Velazco
            Con las Bendiciones de Nuestro Señor Jesucristo el año
            2002 llego el Misionero Jorge Haugen juntamente con su amada
            esposa Juanita Nailor de EEUU.
          </p>
          <p>
            Al siguiente año 2003 a 2009 se hizo cargo como pastor Esteban
            Huallpa y su amada esposa. También dentro de eses años surgió
            la idea de comprar un terreno juntamente con el Pastor, Misionero
            y los respectivos líderes y miembros de la iglesia.
            Y de esa forma se adquirió el terreno y se dio la construcción
            del Centro Kausaj Yaku y posteriormente la Iglesia.
          </p>
          <p>
            Como proyecto de la obra social funcionó Kausaj Yaku en la comunidad con 4 arias:
            Apoyo a los niños necesitados, Capacitación a líderes de Iglesias de área Rural,
            Enseñanza de tejidos a mujeres la comunidad, Formación de computación Básica.
          </p>
          <p>Durante estos años la asistencia general en la escuela dominical fue de 100 a 150 hermanos.</p>
          <p>
            Hoy por hoy somos una iglesia constituida para proclamar el evangelio de Jesucristo
            a las naciones, con más de 300 personas congregadas fielmente domingo a domingo,
            donde han pasado muchos líderes y pastores, tiene consolidado varios ministerios que funcionan con normalidad:
            Escuela Dominical – Femenil – Juvenil – Oansa – Prejuvenil – Horita Feliz.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import nuevaLuzCarrusel from "@/components/nuevaLuzCarrusel.vue";
export default {
  components: {
    nuevaLuzCarrusel
  }
};
</script>

<style>
.titulo{
  margin-top: 25px;
  margin-bottom: 25px; 
}
.historia .parrafo{
  text-align: justify;
  font-family: 'Times New Roman', Times, serif;
  font-size: 17px
}
.container .tituloHistoria{
  color: rgb(0, 31, 58);
  font-size: 40px;
  font-weight: bold;
  font-family: "serif", Times New Roman, Times;
  padding-top: 80px;
  padding-bottom: 60px;
}

</style>