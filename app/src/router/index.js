import { createWebHistory, createRouter } from "vue-router";
import HomePage from '@/pages/HomePage.vue'
import LoginPage from '@/pages/LoginPage.vue'
import RegisterPage from '@/pages/RegisterPage.vue'

const routes = [
    {path: '/', component: HomePage, name: 'home'},
    {path: '/login', component: LoginPage, name: 'login'},
    {path: '/register', component: RegisterPage, name: 'register'},
];

export const router = createRouter({
    history: createWebHistory(),
    routes
});