import Vue from 'vue'

let auth = new Vue({
    data(){
        return{
            estado:false ,  //existe o no existe
            id_usuario: 2
        }
    },
    methods: {
        isAuthenticated() {
            return this.estado
        },
        token(mensaje){
            this.estado= mensaje
           console.log(this.estado, "-----mensaje desde login");
           
        },
        guardarIdUsuario(id_usuario){
            this.id_usuario = id_usuario
        },
        obtenerIdUsuario(){
            return this.id_usuario
        }
    }

})

export default {
    install: function(Vue) {
      Vue.prototype.$auth = auth
    }
  }