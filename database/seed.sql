-- =========================================================
-- HRMS Seed Data
-- Auto-generated realistic dataset: 1 company, 1 Admin, 1 HR,
-- and 35 employees across 8 departments, with attendance history
-- and sample leave requests.
--
-- LOGIN CREDENTIALS (all emails use the pattern first.last@company.com)
--   Admin : admin@hrms.com        / Admin@123
--   HR    : hr.officer@company.com / Hr@12345
--   All other employees share the temporary password: Welcome@123
--   (see the printed list in docs/SEED_CREDENTIALS.md for every login ID)
-- =========================================================
USE hrms_db;

INSERT INTO companies (id, name, prefix, logo_url) VALUES
(1, 'Odoo India', 'OI', NULL);

-- ---------- Admin ----------
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (1, 'OIADUS20240001', 'admin@hrms.com', '$2b$10$hjHO7K.Umkxvg4rK1Yx19uNDDLqLzfuN/ktKEr1pD4ePN4/h4iE0u', 'admin', TRUE, FALSE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, location, date_of_joining, employee_code)
VALUES (1, 1, 1, 'Admin', 'User', '9000000001', 'System Administrator', 'Human Resources', 'Mumbai, India', '2024-01-01', 'EMP0001');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (1, 150000.00, 1800000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'basic', 'percentage', 50, 75000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'hra', 'percentage', 50, 75000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'standard_allowance', 'percentage', 16.67, 25005);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'performance_bonus', 'percentage', 8.33, 12495);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'leave_travel_allowance', 'percentage', 8.33, 12495);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (1, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (1, '1988-05-15', 'male', 'Indian', 'Mumbai, Maharashtra', 'admin.personal@example.com', 'married', 'ADMIN1234F', '100200300400');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (1, 'HDFC Bank', '123456789012', 'HDFC0001234');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (1, 'Experienced HR and systems administrator overseeing company-wide operations.', 'Building great workplaces.', 'Reading, chess, travelling',
  JSON_ARRAY('People Management','Systems Administration','Payroll'),
  JSON_ARRAY('SHRM-CP'),
  JSON_ARRAY(JSON_OBJECT('company','PrevCorp','role','HR Manager','years','2019-2024')));

-- ---------- HR Officer (id 2) ----------
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (2, 'OIHROF20240001', 'hr.officer@company.com', '$2b$10$71ahrArMAx17mznq/Jjdd.MzOc.5N0O2i2a4mrj5ha6YgO4ZTAnGi', 'hr', TRUE, FALSE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, location, date_of_joining, employee_code)
VALUES (2, 2, 1, 'Kavita', 'Rao', '9000000002', 'HR Manager', 'Human Resources', 'Mumbai, India', '2024-02-01', 'EMP0002');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (2, 95000.00, 1140000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'basic', 'percentage', 50, 47500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'hra', 'percentage', 50, 47500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'standard_allowance', 'percentage', 16.67, 15837);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'performance_bonus', 'percentage', 8.33, 7914);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'leave_travel_allowance', 'percentage', 8.33, 7914);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (2, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (2, '1991-08-22', 'female', 'Indian', 'Andheri, Mumbai', 'kavita.personal@example.com', 'married', 'KAVIT5678R', '200300400500');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (2, 'ICICI Bank', '223456789013', 'ICIC0002345');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (2, 'HR professional focused on employee engagement and talent development.', 'Helping teams grow and thrive.', 'Yoga, painting',
  JSON_ARRAY('Recruitment','Employee Relations','HRIS','Onboarding'),
  JSON_ARRAY('SHRM-CP'),
  JSON_ARRAY(JSON_OBJECT('company','TalentWorks','role','HR Executive','years','2018-2024')));

-- Nikhil Desai (Engineering)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (3, 'OINIDE20260003', 'nikhil.desai@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (3, 3, 1, 'Nikhil', 'Desai', '9702760637', 'Engineering Manager', 'Engineering', NULL, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 628 DAY), 'EMP0003');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (3, 171000.00, 2052000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'basic', 'percentage', 50, 85500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'hra', 'percentage', 50, 85500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'standard_allowance', 'percentage', 16.67, 28506);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'performance_bonus', 'percentage', 8.33, 14244);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'leave_travel_allowance', 'percentage', 8.33, 14244);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (3, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (3, '1994-03-25', 'female', 'Indian', 'Pune, India', 'nikhil.personal@example.com', 'single', 'NDESA3875C', '133695292240');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (3, 'Kotak Mahindra Bank', '538965925620', 'KOTA0828120');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (3, 'Dedicated engineering manager in the Engineering team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Git', 'JavaScript', 'AWS'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Engineering Manager','years','2021-2024')));

