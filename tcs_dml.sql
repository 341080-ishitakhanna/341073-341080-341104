-- 1. Create Departments
INSERT INTO Departments (name, location) VALUES 
('Banking & Financial Services (BFS)', 'Mumbai'),
('Retail & CPG', 'Bangalore'),
('Life Sciences', 'Hyderabad'),
('Internal IT', 'Chennai');

-- 2. Create Employees (Associates)
INSERT INTO Employees (full_name, email, designation, salary, dept_id, is_bench) VALUES 
('Ravi Kumar', 'ravi.k@tcs.com', 'Project Manager', 25000.00, 1, 0),
('Anita Singh', 'anita.s@tcs.com', 'System Engineer', 12000.00, 1, 0),
('John Doe', 'john.d@tcs.com', 'Assistant System Engineer', 8000.00, 2, 0),
('Priya Sharma', 'priya.s@tcs.com', 'Technical Lead', 18000.00, 3, 1), -- On Bench
('Mike Smith', 'mike.s@tcs.com', 'Business Analyst', 15000.00, 1, 0);

-- 3. Create Clients
INSERT INTO Clients (company_name, industry, country) VALUES 
('Citibank', 'Banking', 'USA'),
('Walmart', 'Retail', 'USA'),
('Pfizer', 'Healthcare', 'UK');

-- 4. Create Projects
INSERT INTO Projects (title, client_id, budget, start_date, status) VALUES 
('Citi Mobile App Migration', 1, 500000.00, '2025-01-10', 'Active'),
('Walmart Supply Chain AI', 2, 1200000.00, '2025-02-01', 'Planning'),
('Pfizer Data Lake Setup', 3, 300000.00, '2024-11-15', 'Completed');

-- 5. Allocate Employees to Projects
INSERT INTO Project_Allocations (project_id, emp_id, role_on_project, billing_rate_per_hour) VALUES 
-- Citi Project Allocations
(1, 1, 'Project Manager', 80.00), -- Ravi
(1, 2, 'Java Developer', 40.00),    -- Anita
(1, 5, 'Business Analyst', 50.00),  -- Mike
-- Walmart Project Allocations
(2, 3, 'Python Developer', 35.00);  -- John
-- Priya is not allocated (She is on the bench)