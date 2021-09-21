CREATE TABLE Rating (
	Id int not null PRIMARY KEY identity(1 , 1),
	Stars int not null check (Stars >= 1 and Stars <= 5),
	Comment varchar(300) null, 
	StudentId int not null FOREIGN KEY references Students(Id),
	TopicId int not null FOREIGN KEY references Topics(Id)
);

INSERT Rating
	(Stars, Comment, StudentId, TopicId)
	VALUES
	(3, 'This was way too easy', (SELECT Id from Students where Name = 'Matt'), 
									(SELECT Id from Topics 
										where Description like '%Git%'));
