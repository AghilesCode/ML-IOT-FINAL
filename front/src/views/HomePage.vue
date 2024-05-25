<template>
  <div id="app">
    <h1>Examen ML</h1>
    <label for="student-number">Numéro d'étudiant:</label>
    <input id="student-number" type="text" v-model="studentNumber">
     <router-view />
    <button @click="sendHttpRequest">Start</button>
    <!-- Le reste de votre application -->
  </div>
</template>

<script>
import axios from 'axios';

export default {
  methods: {
   async sendHttpRequest() {
  try {
    // Rediriger l'utilisateur vers une nouvelle route
    this.$router.push({ name: 'student' });

    // Attendre que la navigation soit terminée avant d'effectuer la requête HTTP
    await this.$nextTick();

    // Effectuer la requête HTTP
    const form = new FormData();
    form.append('student', '12345');
    const response = await axios.post('http://127.0.0.1:5000/start', form);
    console.log(response.data);
  } catch (error) {
    console.error('Erreur lors de la requête HTTP :', error);
  }
}

  }
};
</script>




<style scoped>
#app {
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

input {
  margin-top: 20px;
  padding: 10px;
  font-size: 16px;
}

button {
  margin-top: 20px;
  padding: 10px;
  font-size: 16px;
}
</style>
