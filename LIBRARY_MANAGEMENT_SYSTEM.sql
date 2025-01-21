CREATE DATABASE library;

USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St, City A', '123-456-7890'),
(2, 102, '456 Elm St, City B', '234-567-8901'),
(3, 103, '789 Oak St, City C', '345-678-9012');

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Smith', 'Manager', 60000, 1),
(2, 'Bob Johnson', 'Librarian', 45000, 1),
(3, 'Charlie Brown', 'Assistant', 30000, 2),
(4, 'David Wilson', 'Manager', 70000, 2),
(5, 'Eva Green', 'Librarian', 50000, 3);

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'Book A', 'Fiction', 20.00, 'yes', 'Author A', 'Publisher A'),
('978-1-23-456789-7', 'Book B', 'Non-Fiction', 25.00, 'yes', 'Author B', 'Publisher B'),
('978-0-12-345678-9', 'Book C', 'Science', 30.00, 'no', 'Author C', 'Publisher C'),
('978-0-12-345679-6', 'Book D', 'History', 15.00, 'yes', 'Author D', 'Publisher D'),
('978-0-12-345670-3', 'Book E', 'Fiction', 22.00, 'yes', 'Author E', 'Publisher E'),
('978-0-12-345671-0', 'Book F', 'Fiction', 18.00, 'no', 'Author F', 'Publisher F');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John Doe', '101 First St, City A', '2021-05-15'),
(2, 'Jane Smith', '202 Second St, City B', '2020-08-20'),
(3, 'Emily Davis', '303 Third St, City C', '2022-01-10'),
(4, 'Michael Brown', '404 Fourth St, City A', '2019-11-30'),
(5, 'Sarah Wilson', '505 Fifth St, City B', '2021-12-01');

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    ISBN_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book) VALUES
(1, 1, 'Book A', '2023-06-01', '978-3-16-148410-0'),
(2, 2, 'Book B', '2023-06-05', '978-1-23-456789-7'),
(3, 3, 'Book C', '2023-06-10', '978-0-12-345678-9'),
(4, 4, 'Book D', '2023-06-15', '978-0-12-345679-6'),
(5, 5, 'Book E', '2023-06-20', '978-0-12-345670-3');

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    ISBN_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN));

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2) VALUES
(1, 1, 'Book A', '2023-06-10', '978-3-16-148410-0'),
(2, 2, 'Book B', '2023-06-12', '978-1-23-456789-7'),
(3, 3, 'Book C', '2023-06-15', '978-0-12-345678-9'),
(4, 4, 'Book D', '2023-06-20', '978-0-12-345679-6'),
(5, 5, 'Book E', '2023-06-25', '978-0-12-345670-3');

#1  Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

#2. List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name 
FROM IssueStatus ISU 
JOIN Books B ON ISU.ISBN_book = B.ISBN 
JOIN Customer C ON ISU.Issued_cust = C.Customer_Id;

#4. Display the total count of books in each category

SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

#5 .Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

#6 .List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name 
FROM Customer C 
WHERE Reg_date < '2022-01-01' 
AND NOT EXISTS (SELECT 1 FROM IssueStatus ISU WHERE ISU.Issued_cust = C.Customer_Id);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

#8 Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT C.Customer_name 
FROM IssueStatus ISU
JOIN Customer C ON ISU.Issued_cust = C.Customer_Id 
WHERE MONTH(ISU.Issue_date) = 6 AND YEAR(ISU.Issue_date) = 2023;

#9 Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Category = 'History';

-- Adding more employees to Branch 1
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(11, 'Liam Brown', 'Librarian', 48000, 1),
(12, 'Olivia Smith', 'Assistant', 32000, 1),
(13, 'Noah Johnson', 'Librarian', 50000, 1),
(14, 'Emma Davis', 'Assistant', 29000, 1),
(15, 'Ava Wilson', 'Manager', 75000, 1);
#10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

#11 Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address 
FROM Employee E 
JOIN Branch B ON E.Branch_no = B.Branch_no 
WHERE E.Position = 'Manager';

#12 Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name 
FROM IssueStatus ISU 
JOIN Books B ON ISU.ISBN_book = B.ISBN 
JOIN Customer C ON ISU.Issued_cust = C.Customer_Id 
WHERE B.Rental_Price > 25;