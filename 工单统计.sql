select DLNOffice.dbo.Users.UserName as 提交人,DLNOffice.dbo.Users.IDNumber as 身份证号,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59' 
group by DLNOffice.dbo.Users.UserName,DLNOffice.dbo.Users.IDNumber order by total desc


select title 标题,details 详情,address 地址,name 联系人,dt_order.telephone 电话,username 提交人工号,dt_order.add_time 提交时间,dt_type_list.typeName 科室,dt_manager.real_name 处理人, dt_order.update_time 处理时间 from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id 
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-11-01 00:00:00' and '2017-12-31 23:59:59' and state='3' 

select DLNOffice.dbo.Users.UserName as 提交人,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as  总计
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-30 23:59:59'
group by DLNOffice.dbo.Users.UserName order by 总计 desc


select A.Username 工号,A.Name 姓名,A.ID 身份证号,A.Bank 银行账户,A.Department 科室 from fanpin A where A.TypeName='临时' and Name in(select distinct DLNOffice.dbo.Users.UserName from dt_order 
inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59')


select dt_manager.real_name as 处理人,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as 总计
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59'
group by dt_manager.real_name order by 总计 desc

select dt_type_list.typeName as 科室,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as 总计
from dt_order  inner join dt_manager
on dt_order.update_name=dt_manager.user_name
inner join dt_type_list on dt_manager.group_id=dt_type_list.typeID
where dt_order.add_time between '2017-09-01 00:00:00' and '2017-09-31 23:59:59'
group by dt_type_list.typeName order by 总计 desc


select  sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total
from dt_order
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59' and group_id like '03%'

select dt_order.address as 科室,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59'
group by dt_order.address order by total desc


--科室统计
select UserInfo.Department, sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total
from dt_order 
inner join DLNOffice.dbo.Users D on D.UserId=dt_order.username
inner join UserInfo on D.UserName=UserInfo.Name
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59'
group by UserInfo.Department order by total desc

select distinct A.Department from UserInfo A where Name in(select distinct DLNOffice.dbo.Users.UserName from dt_order 
inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-06-01 00:00:00' and '2017-06-30 23:59:59')

