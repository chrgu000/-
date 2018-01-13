select SUBSTR(DiagID,1,3),DiagDes,count(*) total from BEC01020 A
inner join BEC01010 B on A.SerialNumber=B.SerialNumber
 where A.DiagID!='-' and B.OrgID_DisDiag='010101030110' group by SUBSTR(DiagID,1,3),DiagDes order by total desc FETCH FIRST 10 ROWS ONLY ;
select SUBSTR(DiagID,1,3) aa from BEC01020;
SELECT DiagDes FROM BEC01020 where (DiagID!='-') FETCH FIRST 10 ROWS ONLY ;
select OrgID_DisDiag from BEC01010 where OrgID_DisDiag='010101030110';


