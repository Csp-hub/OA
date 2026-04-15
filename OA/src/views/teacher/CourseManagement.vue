<template>
  <div class="course-management">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>课程管理</span>
          <el-button type="primary" @click="dialogVisible = true">新增课程</el-button>
        </div>
      </template>
      <el-table :data="courseList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="courseName" label="课程名称"></el-table-column>
        <el-table-column prop="courseCode" label="课程编码"></el-table-column>
        <el-table-column prop="credits" label="学分"></el-table-column>
        <el-table-column prop="hours" label="课时"></el-table-column>
        <el-table-column prop="status" label="状态">
          <template #default="scope">
            {{ scope.row.status === 1 ? '启用' : '禁用' }}
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button type="primary" size="small" @click="editCourse(scope.row)">编辑</el-button>
            <el-button type="danger" size="small" @click="deleteCourse(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 新增/编辑课程对话框 -->
    <el-dialog v-model="dialogVisible" title="{{ isEdit ? '编辑课程' : '新增课程' }}">
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item label="课程名称" prop="courseName">
          <el-input v-model="form.courseName"></el-input>
        </el-form-item>
        <el-form-item label="课程编码" prop="courseCode">
          <el-input v-model="form.courseCode"></el-input>
        </el-form-item>
        <el-form-item label="学分" prop="credits">
          <el-input v-model="form.credits" type="number"></el-input>
        </el-form-item>
        <el-form-item label="课时" prop="hours">
          <el-input v-model="form.hours" type="number"></el-input>
        </el-form-item>
        <el-form-item label="课程描述" prop="description">
          <el-input v-model="form.description" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-switch v-model="form.status" active-value="1" inactive-value="0"></el-switch>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="saveCourse">保存</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import axios from 'axios'

const courseList = ref([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)

const form = reactive({
  id: '',
  courseName: '',
  courseCode: '',
  credits: 0,
  hours: 0,
  description: '',
  status: 1
})

const rules = {
  courseName: [
    { required: true, message: '请输入课程名称', trigger: 'blur' }
  ],
  courseCode: [
    { required: true, message: '请输入课程编码', trigger: 'blur' }
  ],
  credits: [
    { required: true, message: '请输入学分', trigger: 'blur' }
  ],
  hours: [
    { required: true, message: '请输入课时', trigger: 'blur' }
  ]
}

onMounted(() => {
  getCourses()
})

const getCourses = async () => {
  // 实际项目中应该调用后端API
  // const response = await axios.get('/api/course/list')
  // courseList.value = response.data.data
  // 模拟数据
  courseList.value = [
    { id: 1, courseName: '高等数学', courseCode: 'MATH001', credits: 4.0, hours: 64, description: '高等数学基础课程', status: 1, createTime: '2024-01-01 00:00:00' },
    { id: 2, courseName: '大学物理', courseCode: 'PHYS001', credits: 3.0, hours: 48, description: '大学物理基础课程', status: 1, createTime: '2024-01-01 00:00:00' },
    { id: 3, courseName: '计算机基础', courseCode: 'COMP001', credits: 2.0, hours: 32, description: '计算机基础知识', status: 1, createTime: '2024-01-01 00:00:00' }
  ]
}

const editCourse = (course) => {
  isEdit.value = true
  Object.assign(form, course)
  dialogVisible.value = true
}

const saveCourse = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (valid) {
      // 实际项目中应该调用后端API
      // if (isEdit.value) {
      //   await axios.put('/api/course/update', form)
      // } else {
      //   await axios.post('/api/course/add', form)
      // }
      dialogVisible.value = false
      getCourses()
    }
  })
}

const deleteCourse = async (id) => {
  // 实际项目中应该调用后端API
  // await axios.delete(`/api/course/delete/${id}`)
  getCourses()
}
</script>

<style scoped>
.course-management {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
