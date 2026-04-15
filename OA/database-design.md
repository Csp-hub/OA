# 校园OA系统数据库表结构设计

## 1. 数据库表结构

### 1.1 用户表（user）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 用户ID |
| username | VARCHAR | 50 | UNIQUE, NOT NULL | 用户名 |
| password | VARCHAR | 100 | NOT NULL | 密码（加密存储） |
| name | VARCHAR | 50 | NOT NULL | 真实姓名 |
| type | TINYINT | 1 | NOT NULL | 用户类型（0:管理员, 1:教师, 2:学生） |
| status | TINYINT | 1 | NOT NULL DEFAULT 1 | 状态（0:禁用, 1:启用） |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.2 角色表（role）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 角色ID |
| role_name | VARCHAR | 50 | UNIQUE, NOT NULL | 角色名称 |
| role_code | VARCHAR | 50 | UNIQUE, NOT NULL | 角色编码 |
| description | VARCHAR | 255 | - | 角色描述 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.3 权限表（permission）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 权限ID |
| perm_name | VARCHAR | 50 | UNIQUE, NOT NULL | 权限名称 |
| perm_code | VARCHAR | 50 | UNIQUE, NOT NULL | 权限编码 |
| url | VARCHAR | 255 | - | 访问路径 |
| parent_id | BIGINT | 20 | DEFAULT 0 | 父权限ID |
| type | TINYINT | 1 | NOT NULL | 权限类型（0:菜单, 1:按钮） |
| sort | INT | 10 | DEFAULT 0 | 排序 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.4 用户角色关联表（user_role）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 关联ID |
| user_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 用户ID |
| role_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 角色ID |

### 1.5 角色权限关联表（role_permission）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 关联ID |
| role_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 角色ID |
| perm_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 权限ID |

### 1.6 班级表（class）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 班级ID |
| class_name | VARCHAR | 50 | UNIQUE, NOT NULL | 班级名称 |
| grade | VARCHAR | 20 | NOT NULL | 年级 |
| major | VARCHAR | 50 | NOT NULL | 专业 |
| teacher_id | BIGINT | 20 | FOREIGN KEY | 班主任ID |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.7 学生表（student）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 学生ID |
| user_id | BIGINT | 20 | UNIQUE, NOT NULL, FOREIGN KEY | 用户ID |
| student_no | VARCHAR | 20 | UNIQUE, NOT NULL | 学号 |
| class_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 班级ID |
| gender | TINYINT | 1 | NOT NULL | 性别（0:男, 1:女） |
| birthday | DATE | - | - | 出生日期 |
| phone | VARCHAR | 11 | - | 手机号码 |
| email | VARCHAR | 50 | - | 邮箱 |
| address | VARCHAR | 255 | - | 地址 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.8 教师表（teacher）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 教师ID |
| user_id | BIGINT | 20 | UNIQUE, NOT NULL, FOREIGN KEY | 用户ID |
| teacher_no | VARCHAR | 20 | UNIQUE, NOT NULL | 工号 |
| department | VARCHAR | 50 | NOT NULL | 部门 |
| title | VARCHAR | 50 | - | 职称 |
| gender | TINYINT | 1 | NOT NULL | 性别（0:男, 1:女） |
| birthday | DATE | - | - | 出生日期 |
| phone | VARCHAR | 11 | - | 手机号码 |
| email | VARCHAR | 50 | - | 邮箱 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.9 课程表（course）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 课程ID |
| course_name | VARCHAR | 100 | NOT NULL | 课程名称 |
| course_code | VARCHAR | 50 | UNIQUE, NOT NULL | 课程编码 |
| credits | DECIMAL | 3,1 | NOT NULL | 学分 |
| hours | INT | 10 | NOT NULL | 课时 |
| description | VARCHAR | 255 | - | 课程描述 |
| status | TINYINT | 1 | NOT NULL DEFAULT 1 | 状态（0:禁用, 1:启用） |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.10 教师课程关联表（teacher_course）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 关联ID |
| teacher_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 教师ID |
| course_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 课程ID |
| semester | VARCHAR | 20 | NOT NULL | 学期 |
| year | VARCHAR | 10 | NOT NULL | 学年 |

### 1.11 学生课程关联表（student_course）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 关联ID |
| student_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 学生ID |
| course_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 课程ID |
| semester | VARCHAR | 20 | NOT NULL | 学期 |
| year | VARCHAR | 10 | NOT NULL | 学年 |
| status | TINYINT | 1 | NOT NULL DEFAULT 1 | 状态（0:未修, 1:修读中, 2:已修完） |

### 1.12 课程班级关联表（course_class）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 关联ID |
| course_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 课程ID |
| class_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 班级ID |
| semester | VARCHAR | 20 | NOT NULL | 学期 |
| year | VARCHAR | 10 | NOT NULL | 学年 |

