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
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
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
    path: '/Ministerio_Juvenil',
    name: 'Ministerio_Juvenil',
    component: () => import('../views/Ministerio_Juvenil.vue')
  },
  {
    path: '/Ministerio_Prejuvenil',
    name: 'Ministerio_Prejuvenil',
    component: () => import('../views/Ministerio_Prejuvenil.vue')
  },
  {
    path: '/Ministerio_Misioneros',
    name: 'Ministerio_Misioneros',
    component: () => import('../views/Ministerio_Misioneros.vue')
  },
  {
    path: '/Ministerio_Evangelistas',
    name: 'Ministerio_Evangelistas',
    component: () => import('../views/Ministerio_Evangelistas.vue')
  },
  {
    path: '/Ministerio_Tesoritos',
    name: 'Ministerio_Tesoritos',
    component: () => import('../views/Ministerio_Tesoritos.vue')
  },
  {
    path: '/Ministerio_Joyitas',
    name: 'Ministerio_Joyitas',
    component: () => import('../views/Ministerio_Joyitas.vue')
  },
  {
    path: '/Ministerio_HoritaFeliz',
    name: 'Ministerio_HoritaFeliz',
    component: () => import('../views/Ministerio_HoritaFeliz.vue')
  },
  {
    path: '/Ministerio_Oanza',
    name: 'Ministerio_Oanza',
    component: () => import('../views/Ministerio_Oanza.vue')
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
    path:'/Login',
    name:'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path:'/Administracion',
    name:'Administracion',
    component: () => import('../views/Administracion.vue')
  }
]

const router = new VueRouter({
//  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
