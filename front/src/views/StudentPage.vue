<template>
  <div class="student-page">
    <h1 class="title">Examen</h1>
    <p class="student-number">Numéro d'étudiant : {{ $route.params.id }}</p>
   
    <div class="question" v-for="(question, index) in questions" :key="index">
      <p class="question-text">{{ question.text }}</p>
      <input class="question-input" type="text" v-model="question.answer">
    </div>
     <button @click="stopServer">Soumettre les réponses</button>
    
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
     questions: [
    { text: "Quel est le nom du personnage principal dans le jeu 'The Legend of Zelda' ?", answer: "" },
    { text: "Dans quel jeu vidéo la ville de 'Los Santos' apparaît-elle ?", answer: "" },
    { text: "Quel est le nom du développeur de 'Minecraft' ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on incarner le Chasseur de Vampires, Geralt de Riv ?", answer: "" },
    { text: "Quel est le nom du vaisseau spatial emblématique dans la série 'Star Trek' ?", answer: "" },
    { text: "Qui est le créateur de la série de romans 'Le Trône de Fer', à l'origine de la série télévisée 'Game of Thrones' ?", answer: "" },
    { text: "Quelle est la célèbre saga de films de science-fiction créée par George Lucas ?", answer: "" },
    { text: "Quel est le nom de la principale société de développement de jeux vidéo japonaise, créatrice de franchises comme Mario, Zelda et Pokémon ?", answer: "" },
    { text: "Dans quel film trouve-t-on les personnages de Neo, Trinity et Morpheus, évoluant dans un monde virtuel ?", answer: "" },
    { text: "Quel est le nom du célèbre plombier italien créé par Nintendo ?", answer: "" },
    { text: "Dans quel jeu vidéo peut-on incarner un personnage nommé Lara Croft ?", answer: "" },
    { text: "Qui est le célèbre héros qui porte un costume de chauve-souris dans les bandes dessinées, les films et les jeux vidéo ?", answer: "" },
    { text: "Quel est le nom du robot célèbre dans la série de films 'Star Wars' ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on suivre les aventures de Nathan Drake, un chasseur de trésors ?", answer: "" },
    { text: "Quel est le nom du vaisseau spatial dans la série de films 'Star Wars' ?", answer: "" },
    { text: "Quelle est la principale ressource utilisée comme monnaie dans le jeu vidéo 'Minecraft' ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on incarner un personnage nommé Mario ?", answer: "" },
    { text: "Quel est le nom du célèbre sorcier créé par J.K. Rowling ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on incarner un héros appelé Link ?", answer: "" },
    { text: "Quel est le nom du célèbre jeu vidéo dans lequel des oiseaux en colère attaquent des cochons verts ?", answer: "" },
    { text: "Dans quel jeu vidéo peut-on incarner un personnage nommé Sonic ?", answer: "" },
    { text: "Quel est le nom de l'entreprise fictive qui produit les robots dans l'univers de 'Portal' ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on incarner un personnage appelé Master Chief ?", answer: "" },
    { text: "Quel est le nom du jeu vidéo populaire où les joueurs doivent survivre sur une île infestée de dinosaures ?", answer: "" },
    { text: "Dans quelle série de jeux vidéo peut-on incarner un personnage nommé Kratos, qui affronte des dieux et des monstres de la mythologie grecque ?", answer: "" }
    // Ajoutez plus de questions ici
]

    }
  },
methods: {
  async stopServer() {
     this.$router.push({ name: 'stop' });
    try {
      // Effectuer la requête HTTP
      const response = await axios.post('http://127.0.0.1:5000/stop-server');
      console.log(response.data);
    } catch (error) {
      console.error('Erreur lors de la requête HTTP :', error);
    }
  }
}
}
</script>

<style scoped>
.student-page {
  font-family: Arial, sans-serif;
  margin: 0 auto;
  max-width: 800px;
  padding: 20px;
}

.title, .quiz-title {
  color: #333;
  text-align: center;
}

.student-number {
  color: #666;
  font-size: 0.9em;
  margin-bottom: 20px;
  text-align: center;
}

.question {
  background-color: #f9f9f9;
  border-radius: 5px;
  margin-bottom: 10px;
  padding: 10px;
}

.question-text {
  font-weight: bold;
}

.question-input {
  border: 1px solid #ddd;
  border-radius: 5px;
  display: block;
  margin-top: 5px;
  padding: 5px;
  width: 100%;
}

.submit-button {
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  color: white;
  cursor: pointer;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 20px 0;
  transition-duration: 0.4s;
}

.submit-button:hover {
  background-color: #45a049;
}
</style>