### 1.13 成绩表（score）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 成绩ID |
| student_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 学生ID |
| course_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 课程ID |
| teacher_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 教师ID |
| score | DECIMAL | 5,2 | NOT NULL | 分数 |
| semester | VARCHAR | 20 | NOT NULL | 学期 |
| year | VARCHAR | 10 | NOT NULL | 学年 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.14 请假表（leave）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 请假ID |
| student_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 学生ID |
| start_time | DATETIME | - | NOT NULL | 开始时间 |
| end_time | DATETIME | - | NOT NULL | 结束时间 |
| reason | VARCHAR | 255 | NOT NULL | 请假原因 |
| status | TINYINT | 1 | NOT NULL DEFAULT 0 | 状态（0:待审批, 1:已通过, 2:已拒绝） |
| approver_id | BIGINT | 20 | FOREIGN KEY | 审批人ID |
| approval_time | DATETIME | - | - | 审批时间 |
| approval_remark | VARCHAR | 255 | - | 审批备注 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

### 1.15 公告表（announcement）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 公告ID |
| title | VARCHAR | 100 | NOT NULL | 公告标题 |
| content | TEXT | - | NOT NULL | 公告内容 |
| type | TINYINT | 1 | NOT NULL | 公告类型（0:系统公告, 1:校园新闻, 2:活动通知） |
| publisher_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 发布人ID |
| publish_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 发布时间 |
| expire_time | DATETIME | - | - | 过期时间 |
| status | TINYINT | 1 | NOT NULL DEFAULT 1 | 状态（0:下架, 1:上架） |

### 1.16 审批流程表（approval）
| 字段名 | 数据类型 | 长度 | 约束 | 描述 |
|-------|---------|------|------|------|
| id | BIGINT | 20 | PRIMARY KEY, AUTO_INCREMENT | 审批ID |
| applicant_id | BIGINT | 20 | NOT NULL, FOREIGN KEY | 申请人ID |
| type | TINYINT | 1 | NOT NULL | 审批类型（0:请假, 1:报销, 2:采购） |
| title | VARCHAR | 100 | NOT NULL | 审批标题 |
| content | TEXT | - | NOT NULL | 审批内容 |
| status | TINYINT | 1 | NOT NULL DEFAULT 0 | 状态（0:待审批, 1:已通过, 2:已拒绝） |
| approver_id | BIGINT | 20 | FOREIGN KEY | 审批人ID |
| approval_time | DATETIME | - | - | 审批时间 |
| approval_remark | VARCHAR | 255 | - | 审批备注 |
| create_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP | 创建时间 |
| update_time | DATETIME | - | NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 更新时间 |

## 2. 数据库关系图（ER图）

```mermaid
erDiagram
    USER ||--o{ USER_ROLE : has
    ROLE ||--o{ USER_ROLE : has
    ROLE ||--o{ ROLE_PERMISSION : has
    PERMISSION ||--o{ ROLE_PERMISSION : has
    USER ||--o{ STUDENT : is
    USER ||--o{ TEACHER : is
    STUDENT ||--o{ STUDENT_COURSE : takes
    STUDENT ||--o{ SCORE : receives
    STUDENT ||--o{ LEAVE : submits
    TEACHER ||--o{ TEACHER_COURSE : teaches
    TEACHER ||--o{ SCORE : gives
    TEACHER ||--o{ CLASS : manages
    COURSE ||--o{ TEACHER_COURSE : taught_by
    COURSE ||--o{ STUDENT_COURSE : taken_by
    COURSE ||--o{ COURSE_CLASS : offered_to
    COURSE ||--o{ SCORE : evaluated_in
    CLASS ||--o{ STUDENT : contains
    CLASS ||--o{ COURSE_CLASS : has
    USER ||--o{ ANNOUNCEMENT : publishes
    USER ||--o{ APPROVAL : applies
    USER ||--o{ APPROVAL : approves
```

## 3. 数据库初始化脚本

### 3.1 创建数据库
```sql
CREATE DATABASE campus_oa DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 3.2 创建表结构
（此处省略具体的CREATE TABLE语句，可根据上述表结构设计生成）

### 3.3 初始化数据
- 初始化管理员账号
- 初始化基础角色（管理员、教师、学生）
- 初始化基础权限

## 4. 技术说明

### 4.1 数据类型选择
- 使用BIGINT作为ID字段类型，支持更大的数值范围
- 使用VARCHAR存储字符串类型数据，根据实际需求设置合理长度
- 使用DATETIME存储时间类型数据，支持精确到秒的时间记录
- 使用DECIMAL存储分数、学分等需要精确计算的数值

### 4.2 索引设计
- 为所有表的主键创建聚集索引
- 为常用查询字段（如username、student_no、teacher_no等）创建唯一索引
- 为外键字段创建普通索引，提高关联查询效率

### 4.3 约束设计
- 所有表都设置了主键约束
- 对唯一标识字段设置了唯一约束
- 对必填字段设置了非空约束
- 对关联字段设置了外键约束，保证数据一致性

### 4.4 性能优化
- 合理设计表结构，避免冗余字段
- 适当创建索引，提高查询效率
- 使用合适的数据类型，减少存储空间
- 避免使用复杂的SQL语句，优化查询性能