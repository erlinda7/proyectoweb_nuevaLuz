import Vue from 'vue'
import VueRouter from 'vue-router'
import Inicio from '../views/Inicio.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Inicio',
    component: Inicio
  },
  {
    path: '/NuevaLuz_Historia',
    name: 'NuevaLuz_Historia',
    component: () => import('../views/NuevaLuz_Historia.vue')
  },
  {
    path: '/NuevaLuz_QuienesSomos',
    name: 'NuevaLuz_QuienesSomos',
    component: () => import('../views/NuevaLuz_QuienesSomos.vue')
  },
  {
    path: '/NuevaLuz_Liderazgo',
    name: 'NuevaLuz_Liderazgo',
    component: () => import('../views/NuevaLuz_Liderazgo.vue')
  },
  {
    path: '/Ministerios',
    name: 'Ministerios',
    component: () => import('../views/Ministerios.vue')
  },
  {
    path: '/Ministerio_Descripcion/:id',
    name: 'Ministerio_Descripcion',
    component: () => import('../views/Ministerio_Descripcion.vue')
  },
  {
    path: '/Directorio',
    name: 'Directorio',
    component: () => import('../views/Directorio.vue')
  },
  {
    path: '/Publicaciones',
    name: 'Publicaciones',
    component: () => import('../views/Publicaciones.vue')
  },
  {
    path: '/Contacto',
    name: 'Contacto',
    component: () => import('../views/Contacto.vue')
  },
  {
    path: '/AdministrarEvento',
    name: 'AdministrarEvento',
    component: () => import('../views/AdministrarEvento.vue'),
    meta:{requiresAuth: true}
  },
  {
    path: '/AdministrarMinisterio',
    name: 'AdministrarMinisterio',
    component: () => import('../views/AdministrarMinisterio.vue')
  },
  {
    path: '/AdministrarMiembro',
    name:'AdministrarMiembro',
    component: () => import('../views/AdministrarMiembro.vue')
  },
  {
    path: '/Login',
    name:'Login',
    component: () => import('../views/Login')
  },


]



const router = new VueRouter({
//  mode: 'history',
  base: process.env.BASE_URL,
  routes,
  scrollBehavior () {
    return { x: 0, y: 0 }
  }
  
})



router.beforeEach((to, from, next) => {
  console.log(to.matched.some(record => record.meta.requiresAuth));
  let usuario = false
  
  if(to.matched.some(record => record.meta.requiresAuth)){
      if(usuario){
        next()
      }else{
        next('/Login')
      }
  }else{
    next();
  }
  
})

// router.beforeEach((to, from, next) => {
//   console.log(to.matched.some(record => record.meta.requiresAuth));
//   //let usuario = false
//   console.log(router.app.$auth.isAuthenticated(), 'consumienooooooooooo');
  
//   if(to.matched.some(record => record.meta.requiresAuth)){
//       if(router.app.$auth.isAuthenticated()){
//         next()
//       }else{
//         next('/Login')
//       }
//   }else{
//     next();
//   }
  
// })

export default router