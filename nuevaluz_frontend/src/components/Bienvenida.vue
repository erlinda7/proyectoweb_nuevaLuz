<template>
  <div class="container">
    <div class="bienvenida">
      <h1 class="separacion letra">BIENVENIDA</h1>
      <div class="row">
        <div class="col-sm-4">
          <img id="bordeCir" src="@/assets/fotoiglesia.jpg" class="img-fluid" alt="Responsive image" height="500px"/>
        </div>
        <div class="col-sm-8 borde letra">
          <h2 class="bordeArriba">Union Cristiana Evangelica "Nueva Luz"</h2>
          <p class="parrafo"> Los evangélicos o protestantes nos sentimos herederos del cristianismo del primer siglo, aunque como movimiento religioso nacemos en la Reforma que sacudió Europa en el siglo XVI. La Iglesia se había alejado de la pureza del evangelio. Los que no estaban de acuerdo con la jerarquía, las indulgencias, el celibato, la idolatría, etc., y querían un cristianismo auténtico,
            se independizaron de Roma y fueron después conocidos como protestantes o evangélicos. </p>
          <p class="parrafo"> Somos una comunidad cristiana que cree y proclama la verdad del Evangelio de Jesucristo,
            que sólo en Él hay salvación y vida eterna. </p>
        </div>
      </div>
      <img src="@/assets/separador.png" class="img-fluid" alt="Responsive image" width="50%">
      <div id="fondoRosas" class="row separacion">
          <div class="col-2">
              
          </div>
        <div class="col-8 borde letra">
          <h2 class="bordeArriba">Reunión Dominical</h2>
          <p class="parrafo"> Nuestra reunión dominical es una oportunidad para congregarnos como Iglesia y celebrar a
            nuestro Señor por medio de canciones, oraciones y la predicación de su Palabra. </p>
          <h2 class="bordeArriba">Predicación de la palabra</h2>
          <p class="parrafo"> Nuestro pastor presenta cada semana un mensaje fiel al texto bíblico en el que
            el Evangelio es predicado y nuestras vidas son confrontadas. </p>
          <h2 class="bordeArriba">Comunión</h2>
          <p class="parrafo"> Celebramos la cena del Señor una vez al mes el primer domingo. También tenemos
            bautismos y participamos de la oración y las ofrendas cada semana. </p>
          <p class="versiculo">Marcos 16:15 </p>
          <div class="row justify-content-end"> 
            <div class="col-sm-4 parrafoVer">
              <p>Y les dijo: Id por todo el mundo y predicad el evangelio a toda criatura.</p>
            </div>
          </div>
        </div>
        <div class="col-2">
              
          </div>
      </div>
    </div>

    
  </div>
</template>

<script>
export default {};
</script>

<style>
.separacion{
    margin-top: 10px;
    margin-bottom:  10px;
}
.borde{
    border-radius: 5px;
    border: 1px solid blue;
    background-image: url('../assets/fondoRosa.png')
}
.letra{
    font-family: 'Times New Roman', Times, serif;
}
.bordeArriba{
    margin-top: 30px;
    font-weight: bold;
}
.parrafo{
    text-align: justify;
}
.versiculo{
    text-align: right;
    font-weight: bold;
    margin-right: 25px;
}
.parrafoVer{
    text-align: justify;
}
#fondoRosas{
    background-image: url('../assets/florRosaVertical.jpg')
}
</style>