-- Vivaan Bose (Human Resources)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (4, 'OIVIBO20260004', 'vivaan.bose@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (4, 4, 1, 'Vivaan', 'Bose', '9320657206', 'HR Manager', 'Human Resources', NULL, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 623 DAY), 'EMP0004');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (4, 129500.00, 1554000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'basic', 'percentage', 50, 64750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'hra', 'percentage', 50, 64750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'standard_allowance', 'percentage', 16.67, 21588);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'performance_bonus', 'percentage', 8.33, 10787);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'leave_travel_allowance', 'percentage', 8.33, 10787);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (4, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (4, '1995-03-08', 'male', 'Indian', 'Hyderabad, India', 'vivaan.personal@example.com', 'single', 'VBOSE4244C', '650729817245');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (4, 'HDFC Bank', '199848849046', 'HDFC0114258');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (4, 'Dedicated hr manager in the Human Resources team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('HRIS', 'Employee Relations', 'Recruitment', 'Onboarding', 'Payroll'),
  JSON_ARRAY('HR Analytics Certification'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','HR Manager','years','2021-2024')));

-- Manav Gupta (Sales)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (5, 'OIMAGU20260005', 'manav.gupta@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (5, 5, 1, 'Manav', 'Gupta', '9941380958', 'Sales Head', 'Sales', NULL, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 597 DAY), 'EMP0005');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (5, 176000.00, 2112000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'basic', 'percentage', 50, 88000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'hra', 'percentage', 50, 88000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'standard_allowance', 'percentage', 16.67, 29339);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'performance_bonus', 'percentage', 8.33, 14661);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'leave_travel_allowance', 'percentage', 8.33, 14661);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (5, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (5, '1989-12-16', 'female', 'Indian', 'Pune, India', 'manav.personal@example.com', 'single', 'MGUPT4887C', '366336563741');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (5, 'Axis Bank', '994610339030', 'AXIS0901178');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (5, 'Dedicated sales head in the Sales team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Negotiation', 'Client Relations', 'B2B Sales'),
  JSON_ARRAY('Certified Sales Professional'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Sales Head','years','2021-2024')));

-- Vihaan Shah (Marketing)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (6, 'OIVISH20260006', 'vihaan.shah@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (6, 6, 1, 'Vihaan', 'Shah', '9807348323', 'Marketing Manager', 'Marketing', NULL, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 119 DAY), 'EMP0006');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (6, 123000.00, 1476000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'basic', 'percentage', 50, 61500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'hra', 'percentage', 50, 61500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'standard_allowance', 'percentage', 16.67, 20504);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'performance_bonus', 'percentage', 8.33, 10246);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'leave_travel_allowance', 'percentage', 8.33, 10246);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (6, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (6, '2001-03-20', 'male', 'Indian', 'Chennai, India', 'vihaan.personal@example.com', 'single', 'VSHAH8773B', '108573748171');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (6, 'Axis Bank', '453651208453', 'AXIS0218253');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (6, 'Dedicated marketing manager in the Marketing team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Google Analytics', 'SEO', 'Brand Strategy', 'Social Media', 'Content Marketing'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Marketing Manager','years','2021-2024')));

-- Pooja Das (Finance)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (7, 'OIPODA20260007', 'pooja.das@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (7, 7, 1, 'Pooja', 'Das', '9917348031', 'Finance Manager', 'Finance', NULL, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 62 DAY), 'EMP0007');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (7, 117500.00, 1410000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'basic', 'percentage', 50, 58750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'hra', 'percentage', 50, 58750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'standard_allowance', 'percentage', 16.67, 19587);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'performance_bonus', 'percentage', 8.33, 9788);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'leave_travel_allowance', 'percentage', 8.33, 9788);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (7, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (7, '1997-09-09', 'female', 'Indian', 'Pune, India', 'pooja.personal@example.com', 'single', 'PDASX3632B', '490969770494');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (7, 'HDFC Bank', '253750658663', 'HDFC0604867');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (7, 'Dedicated finance manager in the Finance team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Taxation', 'Budgeting', 'Tally', 'Excel', 'Financial Modeling'),
  JSON_ARRAY('Certified Financial Analyst'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Finance Manager','years','2021-2024')));

-- Pari Trivedi (Design)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (8, 'OIPATR20260008', 'pari.trivedi@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (8, 8, 1, 'Pari', 'Trivedi', '9402508719', 'Design Lead', 'Design', NULL, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 407 DAY), 'EMP0008');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (8, 144500.00, 1734000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'basic', 'percentage', 50, 72250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'hra', 'percentage', 50, 72250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'standard_allowance', 'percentage', 16.67, 24088);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'performance_bonus', 'percentage', 8.33, 12037);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'leave_travel_allowance', 'percentage', 8.33, 12037);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (8, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (8, '1996-03-10', 'male', 'Indian', 'Chennai, India', 'pari.personal@example.com', 'single', 'PTRIV5333B', '740844861674');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (8, 'HDFC Bank', '619782256823', 'HDFC0286918');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (8, 'Dedicated design lead in the Design team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Adobe XD', 'Prototyping', 'User Research'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Design Lead','years','2021-2024')));

-- Manav Bansal (Operations)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (9, 'OIMABA20260009', 'manav.bansal@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (9, 9, 1, 'Manav', 'Bansal', '9238728227', 'Operations Manager', 'Operations', NULL, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 341 DAY), 'EMP0009');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (9, 126000.00, 1512000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'basic', 'percentage', 50, 63000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'hra', 'percentage', 50, 63000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'standard_allowance', 'percentage', 16.67, 21004);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'performance_bonus', 'percentage', 8.33, 10496);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'leave_travel_allowance', 'percentage', 8.33, 10496);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (9, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (9, '1990-08-23', 'female', 'Indian', 'Chennai, India', 'manav.personal@example.com', 'married', 'MBANS5558D', '784719415195');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (9, 'HDFC Bank', '162406278215', 'HDFC0252371');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (9, 'Dedicated operations manager in the Operations team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Logistics', 'Vendor Management', 'MS Excel', 'Process Optimization'),
  JSON_ARRAY('Six Sigma Green Belt'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Operations Manager','years','2021-2024')));

-- Varun Bansal (Customer Support)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (10, 'OIVABA20260010', 'varun.bansal@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (10, 10, 1, 'Varun', 'Bansal', '9853278450', 'Support Team Lead', 'Customer Support', NULL, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 636 DAY), 'EMP0010');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (10, 81000.00, 972000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'basic', 'percentage', 50, 40500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'hra', 'percentage', 50, 40500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'standard_allowance', 'percentage', 16.67, 13503);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'performance_bonus', 'percentage', 8.33, 6747);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'leave_travel_allowance', 'percentage', 8.33, 6747);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (10, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (10, '1997-05-27', 'female', 'Indian', 'Chennai, India', 'varun.personal@example.com', 'single', 'VBANS8915C', '736729822889');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (10, 'Axis Bank', '753727993532', 'AXIS0960347');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (10, 'Dedicated support team lead in the Customer Support team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('CRM', 'Zendesk', 'Communication'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Support Team Lead','years','2021-2024')));

-- Reyansh Reddy (Engineering)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (11, 'OIRERE20260011', 'reyansh.reddy@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (11, 11, 1, 'Reyansh', 'Reddy', '9142908205', 'Software Engineer', 'Engineering', 3, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 578 DAY), 'EMP0011');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (11, 76500.00, 918000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'basic', 'percentage', 50, 38250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'hra', 'percentage', 50, 38250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'standard_allowance', 'percentage', 16.67, 12753);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'performance_bonus', 'percentage', 8.33, 6372);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'leave_travel_allowance', 'percentage', 8.33, 6372);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (11, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (11, '1998-03-19', 'male', 'Indian', 'Pune, India', 'reyansh.personal@example.com', 'married', 'RREDD1889E', '151061438070');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (11, 'Kotak Mahindra Bank', '487358882860', 'KOTA0552219');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (11, 'Dedicated software engineer in the Engineering team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('System Design', 'SQL', 'AWS'),
  JSON_ARRAY('AWS Certified Developer'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Software Engineer','years','2021-2024')));

-- Aadhya Rao (Human Resources)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (12, 'OIAARA20260012', 'aadhya.rao@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (12, 12, 1, 'Aadhya', 'Rao', '9607645219', 'Talent Acquisition Specialist', 'Human Resources', 4, 'Mumbai, India', DATE_SUB(CURDATE(), INTERVAL 580 DAY), 'EMP0012');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (12, 58000.00, 696000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'basic', 'percentage', 50, 29000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'hra', 'percentage', 50, 29000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'standard_allowance', 'percentage', 16.67, 9669);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'performance_bonus', 'percentage', 8.33, 4831);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'leave_travel_allowance', 'percentage', 8.33, 4831);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (12, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (12, '1995-10-15', 'female', 'Indian', 'Mumbai, India', 'aadhya.personal@example.com', 'married', 'ARAOX4570B', '355717866099');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (12, 'State Bank of India', '978981602261', 'STAT0119919');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (12, 'Dedicated talent acquisition specialist in the Human Resources team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Onboarding', 'Payroll', 'HRIS'),
  JSON_ARRAY('HR Analytics Certification'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Talent Acquisition Specialist','years','2021-2024')));

-- Kavya Agarwal (Sales)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (13, 'OIKAAG20260013', 'kavya.agarwal@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (13, 13, 1, 'Kavya', 'Agarwal', '9949867691', 'Sales Executive', 'Sales', 5, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 676 DAY), 'EMP0013');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (13, 43000.00, 516000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'basic', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'hra', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'standard_allowance', 'percentage', 16.67, 7168);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'performance_bonus', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'leave_travel_allowance', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (13, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (13, '1997-07-23', 'male', 'Indian', 'Chennai, India', 'kavya.personal@example.com', 'married', 'KAGAR8782B', '890136717911');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (13, 'ICICI Bank', '668398557323', 'ICIC0701127');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (13, 'Dedicated sales executive in the Sales team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Lead Generation', 'CRM', 'Negotiation', 'Client Relations', 'B2B Sales'),
  JSON_ARRAY('Certified Sales Professional'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Sales Executive','years','2021-2024')));

-- Diya Ghosh (Marketing)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (14, 'OIDIGH20260014', 'diya.ghosh@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (14, 14, 1, 'Diya', 'Ghosh', '9405682454', 'Content Strategist', 'Marketing', 6, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 507 DAY), 'EMP0014');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (14, 62500.00, 750000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'basic', 'percentage', 50, 31250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'hra', 'percentage', 50, 31250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'standard_allowance', 'percentage', 16.67, 10419);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'performance_bonus', 'percentage', 8.33, 5206);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'leave_travel_allowance', 'percentage', 8.33, 5206);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (14, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (14, '1990-04-27', 'female', 'Indian', 'Hyderabad, India', 'diya.personal@example.com', 'married', 'DGHOS9038D', '479011699417');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (14, 'State Bank of India', '165259964414', 'STAT0549916');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (14, 'Dedicated content strategist in the Marketing team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Google Analytics', 'Content Marketing', 'SEO', 'Brand Strategy', 'Social Media'),
  JSON_ARRAY('HubSpot Content Marketing'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Content Strategist','years','2021-2024')));

-- Pari Das (Finance)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (15, 'OIPADA20260015', 'pari.das@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (15, 15, 1, 'Pari', 'Das', '9566079329', 'Payroll Specialist', 'Finance', 7, 'Mumbai, India', DATE_SUB(CURDATE(), INTERVAL 289 DAY), 'EMP0015');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (15, 47500.00, 570000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'basic', 'percentage', 50, 23750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'hra', 'percentage', 50, 23750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'standard_allowance', 'percentage', 16.67, 7918);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'performance_bonus', 'percentage', 8.33, 3957);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'leave_travel_allowance', 'percentage', 8.33, 3957);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (15, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (15, '1999-11-20', 'male', 'Indian', 'Mumbai, India', 'pari.personal@example.com', 'single', 'PDASX3158C', '350859156996');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (15, 'ICICI Bank', '189805360976', 'ICIC0664496');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (15, 'Dedicated payroll specialist in the Finance team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Budgeting', 'Tally', 'Taxation', 'Excel'),
  JSON_ARRAY('Certified Financial Analyst'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Payroll Specialist','years','2021-2024')));

-- Kabir Shah (Design)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (16, 'OIKASH20260016', 'kabir.shah@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (16, 16, 1, 'Kabir', 'Shah', '9539293649', 'Product Designer', 'Design', 8, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 664 DAY), 'EMP0016');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (16, 99000.00, 1188000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'basic', 'percentage', 50, 49500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'hra', 'percentage', 50, 49500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'standard_allowance', 'percentage', 16.67, 16503);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'performance_bonus', 'percentage', 8.33, 8247);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'leave_travel_allowance', 'percentage', 8.33, 8247);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (16, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (16, '1989-01-01', 'male', 'Indian', 'Hyderabad, India', 'kabir.personal@example.com', 'married', 'KSHAH2839D', '554567688587');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (16, 'Axis Bank', '818754860991', 'AXIS0438291');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (16, 'Dedicated product designer in the Design team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Adobe XD', 'Prototyping', 'User Research', 'Figma'),
  JSON_ARRAY('Google UX Design Certificate'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Product Designer','years','2021-2024')));

-- Arjun Gupta (Operations)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (17, 'OIARGU20260017', 'arjun.gupta@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (17, 17, 1, 'Arjun', 'Gupta', '9488464618', 'Facility Coordinator', 'Operations', 9, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 151 DAY), 'EMP0017');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (17, 39500.00, 474000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'basic', 'percentage', 50, 19750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'hra', 'percentage', 50, 19750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'standard_allowance', 'percentage', 16.67, 6585);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'performance_bonus', 'percentage', 8.33, 3290);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'leave_travel_allowance', 'percentage', 8.33, 3290);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (17, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (17, '1990-07-19', 'female', 'Indian', 'Chennai, India', 'arjun.personal@example.com', 'single', 'AGUPT1448E', '622327046212');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (17, 'Kotak Mahindra Bank', '569583391188', 'KOTA0770603');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (17, 'Dedicated facility coordinator in the Operations team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Logistics', 'Vendor Management', 'Process Optimization', 'MS Excel'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Facility Coordinator','years','2021-2024')));

-- Ananya Verma (Customer Support)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (18, 'OIANVE20260018', 'ananya.verma@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (18, 18, 1, 'Ananya', 'Verma', '9740756401', 'Support Executive', 'Customer Support', 10, 'Delhi, India', DATE_SUB(CURDATE(), INTERVAL 156 DAY), 'EMP0018');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (18, 33500.00, 402000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'basic', 'percentage', 50, 16750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'hra', 'percentage', 50, 16750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'standard_allowance', 'percentage', 16.67, 5584);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'performance_bonus', 'percentage', 8.33, 2791);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'leave_travel_allowance', 'percentage', 8.33, 2791);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (18, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (18, '1996-07-06', 'male', 'Indian', 'Delhi, India', 'ananya.personal@example.com', 'married', 'AVERM8463B', '284387830505');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (18, 'Axis Bank', '242522829049', 'AXIS0981136');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (18, 'Dedicated support executive in the Customer Support team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('CRM', 'Zendesk', 'Conflict Resolution', 'Communication'),
  JSON_ARRAY('Certified Customer Experience Professional'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Support Executive','years','2021-2024')));

-- Navya Thakur (Engineering)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (19, 'OINATH20260019', 'navya.thakur@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (19, 19, 1, 'Navya', 'Thakur', '9536660565', 'Senior Software Engineer', 'Engineering', 3, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 281 DAY), 'EMP0019');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (19, 124500.00, 1494000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'basic', 'percentage', 50, 62250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'hra', 'percentage', 50, 62250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'standard_allowance', 'percentage', 16.67, 20754);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'performance_bonus', 'percentage', 8.33, 10371);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'leave_travel_allowance', 'percentage', 8.33, 10371);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (19, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (19, '1993-04-15', 'male', 'Indian', 'Pune, India', 'navya.personal@example.com', 'single', 'NTHAK7531E', '351113721891');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (19, 'Axis Bank', '264908999577', 'AXIS0432099');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (19, 'Dedicated senior software engineer in the Engineering team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('React', 'Node.js', 'System Design', 'Git', 'JavaScript'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Senior Software Engineer','years','2021-2024')));

-- Rahul Naidu (Human Resources)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (20, 'OIRANA20260020', 'rahul.naidu@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (20, 20, 1, 'Rahul', 'Naidu', '9141038563', 'HR Business Partner', 'Human Resources', 4, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 550 DAY), 'EMP0020');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (20, 81500.00, 978000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'basic', 'percentage', 50, 40750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'hra', 'percentage', 50, 40750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'standard_allowance', 'percentage', 16.67, 13586);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'performance_bonus', 'percentage', 8.33, 6789);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'leave_travel_allowance', 'percentage', 8.33, 6789);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (20, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (20, '1989-09-17', 'male', 'Indian', 'Hyderabad, India', 'rahul.personal@example.com', 'single', 'RNAID9857E', '970411228435');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (20, 'Axis Bank', '866735393507', 'AXIS0697860');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (20, 'Dedicated hr business partner in the Human Resources team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Recruitment', 'Payroll', 'Onboarding', 'Employee Relations'),
  JSON_ARRAY('HR Analytics Certification'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','HR Business Partner','years','2021-2024')));

-- Kavya Chauhan (Sales)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (21, 'OIKACH20260021', 'kavya.chauhan@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (21, 21, 1, 'Kavya', 'Chauhan', '9243381124', 'Sales Executive', 'Sales', 5, 'Mumbai, India', DATE_SUB(CURDATE(), INTERVAL 634 DAY), 'EMP0021');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (21, 37500.00, 450000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'basic', 'percentage', 50, 18750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'hra', 'percentage', 50, 18750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'standard_allowance', 'percentage', 16.67, 6251);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'performance_bonus', 'percentage', 8.33, 3124);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'leave_travel_allowance', 'percentage', 8.33, 3124);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (21, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (21, '1997-10-10', 'female', 'Indian', 'Mumbai, India', 'kavya.personal@example.com', 'single', 'KCHAU6718E', '468592649069');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (21, 'ICICI Bank', '658795846719', 'ICIC0436846');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (21, 'Dedicated sales executive in the Sales team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Negotiation', 'B2B Sales', 'CRM'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Sales Executive','years','2021-2024')));

-- Meera Rana (Marketing)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (22, 'OIMERA20260022', 'meera.rana@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (22, 22, 1, 'Meera', 'Rana', '9715720916', 'Marketing Executive', 'Marketing', 6, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 352 DAY), 'EMP0022');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (22, 48500.00, 582000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'basic', 'percentage', 50, 24250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'hra', 'percentage', 50, 24250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'standard_allowance', 'percentage', 16.67, 8085);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'performance_bonus', 'percentage', 8.33, 4040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'leave_travel_allowance', 'percentage', 8.33, 4040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (22, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (22, '1993-11-18', 'male', 'Indian', 'Chennai, India', 'meera.personal@example.com', 'married', 'MRANA6299A', '978876128792');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (22, 'State Bank of India', '851327581075', 'STAT0452720');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (22, 'Dedicated marketing executive in the Marketing team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Google Analytics', 'Content Marketing', 'Social Media', 'Brand Strategy'),
  JSON_ARRAY('Google Analytics Certified'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Marketing Executive','years','2021-2024')));

-- Krishna Trivedi (Finance)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (23, 'OIKRTR20260023', 'krishna.trivedi@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (23, 23, 1, 'Krishna', 'Trivedi', '9610087037', 'Payroll Specialist', 'Finance', 7, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 30 DAY), 'EMP0023');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (23, 60500.00, 726000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'basic', 'percentage', 50, 30250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'hra', 'percentage', 50, 30250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'standard_allowance', 'percentage', 16.67, 10085);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'performance_bonus', 'percentage', 8.33, 5040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'leave_travel_allowance', 'percentage', 8.33, 5040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (23, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (23, '1988-02-26', 'female', 'Indian', 'Hyderabad, India', 'krishna.personal@example.com', 'married', 'KTRIV1449D', '630662108166');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (23, 'HDFC Bank', '768342779437', 'HDFC0687395');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (23, 'Dedicated payroll specialist in the Finance team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Tally', 'Budgeting', 'Excel', 'Taxation'),
  JSON_ARRAY('CA Inter'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Payroll Specialist','years','2021-2024')));

-- Aryan Bose (Design)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (24, 'OIARBO20260024', 'aryan.bose@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (24, 24, 1, 'Aryan', 'Bose', '9629342079', 'Product Designer', 'Design', 8, 'Bengaluru, India', DATE_SUB(CURDATE(), INTERVAL 518 DAY), 'EMP0024');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (24, 79500.00, 954000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'basic', 'percentage', 50, 39750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'hra', 'percentage', 50, 39750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'standard_allowance', 'percentage', 16.67, 13253);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'performance_bonus', 'percentage', 8.33, 6622);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'leave_travel_allowance', 'percentage', 8.33, 6622);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (24, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (24, '1998-04-26', 'female', 'Indian', 'Bengaluru, India', 'aryan.personal@example.com', 'single', 'ABOSE3099A', '387887330516');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (24, 'Kotak Mahindra Bank', '557631219085', 'KOTA0925734');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (24, 'Dedicated product designer in the Design team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Figma', 'Adobe XD', 'User Research', 'Prototyping', 'Design Systems'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Product Designer','years','2021-2024')));

-- Varun Menon (Operations)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (25, 'OIVAME20260025', 'varun.menon@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (25, 25, 1, 'Varun', 'Menon', '9119123779', 'Facility Coordinator', 'Operations', 9, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 695 DAY), 'EMP0025');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (25, 31000.00, 372000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'basic', 'percentage', 50, 15500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'hra', 'percentage', 50, 15500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'standard_allowance', 'percentage', 16.67, 5168);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'performance_bonus', 'percentage', 8.33, 2582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'leave_travel_allowance', 'percentage', 8.33, 2582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (25, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (25, '1991-12-09', 'female', 'Indian', 'Hyderabad, India', 'varun.personal@example.com', 'married', 'VMENO9098D', '586479673930');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (25, 'State Bank of India', '258615460153', 'STAT0613286');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (25, 'Dedicated facility coordinator in the Operations team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Logistics', 'Process Optimization', 'Vendor Management'),
  JSON_ARRAY('Six Sigma Green Belt'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Facility Coordinator','years','2021-2024')));

-- Dhruv Chatterjee (Customer Support)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (26, 'OIDHCH20260026', 'dhruv.chatterjee@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (26, 26, 1, 'Dhruv', 'Chatterjee', '9499375192', 'Support Executive', 'Customer Support', 10, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 462 DAY), 'EMP0026');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (26, 36000.00, 432000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'basic', 'percentage', 50, 18000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'hra', 'percentage', 50, 18000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'standard_allowance', 'percentage', 16.67, 6001);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'performance_bonus', 'percentage', 8.33, 2999);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'leave_travel_allowance', 'percentage', 8.33, 2999);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (26, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (26, '1993-03-01', 'male', 'Indian', 'Hyderabad, India', 'dhruv.personal@example.com', 'married', 'DCHAT7375B', '350902422075');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (26, 'State Bank of India', '729747505392', 'STAT0222933');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (26, 'Dedicated support executive in the Customer Support team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Conflict Resolution', 'CRM', 'Zendesk'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Support Executive','years','2021-2024')));

-- Rahul Kapoor (Engineering)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (27, 'OIRAKA20260027', 'rahul.kapoor@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (27, 27, 1, 'Rahul', 'Kapoor', '9654337641', 'Senior Software Engineer', 'Engineering', 3, 'Bengaluru, India', DATE_SUB(CURDATE(), INTERVAL 268 DAY), 'EMP0027');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (27, 98000.00, 1176000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'basic', 'percentage', 50, 49000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'hra', 'percentage', 50, 49000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'standard_allowance', 'percentage', 16.67, 16337);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'performance_bonus', 'percentage', 8.33, 8163);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'leave_travel_allowance', 'percentage', 8.33, 8163);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (27, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (27, '2000-11-27', 'female', 'Indian', 'Bengaluru, India', 'rahul.personal@example.com', 'single', 'RKAPO9107E', '179179785563');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (27, 'State Bank of India', '707557164411', 'STAT0571946');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (27, 'Dedicated senior software engineer in the Engineering team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Node.js', 'Docker', 'React', 'JavaScript'),
  JSON_ARRAY('Certified Kubernetes Administrator'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Senior Software Engineer','years','2021-2024')));

-- Rohan Kulkarni (Human Resources)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (28, 'OIROKU20260028', 'rohan.kulkarni@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (28, 28, 1, 'Rohan', 'Kulkarni', '9732944141', 'HR Business Partner', 'Human Resources', 4, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 262 DAY), 'EMP0028');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (28, 79500.00, 954000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'basic', 'percentage', 50, 39750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'hra', 'percentage', 50, 39750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'standard_allowance', 'percentage', 16.67, 13253);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'performance_bonus', 'percentage', 8.33, 6622);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'leave_travel_allowance', 'percentage', 8.33, 6622);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (28, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (28, '1997-11-25', 'male', 'Indian', 'Hyderabad, India', 'rohan.personal@example.com', 'single', 'RKULK4050D', '574299595784');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (28, 'HDFC Bank', '143536185519', 'HDFC0209087');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (28, 'Dedicated hr business partner in the Human Resources team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Employee Relations', 'HRIS', 'Onboarding'),
  JSON_ARRAY('SHRM-CP'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','HR Business Partner','years','2021-2024')));

-- Ira Malhotra (Sales)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (29, 'OIIRMA20260029', 'ira.malhotra@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (29, 29, 1, 'Ira', 'Malhotra', '9753350116', 'Sales Executive', 'Sales', 5, 'Bengaluru, India', DATE_SUB(CURDATE(), INTERVAL 433 DAY), 'EMP0029');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (29, 34500.00, 414000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'basic', 'percentage', 50, 17250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'hra', 'percentage', 50, 17250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'standard_allowance', 'percentage', 16.67, 5751);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'performance_bonus', 'percentage', 8.33, 2874);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'leave_travel_allowance', 'percentage', 8.33, 2874);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (29, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (29, '1991-02-24', 'male', 'Indian', 'Bengaluru, India', 'ira.personal@example.com', 'married', 'IMALH5059C', '118848821311');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (29, 'Kotak Mahindra Bank', '297600695956', 'KOTA0974845');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (29, 'Dedicated sales executive in the Sales team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Lead Generation', 'Client Relations', 'CRM', 'B2B Sales'),
  JSON_ARRAY('Certified Sales Professional'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Sales Executive','years','2021-2024')));

-- Myra Verma (Marketing)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (30, 'OIMYVE20260030', 'myra.verma@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (30, 30, 1, 'Myra', 'Verma', '9533726011', 'Content Strategist', 'Marketing', 6, 'Bengaluru, India', DATE_SUB(CURDATE(), INTERVAL 188 DAY), 'EMP0030');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (30, 60500.00, 726000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'basic', 'percentage', 50, 30250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'hra', 'percentage', 50, 30250);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'standard_allowance', 'percentage', 16.67, 10085);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'performance_bonus', 'percentage', 8.33, 5040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'leave_travel_allowance', 'percentage', 8.33, 5040);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (30, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (30, '1989-03-20', 'male', 'Indian', 'Bengaluru, India', 'myra.personal@example.com', 'married', 'MVERM8573E', '938750187843');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (30, 'Kotak Mahindra Bank', '290115041611', 'KOTA0101485');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (30, 'Dedicated content strategist in the Marketing team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('SEO', 'Content Marketing', 'Google Analytics'),
  JSON_ARRAY('HubSpot Content Marketing'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Content Strategist','years','2021-2024')));

-- Rohan Singh (Finance)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (31, 'OIROSI20260031', 'rohan.singh@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (31, 31, 1, 'Rohan', 'Singh', '9958565311', 'Finance Analyst', 'Finance', 7, 'Delhi, India', DATE_SUB(CURDATE(), INTERVAL 505 DAY), 'EMP0031');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (31, 66000.00, 792000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'basic', 'percentage', 50, 33000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'hra', 'percentage', 50, 33000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'standard_allowance', 'percentage', 16.67, 11002);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'performance_bonus', 'percentage', 8.33, 5498);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'leave_travel_allowance', 'percentage', 8.33, 5498);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (31, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (31, '1999-01-24', 'female', 'Indian', 'Delhi, India', 'rohan.personal@example.com', 'single', 'RSING4033E', '954572341428');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (31, 'Kotak Mahindra Bank', '135622235410', 'KOTA0933552');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (31, 'Dedicated finance analyst in the Finance team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Tally', 'Budgeting', 'Excel'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Finance Analyst','years','2021-2024')));

-- Neha Patel (Design)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (32, 'OINEPA20260032', 'neha.patel@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (32, 32, 1, 'Neha', 'Patel', '9354093898', 'Product Designer', 'Design', 8, 'Mumbai, India', DATE_SUB(CURDATE(), INTERVAL 484 DAY), 'EMP0032');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (32, 96000.00, 1152000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'basic', 'percentage', 50, 48000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'hra', 'percentage', 50, 48000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'standard_allowance', 'percentage', 16.67, 16003);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'performance_bonus', 'percentage', 8.33, 7997);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'leave_travel_allowance', 'percentage', 8.33, 7997);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (32, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (32, '1996-01-25', 'female', 'Indian', 'Mumbai, India', 'neha.personal@example.com', 'married', 'NPATE4839C', '416873835306');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (32, 'Axis Bank', '647956127510', 'AXIS0602678');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (32, 'Dedicated product designer in the Design team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Figma', 'Design Systems', 'User Research'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Product Designer','years','2021-2024')));

-- Pari Rana (Operations)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (33, 'OIPARA20260033', 'pari.rana@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (33, 33, 1, 'Pari', 'Rana', '9660212046', 'Operations Executive', 'Operations', 9, 'Hyderabad, India', DATE_SUB(CURDATE(), INTERVAL 365 DAY), 'EMP0033');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (33, 43000.00, 516000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'basic', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'hra', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'standard_allowance', 'percentage', 16.67, 7168);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'performance_bonus', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'leave_travel_allowance', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (33, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (33, '1998-02-13', 'female', 'Indian', 'Hyderabad, India', 'pari.personal@example.com', 'married', 'PRANA5438D', '409480639011');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (33, 'State Bank of India', '878992265393', 'STAT0343808');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (33, 'Dedicated operations executive in the Operations team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Process Optimization', 'Logistics', 'MS Excel', 'Vendor Management'),
  JSON_ARRAY('Six Sigma Green Belt'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Operations Executive','years','2021-2024')));

-- Pooja Kapoor (Customer Support)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (34, 'OIPOKA20260034', 'pooja.kapoor@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (34, 34, 1, 'Pooja', 'Kapoor', '9155671400', 'Support Executive', 'Customer Support', 10, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 215 DAY), 'EMP0034');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (34, 31500.00, 378000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'basic', 'percentage', 50, 15750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'hra', 'percentage', 50, 15750);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'standard_allowance', 'percentage', 16.67, 5251);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'performance_bonus', 'percentage', 8.33, 2624);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'leave_travel_allowance', 'percentage', 8.33, 2624);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (34, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (34, '1993-04-06', 'female', 'Indian', 'Chennai, India', 'pooja.personal@example.com', 'single', 'PKAPO6321B', '803649466787');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (34, 'State Bank of India', '401782547845', 'STAT0678494');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (34, 'Dedicated support executive in the Customer Support team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Conflict Resolution', 'CRM', 'Communication'),
  JSON_ARRAY('Certified Customer Experience Professional'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Support Executive','years','2021-2024')));

-- Dhruv Rana (Engineering)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (35, 'OIDHRA20260035', 'dhruv.rana@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (35, 35, 1, 'Dhruv', 'Rana', '9533313336', 'QA Engineer', 'Engineering', 3, 'Bengaluru, India', DATE_SUB(CURDATE(), INTERVAL 314 DAY), 'EMP0035');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (35, 51000.00, 612000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'basic', 'percentage', 50, 25500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'hra', 'percentage', 50, 25500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'standard_allowance', 'percentage', 16.67, 8502);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'performance_bonus', 'percentage', 8.33, 4248);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'leave_travel_allowance', 'percentage', 8.33, 4248);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (35, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (35, '1993-04-20', 'female', 'Indian', 'Bengaluru, India', 'dhruv.personal@example.com', 'married', 'DRANA2554B', '972075458662');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (35, 'Axis Bank', '251491241645', 'AXIS0314305');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (35, 'Dedicated qa engineer in the Engineering team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Node.js', 'System Design', 'React'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','QA Engineer','years','2021-2024')));

-- Anika Shah (Human Resources)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (36, 'OIANSH20260036', 'anika.shah@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (36, 36, 1, 'Anika', 'Shah', '9829537722', 'Talent Acquisition Specialist', 'Human Resources', 4, 'Pune, India', DATE_SUB(CURDATE(), INTERVAL 70 DAY), 'EMP0036');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (36, 50000.00, 600000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'basic', 'percentage', 50, 25000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'hra', 'percentage', 50, 25000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'standard_allowance', 'percentage', 16.67, 8335);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'performance_bonus', 'percentage', 8.33, 4165);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'leave_travel_allowance', 'percentage', 8.33, 4165);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (36, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (36, '1998-10-25', 'female', 'Indian', 'Pune, India', 'anika.personal@example.com', 'single', 'ASHAH8372A', '888266939949');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (36, 'Kotak Mahindra Bank', '466626556543', 'KOTA0962388');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (36, 'Dedicated talent acquisition specialist in the Human Resources team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('HRIS', 'Employee Relations', 'Payroll', 'Recruitment'),
  JSON_ARRAY('HR Analytics Certification'),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Talent Acquisition Specialist','years','2021-2024')));

-- Sneha Mishra (Sales)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (37, 'OISNMI20260037', 'sneha.mishra@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (37, 37, 1, 'Sneha', 'Mishra', '9206803824', 'Sales Executive', 'Sales', 5, 'Chennai, India', DATE_SUB(CURDATE(), INTERVAL 313 DAY), 'EMP0037');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (37, 43000.00, 516000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'basic', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'hra', 'percentage', 50, 21500);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'standard_allowance', 'percentage', 16.67, 7168);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'performance_bonus', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'leave_travel_allowance', 'percentage', 8.33, 3582);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (37, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (37, '1993-07-02', 'male', 'Indian', 'Chennai, India', 'sneha.personal@example.com', 'married', 'SMISH3740B', '302747690770');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (37, 'Kotak Mahindra Bank', '695267140422', 'KOTA0322298');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (37, 'Dedicated sales executive in the Sales team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('CRM', 'B2B Sales', 'Negotiation'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Sales Executive','years','2021-2024')));

-- Manav Yadav (Marketing)
INSERT INTO users (id, login_id, email, password_hash, role, is_email_verified, is_temp_password, account_status, company_id)
VALUES (38, 'OIMAYA20260038', 'manav.yadav@company.com', '$2b$10$pwlVuOHpnilOJ1EiFAnFpuD3rAe3uekemR6E4f1QLhvGFdUYJ4jBu', 'employee', TRUE, TRUE, 'active', 1);

INSERT INTO employees (id, user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
VALUES (38, 38, 1, 'Manav', 'Yadav', '9447875507', 'Content Strategist', 'Marketing', 6, 'Delhi, India', DATE_SUB(CURDATE(), INTERVAL 439 DAY), 'EMP0038');

INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (38, 54000.00, 648000.00);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'basic', 'percentage', 50, 27000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'hra', 'percentage', 50, 27000);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'standard_allowance', 'percentage', 16.67, 9002);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'performance_bonus', 'percentage', 8.33, 4498);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'leave_travel_allowance', 'percentage', 8.33, 4498);
INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (38, 'fixed_allowance', 'percentage', 0, 0);

INSERT INTO employee_private_information (employee_id, date_of_birth, gender, nationality, address, personal_email, marital_status, pan_no, uan_no)
VALUES (38, '1992-06-14', 'male', 'Indian', 'Delhi, India', 'manav.personal@example.com', 'married', 'MYADA1263C', '162997219152');

INSERT INTO employee_bank_details (employee_id, bank_name, account_number, ifsc_code)
VALUES (38, 'State Bank of India', '780378939677', 'STAT0350626');

INSERT INTO employee_resume (employee_id, about, what_i_love, interests, skills, certifications, experience)
VALUES (38, 'Dedicated content strategist in the Marketing team.', 'Solving real problems for real people.', 'Music, travelling, reading',
  JSON_ARRAY('Brand Strategy', 'Content Marketing', 'Google Analytics', 'SEO', 'Social Media'),
  JSON_ARRAY(),
  JSON_ARRAY(JSON_OBJECT('company','PreviousCo','role','Content Strategist','years','2021-2024')));

-- ---------- Attendance history (last 12 days, weekdays-weighted) ----------
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 10:29:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:07:00'), 7.62, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:38:00'), 8.98, 0.26, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:36:00'), 8.52, 0.12, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:37:00'), 8.46, 0.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:33:00'), 8.73, 1.45, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:41:00'), 8.70, 1.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:02:00'), 8.51, 0.93, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:44:00'), 8.72, 1.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:03:00'), 8.30, 0.77, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:34:00'), 8.75, 1.22, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 10:41:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:18:00'), 7.90, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:01:00'), 8.37, 0.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:31:00'), 8.22, 1.17, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:06:00'), 8.19, 1.42, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:41:00'), 8.74, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:26:00'), 8.90, 1.05, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 10:40:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:21:00'), 7.72, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:18:00'), 8.23, 1.44, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:37:00'), 8.34, 1.36, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:09:00'), 8.51, 1.33, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (2, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:02:00'), 8.04, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:28:00'), 8.87, 0.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:08:00'), 8.24, 1.41, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 13:15:00'), 3.83, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:12:00'), 8.69, 0.71, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:24:00'), 8.06, 1.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:05:00'), 8.15, 0.82, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:10:00'), 8.48, 0.61, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:20:00'), 8.07, 0.74, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:01:00'), 8.28, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:40:00'), 8.63, 0.62, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:42:00'), 8.20, 1.05, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 10:30:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:19:00'), 7.34, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:11:00'), 8.49, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:06:00'), 8.50, 0.51, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:14:00'), 8.24, 1.17, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:37:00'), 8.66, 0.69, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:05:00'), 8.19, 1.24, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:18:00'), 8.77, 0.86, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:28:00'), 8.39, 0.36, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:42:00'), 8.77, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:08:00'), 8.12, 1.37, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:25:00'), 8.29, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (4, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 13:12:00'), 4.49, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 13:00:00'), 4.03, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 13:03:00'), 3.55, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:38:00'), 8.86, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:15:00'), 8.61, 0.50, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:33:00'), 8.85, 0.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:22:00'), 8.21, 1.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:42:00'), 8.63, 1.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:02:00'), 8.02, 1.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:03:00'), 8.29, 0.74, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:34:00'), 8.96, 0.72, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:03:00'), 8.99, 0.86, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (5, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:03:00'), 8.03, 0.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:17:00'), 8.21, 0.61, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:07:00'), 8.44, 1.42, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:04:00'), 8.97, 0.87, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:19:00'), 8.10, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:42:00'), 8.94, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:32:00'), 8.21, 0.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:17:00'), 8.94, 0.27, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 13:12:00'), 3.90, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:44:00'), 8.76, 0.68, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:04:00'), 8.80, 0.77, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (6, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:34:00'), 8.74, 0.70, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:40:00'), 8.17, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:44:00'), 8.78, 0.84, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:07:00'), 8.88, 1.43, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:12:00'), 8.17, 1.08, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:07:00'), 8.54, 0.22, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:21:00'), 8.45, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:04:00'), 8.99, 0.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:07:00'), 8.93, 0.64, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:43:00'), 8.41, 1.12, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (7, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:02:00'), 8.30, 0.18, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:23:00'), 8.27, 0.46, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:08:00'), 8.94, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:40:00'), 8.54, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:43:00'), 8.76, 0.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:09:00'), 8.27, 1.49, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:05:00'), 8.19, 0.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:11:00'), 8.32, 1.09, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:24:00'), 8.70, 0.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 13:04:00'), 4.29, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:03:00'), 8.09, 1.49, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (8, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:34:00'), 8.17, 0.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:14:00'), 8.30, 1.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:06:00'), 8.62, 0.90, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:01:00'), 8.32, 0.72, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:40:00'), 8.60, 1.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:43:00'), 8.19, 0.01, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:45:00'), 8.86, 0.77, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:39:00'), 8.20, 0.11, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:30:00'), 8.39, 0.51, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:41:00'), 8.03, 1.32, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:34:00'), 8.94, 0.75, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (9, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:44:00'), 8.72, 0.35, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 10:42:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:15:00'), 7.56, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:38:00'), 8.96, 0.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:23:00'), 8.68, 0.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:29:00'), 8.17, 0.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:06:00'), 8.35, 1.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:01:00'), 8.11, 1.39, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:11:00'), 8.25, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:45:00'), 8.67, 1.03, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:21:00'), 8.08, 0.95, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (10, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:42:00'), 8.81, 0.35, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:30:00'), 8.49, 1.18, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:20:00'), 8.14, 1.42, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:28:00'), 8.42, 0.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:11:00'), 8.68, 1.09, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:41:00'), 8.50, 1.22, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:40:00'), 8.58, 0.05, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:41:00'), 8.27, 0.84, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:03:00'), 8.28, 0.80, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:08:00'), 8.83, 0.24, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:20:00'), 8.32, 0.08, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (11, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:33:00'), 8.14, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 10:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:24:00'), 7.05, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:27:00'), 8.32, 0.10, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:33:00'), 8.47, 1.48, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:24:00'), 8.93, 0.94, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:41:00'), 8.04, 0.60, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:20:00'), 8.28, 0.77, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:12:00'), 8.26, 1.22, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:32:00'), 8.33, 1.01, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:19:00'), 8.21, 0.55, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:36:00'), 8.49, 1.32, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (12, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:26:00'), 8.90, 0.79, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:30:00'), 8.69, 0.69, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:39:00'), 8.11, 0.59, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:34:00'), 8.67, 0.61, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:18:00'), 8.32, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 8 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:01:00'), 8.89, 1.09, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:44:00'), 8.18, 0.09, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:44:00'), 8.85, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:45:00'), 8.74, 1.32, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:43:00'), 8.67, 0.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (13, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 10:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:17:00'), 7.55, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:12:00'), 8.41, 0.25, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:30:00'), 8.68, 0.79, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:25:00'), 8.10, 0.31, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:08:00'), 8.23, 0.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:20:00'), 4.19, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:40:00'), 8.11, 1.41, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 10:21:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:15:00'), 7.33, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:23:00'), 8.28, 1.00, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:06:00'), 8.06, 0.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:44:00'), 8.33, 0.36, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (14, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:30:00'), 8.15, 0.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:30:00'), 8.98, 0.53, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:06:00'), 8.82, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:13:00'), 8.29, 0.85, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:10:00'), 8.33, 0.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:05:00'), 3.68, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:13:00'), 8.99, 0.27, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:31:00'), 8.63, 0.64, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 13:19:00'), 4.11, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:41:00'), 8.90, 0.34, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:10:00'), 8.08, 1.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (15, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:31:00'), 8.45, 0.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 10:33:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:05:00'), 7.82, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 13:17:00'), 3.93, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:20:00'), 8.09, 0.90, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:31:00'), 8.32, 0.19, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 8 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:05:00'), 8.27, 1.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:42:00'), 8.95, 0.85, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:10:00'), 8.55, 0.02, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:34:00'), 8.96, 0.07, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:04:00'), 8.65, 0.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:32:00'), 8.46, 0.72, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (16, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:08:00'), 8.88, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:25:00'), 8.32, 0.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:45:00'), 8.48, 0.81, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:04:00'), 8.03, 0.22, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 13:27:00'), 3.88, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:00:00'), 8.44, 0.44, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 10:29:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:00:00'), 7.63, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:06:00'), 8.81, 0.79, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:16:00'), 8.83, 0.01, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:42:00'), 8.30, 0.23, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (17, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:14:00'), 8.88, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:23:00'), 8.63, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:14:00'), 8.08, 1.02, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:35:00'), 8.14, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 10:26:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:07:00'), 7.98, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:01:00'), 8.33, 0.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:40:00'), 8.56, 0.77, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:24:00'), 8.88, 1.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:18:00'), 8.07, 0.73, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:44:00'), 8.84, 0.82, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 13:26:00'), 3.57, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (18, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:24:00'), 8.69, 0.70, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 13:05:00'), 3.94, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:02:00'), 8.63, 1.02, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:21:00'), 8.29, 0.31, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:10:00'), 8.04, 1.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:21:00'), 8.15, 0.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:06:00'), 8.03, 0.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:33:00'), 8.04, 1.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:04:00'), 8.02, 0.84, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:10:00'), 8.87, 1.33, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:22:00'), 8.14, 1.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:27:00'), 8.54, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (19, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:01:00'), 8.92, 0.02, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:27:00'), 8.94, 0.84, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:26:00'), 8.06, 0.23, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:17:00'), 8.49, 0.97, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:06:00'), 8.31, 1.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:35:00'), 8.89, 0.70, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:26:00'), 8.22, 0.28, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 10:25:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:18:00'), 7.60, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:42:00'), 8.87, 0.85, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 10:28:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:17:00'), 7.54, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (20, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:18:00'), 8.96, 1.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 10:44:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:02:00'), 7.49, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:36:00'), 8.29, 1.24, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:16:00'), 8.71, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 13:21:00'), 4.17, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:31:00'), 8.91, 0.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:30:00'), 8.39, 1.05, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:16:00'), 8.99, 0.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:32:00'), 8.91, 0.80, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:01:00'), 8.68, 1.05, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 13:27:00'), 4.17, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:37:00'), 8.41, 0.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (21, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 10:26:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:14:00'), 7.26, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:03:00'), 8.69, 0.89, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:36:00'), 8.73, 0.98, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:11:00'), 8.33, 0.27, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 10:30:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:03:00'), 7.98, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:15:00'), 8.09, 0.60, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:19:00'), 8.79, 0.13, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 13:02:00'), 3.53, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:34:00'), 8.60, 0.48, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:26:00'), 8.84, 0.56, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:45:00'), 8.68, 1.36, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (22, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:04:00'), 8.03, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:06:00'), 8.96, 1.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:30:00'), 8.87, 0.73, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:12:00'), 8.79, 0.76, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:04:00'), 8.77, 1.27, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:05:00'), 8.14, 0.50, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:22:00'), 8.08, 1.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:12:00'), 8.01, 1.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:01:00'), 8.07, 1.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:19:00'), 8.30, 0.63, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (23, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:24:00'), 8.14, 0.19, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:08:00'), 8.39, 1.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:13:00'), 8.31, 1.48, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:08:00'), 8.48, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:19:00'), 8.82, 0.88, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:07:00'), 4.31, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:09:00'), 8.70, 1.34, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:13:00'), 8.18, 1.06, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:14:00'), 8.86, 1.20, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:43:00'), 8.37, 0.70, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:38:00'), 8.80, 1.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:33:00'), 8.75, 1.48, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (24, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:10:00'), 8.80, 0.54, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:17:00'), 8.48, 0.12, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:18:00'), 8.66, 0.08, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:26:00'), 8.09, 0.76, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:25:00'), 8.12, 1.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:37:00'), 8.04, 0.54, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:41:00'), 8.71, 0.57, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:05:00'), 8.23, 0.46, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:11:00'), 8.70, 0.67, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:37:00'), 8.72, 1.29, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 13:08:00'), 4.03, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (25, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:03:00'), 8.46, 1.25, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:05:00'), 8.84, 0.90, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:14:00'), 8.29, 0.85, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:45:00'), 8.34, 0.45, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:41:00'), 8.33, 0.55, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:41:00'), 8.28, 0.58, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:34:00'), 8.37, 1.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:41:00'), 8.71, 0.44, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 10:32:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:28:00'), 7.90, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 10:22:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:07:00'), 7.86, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:02:00'), 9.00, 0.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:18:00'), 8.29, 1.01, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (26, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:29:00'), 8.61, 1.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:00:00'), 8.83, 0.76, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:34:00'), 8.60, 0.04, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:16:00'), 8.58, 1.42, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:40:00'), 8.41, 0.60, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:37:00'), 8.08, 0.12, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:10:00'), 8.68, 1.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:45:00'), 8.06, 0.41, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:31:00'), 8.90, 1.26, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:02:00'), 8.10, 0.57, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:33:00'), 8.01, 0.74, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:08:00'), 8.19, 1.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (27, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:45:00'), 8.04, 0.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:37:00'), 8.88, 1.23, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:29:00'), 8.84, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:34:00'), 8.17, 0.63, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:10:00'), 8.67, 0.27, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:10:00'), 4.46, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:06:00'), 8.67, 1.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:29:00'), 8.32, 1.19, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 10:22:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:10:00'), 7.87, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:42:00'), 8.25, 1.49, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:13:00'), 8.20, 0.14, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:44:00'), 8.12, 0.52, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (28, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 10:39:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:28:00'), 7.53, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:29:00'), 8.90, 0.83, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:03:00'), 8.58, 0.19, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:17:00'), 8.17, 1.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:03:00'), 8.60, 0.13, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:36:00'), 8.30, 0.01, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:30:00'), 8.78, 0.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:28:00'), 8.82, 1.42, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:30:00'), 8.52, 1.07, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:45:00'), 8.10, 0.23, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (29, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:18:00'), 8.11, 1.14, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:09:00'), 8.07, 0.96, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:23:00'), 8.72, 0.82, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:31:00'), 8.98, 0.56, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:16:00'), 8.70, 0.96, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:13:00'), 8.73, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:36:00'), 8.98, 0.50, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:23:00'), 8.38, 1.26, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:43:00'), 8.62, 1.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:00:00'), 8.37, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:14:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:15:00'), 8.95, 0.65, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:39:00'), 8.89, 0.32, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (30, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:16:00'), 8.68, 0.36, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 11 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:39:00'), 8.20, 0.75, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:00:00'), 8.06, 0.93, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:15:00'), 8.28, 1.13, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:04:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:15:00'), 8.48, 1.31, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:13:00'), 8.25, 0.66, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:37:00'), 8.01, 1.30, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:12:00'), 8.77, 0.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 10:22:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:13:00'), 7.90, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:21:00'), 8.47, 1.23, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (31, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:06:00'), 8.13, 0.12, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:17:00'), 8.96, 1.31, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:03:00'), 8.30, 0.55, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:23:00'), 8.85, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:43:00'), 8.81, 1.19, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 10:37:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:20:00'), 7.50, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:34:00'), 8.49, 1.14, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:36:00'), 8.63, 0.69, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:37:00'), 8.60, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:15:00'), 8.39, 0.58, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:19:00'), 8.12, 0.22, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (32, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:32:00'), 8.00, 1.16, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:31:00'), 8.95, 0.94, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 13:07:00'), 4.09, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:21:00'), 8.49, 1.28, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:06:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:17:00'), 8.82, 1.21, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:24:00'), 8.68, 0.69, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 13:29:00'), 3.68, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:22:00'), 8.42, 0.74, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:08:00'), 8.30, 1.19, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:28:00'), 8.20, 0.70, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:03:00'), 8.04, 1.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (33, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 10:45:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:04:00'), 7.58, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:20:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 13:16:00'), 4.44, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 13:14:00'), 4.38, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:44:00'), 8.34, 1.50, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:13:00'), 8.62, 1.37, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:14:00'), 4.43, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:45:00'), 8.49, 0.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:32:00'), 8.96, 1.02, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:17:00'), 8.11, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:12:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:16:00'), 8.22, 0.33, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:43:00'), 8.43, 0.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 10:43:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:04:00'), 7.24, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (34, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:22:00'), 8.54, 0.47, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:14:00'), 8.80, 1.43, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:22:00'), 8.53, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:12:00'), 8.82, 0.86, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 9 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 10:28:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:14:00'), 7.75, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:15:00'), 8.41, 0.63, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:11:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:18:00'), 8.41, 0.43, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 10:18:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:09:00'), 7.20, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:41:00'), 8.25, 1.45, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (35, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:14:00'), 8.32, 0.60, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:18:00'), 8.82, 0.06, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:14:00'), 8.66, 1.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 09:10:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:29:00'), 8.31, 1.43, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:02:00'), 8.05, 1.38, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:09:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 13:30:00'), 3.71, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 10:41:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:02:00'), 7.65, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:35:00'), 8.54, 1.29, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:20:00'), 8.64, 0.40, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 10:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:28:00'), 7.36, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:35:00'), 8.30, 1.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (36, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:22:00'), 8.53, 0.31, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:03:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:02:00'), 8.13, 0.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 11 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 09:15:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 11 DAY), ' 18:37:00'), 8.62, 0.62, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 10 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 10:38:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), ' 18:05:00'), 7.54, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:02:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:20:00'), 8.61, 0.65, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:27:00'), 8.25, 0.09, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 13:07:00'), 4.30, 0.00, 'half_day');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 6 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 6 DAY), ' 18:40:00'), 8.23, 0.63, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:16:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:16:00'), 8.52, 1.13, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 4 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), ' 18:28:00'), 8.80, 0.91, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 09:13:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:27:00'), 8.33, 0.56, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:23:00'), 8.48, 0.11, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (37, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:07:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:01:00'), 8.72, 1.22, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 12 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 12 DAY), ' 18:33:00'), 8.07, 0.12, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 11 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 9 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 09:19:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 9 DAY), ' 18:12:00'), 8.06, 0.26, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 8 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 09:08:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 8 DAY), ' 18:24:00'), 8.87, 1.06, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 7 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 09:01:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 7 DAY), ' 18:43:00'), 8.44, 0.04, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 5 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 09:00:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), ' 18:31:00'), 8.85, 0.92, 'present');
INSERT INTO attendance (employee_id, work_date, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'absent');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 3 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 10:34:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), ' 18:19:00'), 7.40, 0.00, 'late');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 2 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 09:17:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), ' 18:19:00'), 8.73, 0.15, 'present');
INSERT INTO attendance (employee_id, work_date, check_in, check_out, work_hours, extra_hours, status) VALUES (38, DATE_SUB(CURDATE(), INTERVAL 1 DAY), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 09:05:00'), CONCAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), ' 18:07:00'), 8.59, 0.33, 'present');

-- ---------- Today: a few employees already checked in ----------
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (3, CURDATE(), CONCAT(CURDATE(), ' 09:14:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (4, CURDATE(), CONCAT(CURDATE(), ' 09:20:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (5, CURDATE(), CONCAT(CURDATE(), ' 09:10:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (6, CURDATE(), CONCAT(CURDATE(), ' 09:03:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (7, CURDATE(), CONCAT(CURDATE(), ' 09:25:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (8, CURDATE(), CONCAT(CURDATE(), ' 09:19:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (9, CURDATE(), CONCAT(CURDATE(), ' 09:19:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (10, CURDATE(), CONCAT(CURDATE(), ' 09:17:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (11, CURDATE(), CONCAT(CURDATE(), ' 09:10:00'), 'present');
INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (12, CURDATE(), CONCAT(CURDATE(), ' 09:02:00'), 'present');

-- ---------- Sample leave requests ----------
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (3, 'sick', DATE_SUB(CURDATE(), INTERVAL 27 DAY), DATE_SUB(CURDATE(), INTERVAL 26 DAY), 'Personal work', 'rejected', 2, 'Please reschedule due to team workload.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (4, 'unpaid', DATE_SUB(CURDATE(), INTERVAL 26 DAY), DATE_SUB(CURDATE(), INTERVAL 23 DAY), 'Festival celebration', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (5, 'unpaid', DATE_ADD(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 'Not feeling well', 'pending', NULL, NULL);
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (6, 'unpaid', DATE_ADD(CURDATE(), INTERVAL 6 DAY), DATE_ADD(CURDATE(), INTERVAL 9 DAY), 'Not feeling well', 'pending', NULL, NULL);
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (7, 'sick', DATE_SUB(CURDATE(), INTERVAL 22 DAY), DATE_SUB(CURDATE(), INTERVAL 21 DAY), 'Not feeling well', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (8, 'unpaid', DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'Personal work', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (9, 'paid', DATE_SUB(CURDATE(), INTERVAL 17 DAY), DATE_SUB(CURDATE(), INTERVAL 15 DAY), 'Travel plans', 'rejected', 2, 'Please reschedule due to team workload.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (10, 'paid', DATE_SUB(CURDATE(), INTERVAL 28 DAY), DATE_SUB(CURDATE(), INTERVAL 27 DAY), 'Travel plans', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (11, 'sick', DATE_SUB(CURDATE(), INTERVAL 12 DAY), DATE_SUB(CURDATE(), INTERVAL 11 DAY), 'Family function', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (12, 'sick', DATE_SUB(CURDATE(), INTERVAL 19 DAY), DATE_SUB(CURDATE(), INTERVAL 17 DAY), 'Personal work', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (13, 'paid', DATE_SUB(CURDATE(), INTERVAL 8 DAY), DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'Not feeling well', 'rejected', 2, 'Please reschedule due to team workload.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (14, 'unpaid', DATE_SUB(CURDATE(), INTERVAL 19 DAY), DATE_SUB(CURDATE(), INTERVAL 17 DAY), 'Not feeling well', 'rejected', 2, 'Please reschedule due to team workload.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (15, 'sick', DATE_SUB(CURDATE(), INTERVAL 16 DAY), DATE_SUB(CURDATE(), INTERVAL 13 DAY), 'Not feeling well', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (16, 'paid', DATE_ADD(CURDATE(), INTERVAL 7 DAY), DATE_ADD(CURDATE(), INTERVAL 10 DAY), 'Personal work', 'pending', NULL, NULL);
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (17, 'sick', DATE_SUB(CURDATE(), INTERVAL 17 DAY), DATE_SUB(CURDATE(), INTERVAL 16 DAY), 'Personal work', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (18, 'sick', DATE_ADD(CURDATE(), INTERVAL 4 DAY), DATE_ADD(CURDATE(), INTERVAL 6 DAY), 'Personal work', 'pending', NULL, NULL);
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (19, 'paid', DATE_SUB(CURDATE(), INTERVAL 21 DAY), DATE_SUB(CURDATE(), INTERVAL 19 DAY), 'Travel plans', 'approved', 2, 'Approved. Enjoy your time off.');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, status, reviewed_by, review_comment) VALUES (20, 'paid', DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_SUB(CURDATE(), INTERVAL 0 DAY), 'Personal work', 'approved', 2, 'Approved. Enjoy your time off.');

-- ---------- Sample notifications ----------
INSERT INTO notifications (user_id, title, message) VALUES (3, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (4, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (5, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (6, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (7, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (8, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (9, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (10, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (11, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (12, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (13, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
INSERT INTO notifications (user_id, title, message) VALUES (14, 'Welcome to the team!', 'Your onboarding checklist is ready in your profile.');
