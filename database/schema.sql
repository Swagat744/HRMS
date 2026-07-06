-- =========================================================
-- HRMS Database Schema (MySQL)
-- =========================================================
DROP DATABASE IF EXISTS hrms_db;
CREATE DATABASE hrms_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE hrms_db;

-- ---------------------------------------------------------
-- companies
-- ---------------------------------------------------------
CREATE TABLE companies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  prefix VARCHAR(10) NOT NULL,          -- e.g. "OI" for Odoo India
  logo_url VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- users (auth identity)
-- ---------------------------------------------------------
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  login_id VARCHAR(50) NOT NULL UNIQUE,     -- auto generated e.g. OIJODO20260001
  email VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('admin','hr','employee') NOT NULL DEFAULT 'employee',
  is_email_verified BOOLEAN NOT NULL DEFAULT FALSE,
  is_temp_password BOOLEAN NOT NULL DEFAULT TRUE,
  account_status ENUM('active','inactive','suspended') NOT NULL DEFAULT 'active',
  last_login DATETIME DEFAULT NULL,
  company_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_users_company FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE,
  INDEX idx_users_email (email),
  INDEX idx_users_login_id (login_id)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- employees (job/company profile)
-- ---------------------------------------------------------
CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL UNIQUE,
  company_id INT NOT NULL,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  job_position VARCHAR(120) DEFAULT NULL,
  department VARCHAR(120) DEFAULT NULL,
  manager_id INT DEFAULT NULL,
  location VARCHAR(120) DEFAULT NULL,
  profile_picture_url VARCHAR(255) DEFAULT NULL,
  date_of_joining DATE DEFAULT NULL,
  employee_code VARCHAR(50) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_employees_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_employees_company FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE,
  CONSTRAINT fk_employees_manager FOREIGN KEY (manager_id) REFERENCES employees(id) ON DELETE SET NULL,
  INDEX idx_employees_department (department)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- employee_resume (About / Skills / Certifications / Experience)
-- ---------------------------------------------------------
CREATE TABLE employee_resume (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL UNIQUE,
  about TEXT,
  what_i_love TEXT,
  interests TEXT,
  skills JSON,
  certifications JSON,
  experience JSON,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_resume_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- employee_private_information
-- ---------------------------------------------------------
CREATE TABLE employee_private_information (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL UNIQUE,
  date_of_birth DATE DEFAULT NULL,
  gender ENUM('male','female','other') DEFAULT NULL,
  nationality VARCHAR(80) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  personal_email VARCHAR(150) DEFAULT NULL,
  marital_status ENUM('single','married','other') DEFAULT NULL,
  pan_no VARCHAR(20) DEFAULT NULL,
  uan_no VARCHAR(30) DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_private_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- employee_bank_details
-- ---------------------------------------------------------
CREATE TABLE employee_bank_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL UNIQUE,
  bank_name VARCHAR(120) DEFAULT NULL,
  account_number VARCHAR(40) DEFAULT NULL,
  ifsc_code VARCHAR(20) DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_bank_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- attendance
-- ---------------------------------------------------------
CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  work_date DATE NOT NULL,
  check_in DATETIME DEFAULT NULL,
  check_out DATETIME DEFAULT NULL,
  work_hours DECIMAL(5,2) DEFAULT 0,
  extra_hours DECIMAL(5,2) DEFAULT 0,
  status ENUM('present','absent','half_day','leave','late') NOT NULL DEFAULT 'absent',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_attendance_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
  UNIQUE KEY uq_employee_date (employee_id, work_date),
  INDEX idx_attendance_date (work_date)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- leave_requests
-- ---------------------------------------------------------
CREATE TABLE leave_requests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  leave_type ENUM('paid','sick','unpaid') NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  remarks VARCHAR(255) DEFAULT NULL,
  attachment_url VARCHAR(255) DEFAULT NULL,
  status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  reviewed_by INT DEFAULT NULL,
  review_comment VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_leave_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
  CONSTRAINT fk_leave_reviewer FOREIGN KEY (reviewed_by) REFERENCES employees(id) ON DELETE SET NULL,
  INDEX idx_leave_status (status)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- salary (wage + working config per employee)
-- ---------------------------------------------------------
CREATE TABLE salary (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL UNIQUE,
  monthly_wage DECIMAL(12,2) NOT NULL DEFAULT 0,
  yearly_wage DECIMAL(12,2) NOT NULL DEFAULT 0,
  working_days_per_week TINYINT NOT NULL DEFAULT 5,
  break_hours DECIMAL(4,2) NOT NULL DEFAULT 1.00,
  employee_pf_percent DECIMAL(5,2) NOT NULL DEFAULT 12.00,
  employer_pf_percent DECIMAL(5,2) NOT NULL DEFAULT 12.00,
  professional_tax DECIMAL(10,2) NOT NULL DEFAULT 200.00,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_salary_employee FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- salary_components (Basic, HRA, Standard Allowance, Bonus, LTA, Fixed)
-- ---------------------------------------------------------
CREATE TABLE salary_components (
  id INT AUTO_INCREMENT PRIMARY KEY,
  salary_id INT NOT NULL,
  component_name ENUM('basic','hra','standard_allowance','performance_bonus','leave_travel_allowance','fixed_allowance') NOT NULL,
  computation_type ENUM('fixed','percentage') NOT NULL DEFAULT 'percentage',
  value DECIMAL(10,2) NOT NULL DEFAULT 0,     -- % or fixed amount depending on type
  computed_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_component_salary FOREIGN KEY (salary_id) REFERENCES salary(id) ON DELETE CASCADE,
  UNIQUE KEY uq_salary_component (salary_id, component_name)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- notifications
-- ---------------------------------------------------------
CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(150) NOT NULL,
  message VARCHAR(255) NOT NULL,
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_notification_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_notifications_user (user_id, is_read)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- activity_logs
-- ---------------------------------------------------------
CREATE TABLE activity_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT DEFAULT NULL,
  action VARCHAR(150) NOT NULL,
  details VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_activity_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- email_verification_tokens
-- ---------------------------------------------------------
CREATE TABLE email_verification_tokens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expires_at DATETIME NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_evt_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- password_reset_tokens
-- ---------------------------------------------------------
CREATE TABLE password_reset_tokens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expires_at DATETIME NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_prt_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
