<template>
  <div class="admin-container">
    <el-container style="height: 100vh">
      <el-header style="background-color: #001529; color: white; display: flex; justify-content: space-between; align-items: center;">
        <h1 style="margin: 0">校园OA系统 - 管理员控制台</h1>
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
            <el-menu-item index="user">
              <el-icon><user /></el-icon>
              <span>用户管理</span>
            </el-menu-item>
            <el-menu-item index="role">
              <el-icon><role /></el-icon>
              <span>角色管理</span>
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
import { ArrowDown, User, Role } from '@element-plus/icons-vue'

const router = useRouter()
const route = useRoute()
const activeMenu = ref('user')
const user = ref(JSON.parse(localStorage.getItem('user')))

onMounted(() => {
  // 初始化当前激活的菜单
  const path = route.path
  if (path.includes('/admin/user')) {
    activeMenu.value = 'user'
  } else if (path.includes('/admin/role')) {
    activeMenu.value = 'role'
  }
})

const handleMenuSelect = (key) => {
  activeMenu.value = key
  router.push(`/admin/${key}`)
}

const logout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  router.push('/login')
}
</script>

<style scoped>
.admin-container {
  height: 100vh;
}

.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
</style>
