% Вариант 1
:- consult(one).

% Получить таблицу групп и средний балл по каждой из групп
groups_with_avg(GroupNo, AverageGrade) :-
    bagof(StudentName, student(GroupNo, StudentName), StudentsNames),
    findall(Grade, (member(StudentName, StudentsNames), grade(StudentName, _, Grade)), GradesAsNumbers),
    length(GradesAsNumbers, GradesCount),
    (GradesCount = 0 -> AverageGrade is 0 ; sum_list(GradesAsNumbers, GradesSum), AverageGrade is GradesSum / GradesCount).


% Для каждого предмета получить список студентов, не сдавших экзамен 
subject_not_passed(SubjectName, NotPassedStudentNames) :-
    subject(SubjectId, SubjectName),
    findall(StudentName, grade(StudentName, SubjectId, 2), NotPassedStudentNames).


% Найти количество не сдавших студентов в каждой из групп
group_not_passed_count(GroupNo, NotPassedStudentsCount) :-
    bagof(StudentName, student(GroupNo, StudentName), StudentsNames),
    findall(StudentName, (grade(StudentName, _, 2), member(StudentName, StudentsNames)), NotPassedStudents),
    length(NotPassedStudents, NotPassedStudentsCount).
