<template>
  <div class="student-management">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>学生管理</span>
        </div>
      </template>
      <el-table :data="studentList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="studentNo" label="学号"></el-table-column>
        <el-table-column prop="name" label="姓名"></el-table-column>
        <el-table-column prop="className" label="班级"></el-table-column>
        <el-table-column prop="gender" label="性别">
          <template #default="scope">
            {{ scope.row.gender === 0 ? '男' : '女' }}
          </template>
        </el-table-column>
        <el-table-column prop="phone" label="电话"></el-table-column>
        <el-table-column prop="email" label="邮箱"></el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const studentList = ref([])

onMounted(() => {
  getStudents()
})

const getStudents = () => {
  // 模拟数据
  studentList.value = [
    { id: 1, studentNo: '2024001', name: '李同学', className: '计算机一班', gender: 0, phone: '13800138001', email: 'li@example.com' },
    { id: 2, studentNo: '2024002', name: '王同学', className: '计算机一班', gender: 1, phone: '13800138002', email: 'wang@example.com' },
    { id: 3, studentNo: '2024003', name: '张同学', className: '计算机二班', gender: 0, phone: '13800138003', email: 'zhang@example.com' }
  ]
}
</script>

<style scoped>
.student-management {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
