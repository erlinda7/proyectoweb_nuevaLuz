<template>
  <div>
    <nuevaLuzCarrusel/>
    <div class="container">
    <div class="misionvision misionYvision">
      <br>
      <br>
      <br>
      <br>
      <div class="row justify-content-md-center">
      <div class="col-sm-6 ">
      <h1>VISION</h1>
      <p class="parrafo"> Ser una iglesia fiel y comprometida con Dios, siendo agentes de transformación plena de nuestra sociedad. </p>
      <h1>MISION</h1>
      <p class="parrafo"> Existe para cumplir la gran comisión mediante la evangelización, discipulado y el servicio, por amor y obediencia para la gloria de Dios.</p>
      </div>
      </div>
    </div>
    <div class="valores">
      <h1 class="misionYvision">NUESTROS VALORES</h1>
      <br>
      <br>
      <div class="container">

        <div  class="row row-cols-1 row-cols-md-2">
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Amor</div>
              <div class="card-body">
                <p class="card-text cardText">
                  El amor a Dios demostrada objetivamente es nuestra señal,
                  esta misma que se refleja en el amor al prójimo,
                  expresada con acciones concretas.
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Integridad</div>
              <div class="card-body">
                <p class="card-text cardText">
                  Nuestro objetivo es mantenernos íntegros en nuestra manera de vivir,
                  cultivar y aplicar una ética cristiana
                  en cualquier circunstancia y lugar.
                </p>
              </div>
            </div>
            </div>
        </div>
        <br>
        <div class="row row-cols-1 row-cols-md-2">
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Responsabilidad</div>
              <div class="card-body">
                <p class="card-text cardText" >
                  La responsabilidad tiene que ver con nuestro compromiso con Dios y su ministerio, por tanto,
                  nos esforzaremos para que nuestras acciones y/o responsabilidades sean el resultado de
                  nuestro compromiso con Dios y su obra.
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Familia</div>
              <div class="card-body">
                <p class="card-text cardText">
                  La familia nuclear es el pilar esencial de la iglesia y sociedad, por tanto, nos corresponde
                  priorizar esfuerzos para nutrir a nuestras familias tanto nuclear como la extendida. Sin embargo,
                  creemos también que como comunidad cristiana somos una familia que procuramos
                  el bien común los unos a los otros.
                </p>
              </div>
            </div>
          </div>
        </div>
        <br>
        <div class="row row-cols-1 row-cols-md-2">
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Solidaridad</div>
              <div class="card-body">
                <p class="card-text cardText">
                  La solidaridad es una acción de colaboración mutua entre las personas, por tanto, buscamos y aplicamos acciones
                  de solidaridad entre los miembros de la iglesia, así también en beneficio de cualquier persona o comunidad
                  que así lo requiera, según nuestras posibilidades.
                </p>
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card border-light mb-3" style="max-width: 30rem; margin:auto">
              <div class="card-header cardTitulo">Mayordomía</div>
              <div class="card-body">
                <p class="card-text cardText">
                  Reconocemos que somos administradores de los recursos del Señor y la vida
                  de las personas. Somos conscientes que Dios demanda que seamos buenos administradores
                  de aquello que es suyo. Todos los miembros ejercitamos nuestros dones y talentos para el
                  servicio de Dios y edificación de la iglesia.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </div>
</template>

<script>
import nuevaLuzCarrusel from '@/components/nuevaLuzCarrusel.vue'
export default {
  components:{
    nuevaLuzCarrusel
  }
};
</script>

<style>
.misionYvision{
  color: rgb(0, 31, 58);
  text-align: center;
  font-family: "serif", Times New Roman, Times;
}
.misionYvision .parrafo{
  border-left: 10px solid yellow;
  padding-left: 20px;
  margin-bottom: 80px
}
.cardTitulo{
  background-color: rgb(0, 31, 58);
  color: wheat;
  font-weight: bold;
  font-family: 'Times New Roman', Times, serif;
  font-size: 20px
  
}
.cardText{
  text-align: justify;
  font-family: 'Times New Roman', Times, serif;
  font-size: 16px
}
</style>