<template>
  <div class="score-query">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>成绩查询</span>
        </div>
      </template>
      <el-table :data="scoreList" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="courseName" label="课程名称"></el-table-column>
        <el-table-column prop="score" label="成绩"></el-table-column>
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

const scoreList = ref([])

onMounted(() => {
  getScores()
})

const getScores = async () => {
  // 实际项目中应该调用后端API
  // const response = await axios.get('/api/student/scores')
  // scoreList.value = response.data.data
  // 模拟数据
  scoreList.value = [
    { id: 1, courseName: '高等数学', score: 85.5, teacher: '张老师', semester: '第一学期', year: '2023-2024' },
    { id: 2, courseName: '大学物理', score: 90.0, teacher: '李老师', semester: '第一学期', year: '2023-2024' },
    { id: 3, courseName: '计算机基础', score: 95.0, teacher: '王老师', semester: '第二学期', year: '2023-2024' }
  ]
}
</script>

<style scoped>
.score-query {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
