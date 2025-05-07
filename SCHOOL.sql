USE student;

SELECT* FROM student_raw;

/*1.	List the number of girls of each district.*/
SELECT DCode, COUNT(*) AS girls_number
FROM student_raw
WHERE Sex = 'F'
GROUP BY DCode;

/*2.	List the max. and min. test score of Class 1 students of each district.*/

SELECT DCode,
       MAX(PTest) AS max_score,
       MIN(PTest) AS min_score
FROM student_raw
WHERE class = '1A'
GROUP BY DCode;


/*3.	List the average Math test score of the boys in each class. The list should not contain 
class with less than 3 boys.*/

SELECT class,
       AVG(MTest) AS avg_math_score,
       COUNT(*) AS number_of_boys
FROM student_raw
WHERE Sex = 'M'
GROUP BY class
HAVING COUNT(*) >= 3;

/*4.	List the boys of class 1A, sorted by their names*/

SELECT *
FROM student_raw
WHERE Sex = 'M' AND class = '1A'
ORDER BY FullName ASC;

/*5.	 List the 1B students by their residential district*/

SELECT *
FROM student_raw
WHERE Class = '1B'
ORDER BY DCode ASC;

/*6.	List the number of students of each district (in desc. order).*/


SELECT DCode, COUNT(*) AS number_of_students
FROM student_raw
GROUP BY DCode
ORDER BY number_of_students DESC;

/*7.	List the boys of each house sorted by the classes. (2-level ordering)*/
SELECT *
FROM student_raw
WHERE Sex = 'M'
ORDER BY HCode ASC, Class ASC;

/*8.List the top 10% scoring girls students in Maths*/



/*9.	Print the name of the second highest scorer in Maths Test*/
SELECT FullName,MTest
FROM student_raw
ORDER BY MTest DESC
LIMIT 1 OFFSET 1;

/*10.	How many students have unique names?*/
 SELECT COUNT(*) AS unique_name_count
FROM (SELECT FullName
    FROM student_raw
    GROUP BY FullName
    HAVING COUNT(*) = 1
) AS unique_names;

/*11.	How many dumbs and scholar students are there in the table (Scholar Criteria – Mtest > 95. Everyone else is dumb).*/
SELECT
    SUM(CASE WHEN Mtest > 95 THEN 1 ELSE 0 END) AS ScholarStudents,
    SUM(CASE WHEN Mtest <= 95 THEN 1 ELSE 0 END) AS DumbStudents
FROM
    student_raw; 
    
 /*   12.	Find the 4th lowest scorer in Maths and Phy test scores combined*/
 SELECT (MTest + PTest) AS CombinedScore,MTest,PTest,FullName
FROM student_raw
ORDER BY CombinedScore DESC
LIMIT 1 OFFSET 3;

/*14.	Categorize the students into 3 categories: 
Scholars - Students who have scored more than 95 in Maths
Average - Students who have scored between 90 and 94 in Maths
Dumbs - Students who have scored less than 90 */

SELECT FullName,MTest,
    CASE
        WHEN MTest > 95 THEN 'Scholars'
        WHEN MTest BETWEEN 90 AND 94 THEN 'Average'
        WHEN MTest < 90 THEN 'Dumbs'
    END AS category
FROM student_raw;

/*15.	Use user defined variable to find the total number of girls in the student table. Then, show 10% of total no. of girls.*/

SET @total_girls := (
    SELECT COUNT(*) FROM student_raw WHERE Sex = 'F'
);
SELECT @total_girls AS total_girls,
       ROUND(@total_girls * 0.10) AS ten_percent_of_girls;
  
  
/*1.	Find average age of all boys students*/
SELECT AVG(DOB) AS average_age_of_boys
FROM student_RAW
WHERE sEX = 'M';
  
 /* 2.	Create a monthly birthday frequency table*/
SELECT MONTH(DOB) AS birth_month,
    COUNT(*) AS birthday_count
FROM student_raw
GROUP BY MONTH(DOB)
ORDER BY birth_month;

