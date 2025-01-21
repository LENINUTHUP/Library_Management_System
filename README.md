# Library_Management_System
The Library Management System (LMS) is a comprehensive software application designed to streamline the management of library resources, including books, branches, employees, and customers. The system aims to enhance the efficiency of library operations, improve user experience, and provide a robust platform for tracking and managing library assets.
Objectives
The primary objectives of the Library Management System are:

Resource Management: To maintain an organized database of books, including their availability, categories, rental prices, and authors.
User Management: To manage customer information, including registration details and borrowing history.
Employee Management: To keep track of library staff, their roles, and their respective branches.
Transaction Tracking: To monitor the issuance and return of books, ensuring accurate records of borrowed items.
Reporting: To generate reports on various aspects of library operations, such as book availability, employee distribution, and customer activity.
Database Design
The LMS is built on a relational database model, consisting of six main tables:

Branch: Stores information about different library branches, including branch number, manager ID, address, and contact number.
Employee: Contains details about library employees, including employee ID, name, position, salary, and the branch they belong to.
Books: Maintains a catalog of books, including ISBN, title, category, rental price, availability status, author, and publisher.
Customer: Records customer information, including customer ID, name, address, and registration date.
IssueStatus: Tracks the issuance of books to customers, including issue ID, customer ID, book title, issue date, and ISBN of the book.
ReturnStatus: Monitors the return of books, including return ID, customer ID, book title, return date, and ISBN of the book.
Key Features
Book Availability: Users can easily check the availability of books and their details.
Employee Management: Administrators can manage employee records and their respective branches.
Customer Registration: New customers can register and their information is stored for future reference.
Issuing and Returning Books: The system allows for the tracking of books issued to customers and their return status.
Reporting and Analytics: The system can generate reports on book categories, employee distribution, and customer activity.
SQL Queries
The system supports various SQL queries to retrieve and manipulate data, such as:

Retrieving available books and their details.
Listing employees and their salaries.
Tracking which customers have issued specific books.
Counting the total number of books in each category.
Identifying customers who have not issued any books.
Conclusion
The Library Management System is a vital tool for modern libraries, providing a structured approach to managing resources and enhancing user experience. By implementing this system, libraries can improve operational efficiency, ensure accurate record-keeping, and provide better services to their patrons. The project serves as a practical application of database management principles and SQL, showcasing the importance of technology in the management of library resources.
