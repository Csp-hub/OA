<template>
  <div class="teacher-container">
    <el-container style="height: 100vh">
      <el-header style="background-color: #001529; color: white; display: flex; justify-content: space-between; align-items: center;">
        <h1 style="margin: 0">校园OA系统 - 教师工作台</h1>
        <el-dropdown>
          <span class="el-dropdown-link">
            {{ user.name }} <el-icon class="el-icon--right"><arrow-down /></el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-header>
      <el-container>
        <el-aside width="200px" style="background-color: #f0f2f5;">
          <el-menu :default-active="activeMenu" class="el-menu-vertical-demo" @select="handleMenuSelect">
            <el-menu-item index="course">
              <el-icon><document /></el-icon>
              <span>课程管理</span>
            </el-menu-item>
            <el-menu-item index="student">
              <el-icon><user /></el-icon>
              <span>学生管理</span>
            </el-menu-item>
          </el-menu>
        </el-aside>
        <el-main>
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ArrowDown, Document, User } from '@element-plus/icons-vue'

const router = useRouter()
const route = useRoute()
const activeMenu = ref('course')
const user = ref(JSON.parse(localStorage.getItem('user')))

onMounted(() => {
  // 初始化当前激活的菜单
  const path = route.path
  if (path.includes('/teacher/course')) {
    activeMenu.value = 'course'
  } else if (path.includes('/teacher/student')) {
    activeMenu.value = 'student'
  }
})

const handleMenuSelect = (key) => {
  activeMenu.value = key
  router.push(`/teacher/${key}`)
}

const logout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  router.push('/login')
}
</script>

<style scoped>
.teacher-container {
  height: 100vh;
}

.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
</style>
