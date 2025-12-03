DROP DATABASE IF EXISTS TCS_Clone;
CREATE DATABASE TCS_Clone;
USE TCS_Clone;

-- 1. Departments (Organizing the workforce, e.g., 'BFS', 'Retail', 'Cloud')
CREATE TABLE Departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) DEFAULT 'Mumbai' -- e.g., TCS Olympus, TCS Gateway
);

-- 2. Employees (The core asset - 'Associates')
CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    designation VARCHAR(100) NOT NULL, -- e.g., 'System Engineer', 'Project Manager'
    hire_date DATE DEFAULT (CURRENT_DATE),
    salary DECIMAL(10, 2),
    dept_id INT,
    is_bench TINYINT(1) DEFAULT 0, -- 1 if not assigned to a project (On Bench)
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- 3. Clients (The customers TCS bills)
CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(100), -- e.g., 'Banking', 'Healthcare'
    country VARCHAR(50) NOT NULL
);

-- 4. Projects (The work being delivered)
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    client_id INT NOT NULL,
    budget DECIMAL(15, 2) NOT NULL, -- Project revenue
    start_date DATE NOT NULL,
    end_date DATE,
    status ENUM('Planning', 'Active', 'Completed', 'On Hold') DEFAULT 'Planning',
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE
);

-- 5. Project_Allocations (Mapping Employees to Projects - Like 'Enrollments' in Udemy)
CREATE TABLE Project_Allocations (
    allocation_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    emp_id INT NOT NULL,
    role_on_project VARCHAR(100), -- e.g., 'Backend Dev', 'QA Tester'
    allocation_date DATE DEFAULT (CURRENT_DATE),
    billing_rate_per_hour DECIMAL(10,2), -- How much TCS charges client for this person
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);