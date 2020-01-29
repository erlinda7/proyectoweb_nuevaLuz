<template>
  <div id="app" class="fondocolor">
    <navbar/>
    <router-view/>
    <piepagina/>
  </div>
</template>
<script>
import navbar from '@/components/navbar'
import piepagina from './components/piepagina'

export default {
   components: {
     navbar,
     piepagina,
   },
}
</script>>
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
.fondocolor{
  background-color: rgb(251,251,226)
}
</style>
