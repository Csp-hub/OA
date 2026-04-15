import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/admin',
    name: 'Admin',
    component: () => import('../views/admin/Admin.vue'),
    children: [
      {
        path: 'user',
        name: 'UserManagement',
        component: () => import('../views/admin/UserManagement.vue')
      },
      {
        path: 'role',
        name: 'RoleManagement',
        component: () => import('../views/admin/RoleManagement.vue')
      }
    ]
  },
  {
    path: '/teacher',
    name: 'Teacher',
    component: () => import('../views/teacher/Teacher.vue'),
    children: [
      {
        path: 'course',
        name: 'CourseManagement',
        component: () => import('../views/teacher/CourseManagement.vue')
      },
      {
        path: 'student',
        name: 'StudentManagement',
        component: () => import('../views/teacher/StudentManagement.vue')
      }
    ]
  },
  {
    path: '/student',
    name: 'Student',
    component: () => import('../views/student/Student.vue'),
    children: [
      {
        path: 'course',
        name: 'CourseQuery',
        component: () => import('../views/student/CourseQuery.vue')
      },
      {
        path: 'score',
        name: 'ScoreQuery',
        component: () => import('../views/student/ScoreQuery.vue')
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
