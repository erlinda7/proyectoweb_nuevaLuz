import Vue from 'vue'

let auth = new Vue({
    data(){
        return{
            estado:false   //existe o no existe
        }
    },
    methods: {
        isAuthenticated() {
            return this.estado
        },
        token(mensaje){
            this.estado= mensaje
           //console.log(this.estado, "-----mensaje desde login");
        }
    }

})

export default {
    install: function(Vue) {
      Vue.prototype.$auth = auth
    }
  }