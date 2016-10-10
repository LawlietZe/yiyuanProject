-- 根据用户id查找该用户姓名和获得的奖项和项目名称
select username,img_id,project_name,reward_name,pj.project_id
from   ((((buy_logs as bl inner join usertable as ut on bl.userid = ut.userid)
        inner join project as pj on pj.project_id = bl.project_id)
        inner join reward as rd on rd.project_id = pj.project_id)
        inner join img as ig on ig.reward_id = rd.reward_id)
where ut.userid = 10000418;

-- 根据用户id查找该用户姓名和获得的奖项和项目名称
select username,img_id,project_name,reward_name,pj.project_id
from   ((((buy_logs as bl inner join usertable as ut on bl.userid = ut.userid)
        inner join project as pj on pj.project_id = bl.project_id)
        inner join reward as rd on rd.project_id = pj.project_id)
        inner join img as ig on ig.reward_id = rd.reward_id)
where ut.userid = 10000418 and pj.project_status = 1;

-- 查找在某个时间段内截至的项目的名称 id
select project_id,project_name
from project
where end_time between '2010-7-12 11:18:54' and '2017-7-12 11:22:20';

-- 查找在某个时间段内截至的项目的名称id 和 获奖名
select pj.project_id,pj.project_name,rd.reward_name
from (project as pj inner join reward as rd on pj.project_id = rd.project_id)
where end_time between '2010-7-12 11:18:54' and '2017-7-12 11:22:20';

-- 已知项目信息 获取参与者信息
select ut.userid,bl.buy_time,ut.city_code
from ((project as pj inner join buy_logs as bl on pj.project_id = bl.project_id)
       inner join usertable as ut on ut.userid = bl.userid)
where pj.project_id = 1;

-- 已知项目ID 和 userid 查询该用户购买该项目的数目
select count(1) from buy_logs where project_id = '1' and userid = '10000418';

-- 已知项目ID 和 userid 查询该用户购买该项目的幸运码
select buy_log_id from buy_logs where project_id = '1' and userid = '10000418';

-- 已知项目ID 查询该项目开始时间/结束时间
select start_time,end_time from project where project_id = '1';

select username,img_id,project_name,reward_name,pj.project_id
from   ((((buy_logs as bl inner join usertable as ut on bl.userid = ut.userid)
        inner join project as pj on pj.project_id = bl.project_id)
        inner join reward as rd on rd.project_id = pj.project_id)
        inner join img as ig on ig.reward_id = rd.reward_id)
where ut.userid = 10000418 and pj.project_id = 1;
