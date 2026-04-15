<template>
  <div class="login-container">
    <div class="login-form">
      <h2>校园OA系统登录</h2>
      <el-form :model="loginForm" :rules="rules" ref="loginFormRef">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="loginForm.username" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="loginForm.password" type="password" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login" style="width: 100%">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

const router = useRouter()
const loginFormRef = ref(null)
const loginForm = reactive({
  username: '',
  password: ''
})

const rules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' }
  ]
}

const login = async () => {
  if (!loginFormRef.value) return
  await loginFormRef.value.validate(async (valid) => {
    if (valid) {
      // 使用模拟数据登录
      if (loginForm.username === 'admin' && loginForm.password === '123456') {
        const user = {
          id: 1,
          username: 'admin',
          name: '管理员',
          type: 0,
          status: 1
        }
        localStorage.setItem('token', 'mock_token')
        localStorage.setItem('user', JSON.stringify(user))
        router.push('/admin/user')
      } else if (loginForm.username === 'teacher' && loginForm.password === '123456') {
        const user = {
          id: 2,
          username: 'teacher',
          name: '张老师',
          type: 1,
          status: 1
        }
        localStorage.setItem('token', 'mock_token')
        localStorage.setItem('user', JSON.stringify(user))
        router.push('/teacher/course')
      } else if (loginForm.username === 'student' && loginForm.password === '123456') {
        const user = {
          id: 3,
          username: 'student',
          name: '李同学',
          type: 2,
          status: 1
        }
        localStorage.setItem('token', 'mock_token')
        localStorage.setItem('user', JSON.stringify(user))
        router.push('/student/course')
      } else {
        alert('用户名或密码错误')
      }
    }
  })
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f7fa;
}

.login-form {
  width: 400px;
  padding: 40px;
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.login-form h2 {
  text-align: center;
  margin-bottom: 30px;
  color: #303133;
}
</style>
