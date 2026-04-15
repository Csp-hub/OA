<template>
  <div class="user-management">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>用户管理</span>
          <el-button type="primary" @click="dialogVisible = true">新增用户</el-button>
        </div>
      </template>
      <el-table :data="userList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="username" label="用户名"></el-table-column>
        <el-table-column prop="name" label="真实姓名"></el-table-column>
        <el-table-column prop="type" label="用户类型">
          <template #default="scope">
            {{ scope.row.type === 0 ? '管理员' : scope.row.type === 1 ? '教师' : '学生' }}
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态">
          <template #default="scope">
            <el-switch v-model="scope.row.status" active-value="1" inactive-value="0"></el-switch>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button type="primary" size="small" @click="editUser(scope.row)">编辑</el-button>
            <el-button type="danger" size="small" @click="deleteUser(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 新增/编辑用户对话框 -->
    <el-dialog v-model="dialogVisible" title="{{ isEdit ? '编辑用户' : '新增用户' }}">
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password" v-if="!isEdit">
          <el-input v-model="form.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="真实姓名" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="用户类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择用户类型">
            <el-option label="管理员" value="0"></el-option>
            <el-option label="教师" value="1"></el-option>
            <el-option label="学生" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-switch v-model="form.status" active-value="1" inactive-value="0"></el-switch>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="saveUser">保存</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import axios from 'axios'

const userList = ref([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)

const form = reactive({
  id: '',
  username: '',
  password: '',
  name: '',
  type: 0,
  status: 1
})

const rules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' }
  ],
  name: [
    { required: true, message: '请输入真实姓名', trigger: 'blur' }
  ],
  type: [
    { required: true, message: '请选择用户类型', trigger: 'change' }
  ]
}

onMounted(() => {
  getUsers()
})

const getUsers = async () => {
  // 实际项目中应该调用后端API
  // const response = await axios.get('/api/user/list')
  // userList.value = response.data.data
  // 模拟数据
  userList.value = [
    { id: 1, username: 'admin', password: '123456', name: '管理员', type: 0, status: 1, createTime: '2024-01-01 00:00:00' },
    { id: 2, username: 'teacher1', password: '123456', name: '张老师', type: 1, status: 1, createTime: '2024-01-01 00:00:00' },
    { id: 3, username: 'student1', password: '123456', name: '李同学', type: 2, status: 1, createTime: '2024-01-01 00:00:00' }
  ]
}

const editUser = (user) => {
  isEdit.value = true
  Object.assign(form, user)
  dialogVisible.value = true
}

const saveUser = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (valid) {
      // 实际项目中应该调用后端API
      // if (isEdit.value) {
      //   await axios.put('/api/user/update', form)
      // } else {
      //   await axios.post('/api/user/add', form)
      // }
      dialogVisible.value = false
      getUsers()
    }
  })
}

const deleteUser = async (id) => {
  // 实际项目中应该调用后端API
  // await axios.delete(`/api/user/delete/${id}`)
  getUsers()
}
</script>

<style scoped>
.user-management {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
