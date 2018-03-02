select SUBSTR(DiagID,1,3),DiagDes,count(*) total from BEC01020 A
inner join BEC01010 B on A.SerialNumber=B.SerialNumber
 where A.DiagID!='-' and B.OrgID_DisDiag='010101030110' group by SUBSTR(DiagID,1,3),DiagDes order by total desc FETCH FIRST 10 ROWS ONLY ;

select SUBSTR(DiagID,1,3) aa from BEC01020;
SELECT DiagDes FROM BEC01020 where (DiagID!='-') FETCH FIRST 10 ROWS ONLY ;
select OrgID_DisDiag from BEC01010 where OrgID_DisDiag='010101030110';


select * from Bright.BEC01020 A inner join Bright.BEC01010 B on A.SerialNumber=B.SerialNumber 
 where A.DiagRoleID='20' and B.AdmissionDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59';


//十大疾病
select A.DiagName,count(*) total from Bright.BIW01040 A inner join Bright.BIW01020 B on A.SerialNumber=B.SerialNumber
 where A.DiagRoleID='20' and B.AdmitDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59' and A.DiagName like '%冠状动脉%'
 group by A.DiagName order by total desc FETCH FIRST 10 ROWS ONLY ;

//十大手术-病案表
select A.OP_Des,count(*) total from Bright.BEC01030 A inner join Bright.BIW01020 B on A.SerialNumber=B.SerialNumber
 where  B.AdmitDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59' 
 group by A.OP_Des  order by total desc FETCH FIRST 12 ROWS ONLY ;

select A.OP_Des,count(*) total from Bright.BEC01030 A inner join Bright.BIW01020 B on A.SerialNumber=B.SerialNumber
 where  B.AdmitDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59' and A.OP_Des like '%白内障%'
 group by A.OP_Des  order by total desc FETCH FIRST 13 ROWS ONLY ;

//手术表
select OPName,count(*) total from Bright.BIW03010 where ApplyDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59'
group by OPName order by total desc FETCH FIRST 10 ROWS ONLY ;
