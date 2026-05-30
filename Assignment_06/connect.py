import pymysql

def create_connection():
    try:
        connection = pymysql.connect(
            host='localhost',
            user='root',
            password='Bhagwat'
        )
        print("Connected to MySQL database")
        return connection
    except pymysql.MySQLError as e:
        print(f"Error while connecting to MySQL: {e}")
        return None

def create_database():
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("CREATE DATABASE IF NOT EXISTS EducationalInstitute")
            print("Database created or already exists.")
        except pymysql.MySQLError as e:
            print(f"Error while creating database: {e}")
        finally:
            cursor.close()
            connection.close()

def create_tables():
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute(""" 
                CREATE TABLE IF NOT EXISTS Students (
                    student_id INT AUTO_INCREMENT PRIMARY KEY,
                    first_name VARCHAR(50),
                    last_name VARCHAR(50),
                    age INT,
                    email VARCHAR(100)
                );
            """)
            cursor.execute(""" 
                CREATE TABLE IF NOT EXISTS Courses (
                    course_id INT AUTO_INCREMENT PRIMARY KEY,
                    course_name VARCHAR(100),
                    course_duration VARCHAR(50)
                );
            """)
            print("Tables created successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while creating tables: {e}")
        finally:
            cursor.close()
            connection.close()

def drop_database():
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("DROP DATABASE IF EXISTS EducationalInstitute")
            print("Database dropped successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while dropping database: {e}")
        finally:
            cursor.close()
            connection.close()

def insert_student(first_name, last_name, age, email):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("""
                INSERT INTO Students (first_name, last_name, age, email)
                VALUES (%s, %s, %s, %s)
            """, (first_name, last_name, age, email))
            connection.commit()
            print("Student inserted successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while inserting student: {e}")
        finally:
            cursor.close()
            connection.close()

def insert_course(course_name, course_duration):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("""
                INSERT INTO Courses (course_name, course_duration)
                VALUES (%s, %s)
            """, (course_name, course_duration))
            connection.commit()
            print("Course inserted successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while inserting course: {e}")
        finally:
            cursor.close()
            connection.close()

def select_students():
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("SELECT * FROM Students")
            students = cursor.fetchall()
            if students:
                print("Students:")
                for student in students:
                    print(student)
            else:
                print("No students found.")
        except pymysql.MySQLError as e:
            print(f"Error while fetching students: {e}")
        finally:
            cursor.close()
            connection.close()

def select_courses():
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("SELECT * FROM Courses")
            courses = cursor.fetchall()
            if courses:
                print("Courses:")
                for course in courses:
                    print(course)
            else:
                print("No courses found.")
        except pymysql.MySQLError as e:
            print(f"Error while fetching courses: {e}")
        finally:
            cursor.close()
            connection.close()

def update_student(student_id, first_name, last_name, age, email):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("""
                UPDATE Students
                SET first_name = %s, last_name = %s, age = %s, email = %s
                WHERE student_id = %s
            """, (first_name, last_name, age, email, student_id))
            connection.commit()
            print("Student updated successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while updating student: {e}")
        finally:
            cursor.close()
            connection.close()

def delete_student(student_id):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("DELETE FROM Students WHERE student_id = %s", (student_id,))
            connection.commit()
            print("Student deleted successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while deleting student: {e}")
        finally:
            cursor.close()
            connection.close()

def update_course(course_id, course_name, course_duration):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("""
                UPDATE Courses
                SET course_name = %s, course_duration = %s
                WHERE course_id = %s
            """, (course_name, course_duration, course_id))
            connection.commit()
            print("Course updated successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while updating course: {e}")
        finally:
            cursor.close()
            connection.close()

def delete_course(course_id):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        try:
            cursor.execute("USE EducationalInstitute")
            cursor.execute("DELETE FROM Courses WHERE course_id = %s", (course_id,))
            connection.commit()
            print("Course deleted successfully.")
        except pymysql.MySQLError as e:
            print(f"Error while deleting course: {e}")
        finally:
            cursor.close()
            connection.close()

def menu():
    while True:
        print("\nMenu:")
        print("1. Insert Student")
        print("2. Update Student")
        print("3. Delete Student")
        print("4. View Students")
        print("5. Insert Course")
        print("6. Update Course")
        print("7. Delete Course")
        print("8. View Courses")
        print("9. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            first_name = input("Enter first name: ")
            last_name = input("Enter last name: ")
            age = int(input("Enter age: "))
            email = input("Enter email: ")
            insert_student(first_name, last_name, age, email)
        elif choice == '2':
            student_id = int(input("Enter student ID to update: "))
            first_name = input("Enter first name: ")
            last_name = input("Enter last name: ")
            age = int(input("Enter age: "))
            email = input("Enter email: ")
            update_student(student_id, first_name, last_name, age, email)
        elif choice == '3':
            student_id = int(input("Enter student ID to delete: "))
            delete_student(student_id)
        elif choice == '4':
            select_students()
        elif choice == '5':
            course_name = input("Enter course name: ")
            course_duration = input("Enter course duration: ")
            insert_course(course_name, course_duration)
        elif choice == '6':
            course_id = int(input("Enter course ID to update: "))
            course_name = input("Enter course name: ")
            course_duration = input("Enter course duration: ")
            update_course(course_id, course_name, course_duration)
        elif choice == '7':
            course_id = int(input("Enter course ID to delete: "))
            delete_course(course_id)
        elif choice == '8':
            select_courses()
        elif choice == '9':
            print("Exiting...")
            break
        else:
            print("Invalid choice, please try again.")

if __name__ == "__main__":
    create_database()  
    create_tables()    
    menu()
    drop_database()    
