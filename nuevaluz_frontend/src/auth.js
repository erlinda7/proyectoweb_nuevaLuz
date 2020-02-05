import Vue from 'vue'

let auth = new Vue({
    methods: {
        isAuthenticated() {
            return true
        },
    }

})

export default {
    install: function(Vue) {
      Vue.prototype.$auth = auth
    }
  }