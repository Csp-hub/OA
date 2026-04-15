-- 创建数据库
CREATE DATABASE IF NOT EXISTS campus_oa DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE campus_oa;

-- 创建用户表
CREATE TABLE IF NOT EXISTS user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    type TINYINT NOT NULL COMMENT '0:管理员, 1:教师, 2:学生',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '0:禁用, 1:启用',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建角色表
CREATE TABLE IF NOT EXISTS role (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    role_code VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255),
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建权限表
CREATE TABLE IF NOT EXISTS permission (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    perm_name VARCHAR(50) UNIQUE NOT NULL,
    perm_code VARCHAR(50) UNIQUE NOT NULL,
    url VARCHAR(255),
    parent_id BIGINT DEFAULT 0,
    type TINYINT NOT NULL COMMENT '0:菜单, 1:按钮',
    sort INT DEFAULT 0,
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建用户角色关联表
CREATE TABLE IF NOT EXISTS user_role (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- 创建角色权限关联表
CREATE TABLE IF NOT EXISTS role_permission (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role_id BIGINT NOT NULL,
    perm_id BIGINT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (perm_id) REFERENCES permission(id)
);

-- 创建班级表
CREATE TABLE IF NOT EXISTS class (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) UNIQUE NOT NULL,
    grade VARCHAR(20) NOT NULL,
    major VARCHAR(50) NOT NULL,
    teacher_id BIGINT,
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES user(id)
);

-- 创建学生表
CREATE TABLE IF NOT EXISTS student (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNIQUE NOT NULL,
    student_no VARCHAR(20) UNIQUE NOT NULL,
    class_id BIGINT NOT NULL,
    gender TINYINT NOT NULL COMMENT '0:男, 1:女',
    birthday DATE,
    phone VARCHAR(11),
    email VARCHAR(50),
    address VARCHAR(255),
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (class_id) REFERENCES class(id)
);

-- 创建教师表
CREATE TABLE IF NOT EXISTS teacher (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNIQUE NOT NULL,
    teacher_no VARCHAR(20) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL,
    title VARCHAR(50),
    gender TINYINT NOT NULL COMMENT '0:男, 1:女',
    birthday DATE,
    phone VARCHAR(11),
    email VARCHAR(50),
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- 创建课程表
CREATE TABLE IF NOT EXISTS course (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(50) UNIQUE NOT NULL,
    credits DECIMAL(3,1) NOT NULL,
    hours INT NOT NULL,
    description VARCHAR(255),
    status TINYINT NOT NULL DEFAULT 1 COMMENT '0:禁用, 1:启用',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建教师课程关联表
CREATE TABLE IF NOT EXISTS teacher_course (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    teacher_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year VARCHAR(10) NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- 创建学生课程关联表
CREATE TABLE IF NOT EXISTS student_course (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year VARCHAR(10) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1 COMMENT '0:未修, 1:修读中, 2:已修完',
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- 创建课程班级关联表
CREATE TABLE IF NOT EXISTS course_class (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    class_id BIGINT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year VARCHAR(10) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (class_id) REFERENCES class(id)
);

-- 创建成绩表
CREATE TABLE IF NOT EXISTS score (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    teacher_id BIGINT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year VARCHAR(10) NOT NULL,
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

-- 创建请假表
CREATE TABLE IF NOT EXISTS leave (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    reason VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL DEFAULT 0 COMMENT '0:待审批, 1:已通过, 2:已拒绝',
    approver_id BIGINT,
    approval_time DATETIME,
    approval_remark VARCHAR(255),
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (approver_id) REFERENCES user(id)
);

-- 创建公告表
CREATE TABLE IF NOT EXISTS announcement (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    type TINYINT NOT NULL COMMENT '0:系统公告, 1:校园新闻, 2:活动通知',
    publisher_id BIGINT NOT NULL,
    publish_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expire_time DATETIME,
    status TINYINT NOT NULL DEFAULT 1 COMMENT '0:下架, 1:上架',
    FOREIGN KEY (publisher_id) REFERENCES user(id)
);

-- 创建审批流程表
CREATE TABLE IF NOT EXISTS approval (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    applicant_id BIGINT NOT NULL,
    type TINYINT NOT NULL COMMENT '0:请假, 1:报销, 2:采购',
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    status TINYINT NOT NULL DEFAULT 0 COMMENT '0:待审批, 1:已通过, 2:已拒绝',
    approver_id BIGINT,
    approval_time DATETIME,
    approval_remark VARCHAR(255),
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (applicant_id) REFERENCES user(id),
    FOREIGN KEY (approver_id) REFERENCES user(id)
);

-- 插入初始数据
-- 插入管理员用户
INSERT INTO user (username, password, name, type, status) VALUES ('admin', '123456', '管理员', 0, 1);

-- 插入角色
INSERT INTO role (role_name, role_code, description) VALUES ('管理员', 'admin', '系统管理员');
INSERT INTO role (role_name, role_code, description) VALUES ('教师', 'teacher', '教师角色');
INSERT INTO role (role_name, role_code, description) VALUES ('学生', 'student', '学生角色');

-- 插入权限
INSERT INTO permission (perm_name, perm_code, url, parent_id, type, sort) VALUES ('系统管理', 'system', '/admin', 0, 0, 1);
INSERT INTO permission (perm_name, perm_code, url, parent_id, type, sort) VALUES ('用户管理', 'user', '/admin/user', 1, 0, 1);
INSERT INTO permission (perm_name, perm_code, url, parent_id, type, sort) VALUES ('角色管理', 'role', '/admin/role', 1, 0, 2);

-- 关联用户角色
INSERT INTO user_role (user_id, role_id) VALUES (1, 1);

-- 关联角色权限
INSERT INTO role_permission (role_id, perm_id) VALUES (1, 1);
INSERT INTO role_permission (role_id, perm_id) VALUES (1, 2);
INSERT INTO role_permission (role_id, perm_id) VALUES (1, 3);
