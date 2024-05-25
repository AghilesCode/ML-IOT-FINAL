import { createRouter, createWebHistory } from 'vue-router'

import StudentPage from './views/StudentPage.vue'
import HomePage from './views/HomePage.vue'
import StopPage from './views/StopPage.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomePage // Utilisez le composant HomePage pour la route correspondant à "/"
  },

  {
    path: '/student',
    name: 'student',
    component: StudentPage
  },
  {
    path: '/stop',
    name: 'stop',
    component: StopPage
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router