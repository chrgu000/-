select dt_manager.real_name as 处理人,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total 
from dt_order  inner join dt_manager on dt_order.update_name=dt_manager.user_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' 
group by dt_manager.real_name order by total desc


select DLNOffice.dbo.Users.UserId as 提交人,DLNOffice.dbo.Users.IDNumber as 身份证号,sum(case when dt_order.state = 0 then 1 else 0 end) as 待处理,sum(case when dt_order.state = 1 then 1 else 0 end) as 处理中,sum(case when dt_order.state = 2 then 1 else 0 end) as 驳回,sum(case when dt_order.state = 3 then 1 else 0 end) as 完成,count(dt_order.state) as total
from dt_order  inner join DLNOffice.dbo.Users on dt_order.username=DLNOffice.dbo.Users.UserId 
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' 
group by DLNOffice.dbo.Users.UserId,DLNOffice.dbo.Users.IDNumber order by total desc


select title 标题,details 详情,address 地址,name 联系人,dt_order.telephone 电话,username 提交人工号,dt_order.add_time 提交时间,dt_type_list.typeName 科室,dt_manager.real_name 处理人, dt_order.update_time 处理时间 from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' and state='3' and username
 in ('2006','1260','1089','1461','1073','1111','1082','1106','1159','1272','2002','1183','1241','1564','1115','1153','1069')
 order by name desc


 select title 标题,details 详情,address 地址,name 联系人,dt_order.telephone 电话,username 提交人工号,dt_order.add_time 提交时间,dt_type_list.typeName 科室,dt_manager.real_name 处理人, dt_order.update_time 处理时间 from dt_order
 left join dt_type_list on dt_order.type=dt_type_list.id
 left join dt_manager on dt_manager.user_name=dt_order.update_name
where dt_order.add_time between '2017-07-01 00:00:00' and '2017-07-31 23:59:59' and state='3' and dt_order.username=dt_order.update_name
 order by name desc




