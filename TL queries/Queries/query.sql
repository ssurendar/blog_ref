/*(select TeacherId from class_teachers where class_teachers.ClassViewRegId in (select ClassViewRegId from class_subjects where class_subjects.ClassId  in (select ClassId from class inner join schools where schools.SchoolId=class.SchoolId)));

select distinct  t1.ClassId,t1.SchoolId from class as t1 join schools t2 on t1.SchoolId=t2.SchoolId;
*/

select distinct ct.TeacherId from class_teachers as ct
	join class_view_details cvr 
		on ct.ClassViewRegId=cvr.ClassViewRegId 
	join class cls 
		on cvr.ClassId=cls.ClassId
	join schools scls
		on cls.SchoolId=scls.SchoolId ;

select distinct ct.TeacherId,up.FirstName from class_teachers as ct
join user_profiles up
	on ct.TeacherId=up.ProfileId
join user_profiles_school ups
	on  up.ProfileId = ups.ProfileId
join schools scls
	on ups.SchoolId=scls.SchoolId;


select distinct cls.className from class as cls
/*
join schools scls
	on cls.schoolId=scls.schoolId
*/
join user_profiles_school ups
	on cls.schoolId=ups.schoolId
join teacher_profiles tp
	on ups.profileId=tp.profileId;

select distinct cls.ClassName from class as cls
join class_teachers ct
	on cls.ClassId=ct.ClassId
join user_profiles_school ups
	on ct.TeacherId=ups.ProfileId;


select distinct up.FirstName,ups.ProfileId from user_profiles as up
join user_profiles_school ups
	on up.ProfileId=ups.ProfileId
join schools scls
	on ups.SchoolId=scls.SchoolId;


/*5.Write a query to get all the assignments assigned to a student for a given studentId  */

select a1.AssignmentId,a1.assignmentName from assignments as a1
join assignment_assigned aa
	on a1.AssignmentId=aa.AssignmentId

