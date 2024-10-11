% Вариант 3
:- consult(three).

% Для каждого студента, найти средний балл, и сдал ли он экзамены или нет
avg_grades(Grades, AverageGrades) :-
    findall(X, member(grade(_, X), Grades), GradesAsNumbers),
    sum_list(GradesAsNumbers, GradesSum),
    length(GradesAsNumbers, GradesCount),
    AverageGrades is GradesSum / GradesCount.

passed_exams(Grades, PassedExams) :-
    findall(X, (member(grade(_, X), Grades), X < 3), BadGrades),
    length(BadGrades, BadGradesCount),
    (BadGradesCount == 0 -> PassedExams is 1; PassedExams is 0).

avg_grades_and_passed(StudentName, AverageGrades, PassedExams) :-
    student(_, StudentName, Grades),
    avg_grades(Grades, AverageGrades),
    passed_exams(Grades, PassedExams).


% Для каждого предмета, найти количество не сдавших студентов
has_student_not_passed(StudentName, SubjectId) :-
    student(_, StudentName, Grades),
    member(grade(SubjectId, Mark), Grades),
    Mark < 3.

subject_not_passed(SubjectId, SubjectName, NotPassedStudentNames) :-
    subject(SubjectId, SubjectName),
    findall(StudentName, has_student_not_passed(StudentName, SubjectId), NotPassedStudentNames).


% Для каждой группы, найти студента (студентов) с максимальным средним баллом
find_max_avg_student(GroupId, StudentName, AverageGrade) :-
    findall(X, (student(GroupId, _, Grades), avg_grades(Grades, X)), AverageGrades),
    max_member(MaxAverageGrade, AverageGrades),
    student(GroupId, StudentName, Grades),
    avg_grades(Grades, AverageGrade),
    AverageGrade == MaxAverageGrade.
