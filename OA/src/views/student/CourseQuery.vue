<template>
  <div class="course-query">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>课程查询</span>
        </div>
      </template>
      <el-table :data="courseList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="courseName" label="课程名称"></el-table-column>
        <el-table-column prop="courseCode" label="课程编码"></el-table-column>
        <el-table-column prop="credits" label="学分"></el-table-column>
        <el-table-column prop="hours" label="课时"></el-table-column>
        <el-table-column prop="teacher" label="授课教师"></el-table-column>
        <el-table-column prop="semester" label="学期"></el-table-column>
        <el-table-column prop="year" label="学年"></el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const courseList = ref([])

onMounted(() => {
  getCourses()
})

const getCourses = async () => {
  // 实际项目中应该调用后端API
  // const response = await axios.get('/api/student/courses')
  // courseList.value = response.data.data
  // 模拟数据
  courseList.value = [
    { id: 1, courseName: '高等数学', courseCode: 'MATH001', credits: 4.0, hours: 64, teacher: '张老师', semester: '第一学期', year: '2024-2025' },
    { id: 2, courseName: '大学物理', courseCode: 'PHYS001', credits: 3.0, hours: 48, teacher: '李老师', semester: '第一学期', year: '2024-2025' },
    { id: 3, courseName: '计算机基础', courseCode: 'COMP001', credits: 2.0, hours: 32, teacher: '王老师', semester: '第二学期', year: '2024-2025' }
  ]
}
</script>

<style scoped>
.course-query {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
