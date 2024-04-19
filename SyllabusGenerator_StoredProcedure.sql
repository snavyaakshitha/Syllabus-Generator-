use SyllabusGenerator
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.spFetchSyllabusDetails'))
   drop proc spFetchSyllabusDetails
GO

Create proc spFetchSyllabusDetails 
    @ProfessorID Int ,
    @SyllabusID Int
AS
BEGIN

Select ss.*, cs.*
from syllabus ss with (nolock) inner join CourseSchedule cs with (nolock) on ss.SyllabusID = cs.SyllabusID
where ss.SyllabusID = @SyllabusID and ProfessorID = @ProfessorID


END

--
--exec spFetchSyllabusDetails 1, 1















