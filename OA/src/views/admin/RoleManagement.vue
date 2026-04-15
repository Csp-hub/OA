<template>
  <div class="role-management">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>角色管理</span>
          <el-button type="primary" @click="dialogVisible = true">新增角色</el-button>
        </div>
      </template>
      <el-table :data="roleList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="roleName" label="角色名称"></el-table-column>
        <el-table-column prop="roleCode" label="角色编码"></el-table-column>
        <el-table-column prop="description" label="角色描述"></el-table-column>
        <el-table-column prop="createTime" label="创建时间"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button type="primary" size="small" @click="editRole(scope.row)">编辑</el-button>
            <el-button type="danger" size="small" @click="deleteRole(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 新增/编辑角色对话框 -->
    <el-dialog v-model="dialogVisible" title="{{ isEdit ? '编辑角色' : '新增角色' }}">
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item label="角色名称" prop="roleName">
          <el-input v-model="form.roleName"></el-input>
        </el-form-item>
        <el-form-item label="角色编码" prop="roleCode">
          <el-input v-model="form.roleCode"></el-input>
        </el-form-item>
        <el-form-item label="角色描述" prop="description">
          <el-input v-model="form.description" type="textarea"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="saveRole">保存</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'

const roleList = ref([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)

const form = reactive({
  id: '',
  roleName: '',
  roleCode: '',
  description: ''
})

const rules = {
  roleName: [
    { required: true, message: '请输入角色名称', trigger: 'blur' }
  ],
  roleCode: [
    { required: true, message: '请输入角色编码', trigger: 'blur' }
  ]
}

onMounted(() => {
  getRoles()
})

const getRoles = () => {
  // 模拟数据
  roleList.value = [
    { id: 1, roleName: '管理员', roleCode: 'admin', description: '系统管理员', createTime: '2024-01-01 00:00:00' },
    { id: 2, roleName: '教师', roleCode: 'teacher', description: '教师角色', createTime: '2024-01-01 00:00:00' },
    { id: 3, roleName: '学生', roleCode: 'student', description: '学生角色', createTime: '2024-01-01 00:00:00' }
  ]
}

const editRole = (role) => {
  isEdit.value = true
  Object.assign(form, role)
  dialogVisible.value = true
}

const saveRole = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (valid) {
      dialogVisible.value = false
      getRoles()
    }
  })
}

const deleteRole = (id) => {
  getRoles()
}
</script>

<style scoped>
.role-management {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
