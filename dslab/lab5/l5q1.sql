create table student(
    regno varchar(20) primary key,
    name varchar(50),
    major varchar(20),
    bdate date
);

create table course(
    course# int primary key,
    cname varchar(30),
    dept varchar(30)
);

create table text(
    book_isbn int primary key,
    booktitle varchar(50),
    publisher varchar(50),
    author varchar(50)
);

create table enroll(
  regno varchar(20) references student,
  course# int references course,
  sem int,
  book_isbn int references text
);

create table book_adoption(
    course# int references course,
    sem int,
    book_isbn int references text
);



insert into student values(1, 'Rohan', 'CCE', '01-MAR-24');
insert into student values(2, 'Suresh', 'IT', '01-FEB-24');
insert into student values(3, 'Ben', 'CSE', '03-JAN-24');
insert into student values(4, 'Peter', 'CCE', '11-NOV-23');
insert into student values(5, 'Mary', 'Mech', '12-DEC-23');
insert into student values(6, 'Arthur', 'EEE', '12-OCT-13');



insert into course values(4545, 'CCE', 'ICT');
insert into course values(4556, 'Mech', 'Mechanical');
insert into course values(4577, 'IT', 'ICT');
insert into course values(4532, 'CSE', 'CSE');
insert into course values(4512, 'EEE', 'EE');

insert into text values(1234, 'Cpp', 'A', 'A1');
insert into text values(1235, 'cython', 'B', 'A2');
insert into text values(1236, 'Embedded', 'C', 'A3');
insert into text values(1237, 'Cars', 'D', 'A4');
insert into text values(1238, 'Math', 'E', 'A5');

insert into enroll values(1, 4545, 1, 1234);
insert into enroll values(2, 4556, 2, 1235);
insert into enroll values(3, 4577, 3, 1236);
insert into enroll values(4, 4532, 3, 1237);
insert into enroll values(5, 4512, 3, 1237);

insert into book_adoption values(4545, 1, 1234);
insert into book_adoption values(4545, 2, 1235);
insert into book_adoption values(4556, 1, 1238);
insert into book_adoption values(4512, 2, 1236);
insert into book_adoption values(4512, 3, 1236);
insert into book_adoption values(4577, 2, 1234);
insert into book_adoption values(4532, 2, 1234);

-- a)
select cname, course#
from course
where course# in (select course#
                    from book_adoption
                    group by course#
                    having count(*) > 1);

-- b)
select dept, count(distinct publisher) from 
(select dept ,book_isbn from course natural join enroll) w, text 
where text.book_isbn = w.book_isbn 
group by dept having count(distinct publisher) < 2;

-- c)
select name from student 
where 
(select count(distinct(course.dept)) from enroll, course 
where (enroll.regno=student.regno) and (course.course# = enroll.course#)) > 1;

-- d)
select *
    from student
    where regno not in (select regno
                        from enroll);

-- h
SELECT s.name
FROM STUDENT s
WHERE s.regno = (
    SELECT e.regno
    FROM (
        SELECT e.regno, COUNT(DISTINCT e.book_isbn) as book_count
        FROM ENROLL e
        GROUP BY e.regno
        ORDER BY book_count DESC
    ) e
    WHERE ROWNUM = 1
);

