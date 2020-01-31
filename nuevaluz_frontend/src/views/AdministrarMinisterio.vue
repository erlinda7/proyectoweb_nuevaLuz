<template>
  <div class="container">
      <br>
      <h5>Gestionar Ministerio</h5>
      <br>
      <br>
      <!--Formulario de Creacion de Nuevo Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onSubmit" v-if="show">
                  <b-form-group id="input-group-3" label="Imagen de Ministerio" label-for="input-3">
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-3" label-for="input-3">
                    <b-form inline>
                      <b-form-input v-model="exito" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-3" label="Foto del Responsable" label-for="input-3">
                    <b-form-file  v-model="file2" :state="Boolean(file)" placeholder="Ingresa foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-3" label-for="input-3">
                    <b-form inline>
                      <b-form-input v-model="exito2" disabled></b-form-input>
                      <b-button variant="primary" v-on:click="enviarFoto()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Nombre del Ministerio" label-for="input-1">
                    <b-form-input id="input-1" v-model="form.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Lema del ministerio" label-for="input-1" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-1" v-model="form.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   

                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="form.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>

                  <b-form-group id="input-group-2" label="Ubicacion del ministerio" label-for="input-2">
                    <b-form-input id="input-2" v-model="form.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  
                  <b-form-group id="input-group-1" label="Nombre completo del Responsable" label-for="input-1">
                    <b-form-input id="input-1" v-model="form.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="E-mail del Responsable" label-for="input-1" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-1" v-model="form.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Telefono o Celular del Responsable" label-for="input-1">
                    <b-form-input id="input-1" v-model="form.telefono" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>

                  <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div>
                    <b-button type="submit" variant="primary">Crear Ministerio</b-button>
              </b-form>
          </div>
      </div>
      <!--Formulario de Modificacion de Ministerio-->
      <div class="row justify-content-center">
          <div class="col-sm-6">
              <b-form @submit="onSubmit" v-if="!show">
                  <b-form-group id="input-group-3" label="Imagen de Ministerio" label-for="input-3">
                    <b-form-file  v-model="file" :state="Boolean(file)" placeholder="Ingresa Imagen" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-3" label-for="input-3">
                    <b-form inline>
                      <b-form-input v-model="exito" required disabled ></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar Imagen</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-3" label="Foto del Responsable" label-for="input-3">
                    <b-form-file  v-model="file2" :state="Boolean(file)" placeholder="Ingresa foto sin fondo" drop-placeholder="Drop file here...">
                    </b-form-file>
                  </b-form-group>

                  <b-form-group id="input-group-3" label-for="input-3">
                    <b-form inline>
                      <b-form-input v-model="exito2" disabled></b-form-input>
                      <b-button variant="primary" v-on:click="enviarImagen()">Guardar foto</b-button>
                  </b-form>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Nombre del Ministerio" label-for="input-1">
                    <b-form-input id="input-1" v-model="ministerio.nombre" required placeholder="Ingresa un nombre">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Lema del ministerio" label-for="input-1" description="El lema no debe contener mas de 10 palabras">
                    <b-form-input id="input-1" v-model="ministerio.lema" required placeholder="Ingresa un lema" >
                    </b-form-input>
                  </b-form-group>   

                  <b-form-group label="Descripcion del Ministerio" label-for="textarea-formatter" description="La descripcion debe contener entre 4 a 6 filas">
                     <b-form-textarea id="textarea-formatter" v-model="ministerio.descripcion" placeholder="Ingresa la descripcion" required>
                     </b-form-textarea>
                  </b-form-group>

                  <b-form-group id="input-group-2" label="Ubicacion del ministerio" label-for="input-2">
                    <b-form-input id="input-2" v-model="ministerio.lugar" required placeholder="Ingresa la ubicacion">
                    </b-form-input>
                  </b-form-group>
                  
                  <b-form-group id="input-group-1" label="Nombre completo del Responsable" label-for="input-1">
                    <b-form-input id="input-1" v-model="ministerio.responsable" required placeholder="Ingresa el nombre completo">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="E-mail del Responsable" label-for="input-1" description="En caso de no tener colocar 'sin correo'">
                    <b-form-input id="input-1" v-model="ministerio.email" required placeholder="Ingresa el E-mail">
                    </b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-1" label="Telefono o Celular del Responsable" label-for="input-1">
                    <b-form-input id="input-1" v-model="ministerio.telefono" required placeholder="Ingresa el Tel o Cel">
                    </b-form-input>
                  </b-form-group>

                  <div class="mt-3">Selecciona: {{ file ? file.name : '' }}</div>
                    <b-button type="submit" variant="primary">Crear Ministerio</b-button>
              </b-form>
          </div>
      </div>
      <!--Lista de Ministerios-->
      <div>
          <h5>Lista de Ministerios</h5>
      </div>
      <div>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Actualizar</th>
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(evento,index) of eventos" :key="index">
            <th scope="row">{{evento.titulo}}</th>
            <td><button class="btn btn-warning" v-on:click="cargarDatos(evento)" >Modificar</button></td>
            <td><button class="btn btn-danger" v-on:click="eliminarEvento(evento.id_evento)" >Eliminar</button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
    data() {
      return {
        exito: '',
        exito2: '',
        imagenes:{},
        file: null,
        file2: null,
        form: {
          nombre: '',
          lema:'',
          descripcion: '',
          lugar: '',
          responsable: '',
          email:'',
          telefono:''
        },
        ministerio:{
          id_ministerio: 0,
          nombre: '',
          lema:'',
          descripcion: '',
          lugar: '',
          responsable: '',
          email:'',
          telefono:'',
          foto:'',
          imagen: '',
          id_iglesia: 1
        },
        ministerios: [],
        show: true
      }
    }
}
</script>

<style>

</style>