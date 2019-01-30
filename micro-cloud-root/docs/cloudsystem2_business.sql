SELECT * FROM mem_dept WHERE FIND_IN_SET(id,getMemDeptChildren('1'));
SELECT * FROM mem_dept WHERE FIND_IN_SET(id,getMemDeptParentList('4')) ORDER BY SORT_NUM asc;
SELECT * FROM mem_dept where sort_num=(select max(sort_num) from mem_dept ) ;



-- 同步菜单表到资源表

-- 添加菜单到资源表
INSERT INTO sys_resources (ID, `NAME`, PARENT_ID) SELECT
	a.id,
	a. NAME,
	a.PARENT_ID
FROM
	sys_menu AS a
WHERE
	a.ID NOT IN (SELECT id FROM sys_resources);
-- 同步更新menu的到resources表
UPDATE sys_resources as a INNER JOIN sys_menu as b on a.id=b.id SET a.NAME=b.`NAME`,a.parent_id=b.PARENT_ID where a.id=b.id=1;

-- 同步删除menu的到resources表
DELETE FROM sys_resources as a WHERE a.id='2'

-- 根据用户ID查询所对应的用户和角色列表


SELECT
	DISTINCT
	a.ID AS USER_ID,
	a.`NAME` AS USER_NAME,
	c.ID AS ROLE_ID,
	c.`NAME` AS ROLE_NAME
FROM
	(
		SELECT
			*
		FROM
			sys_user
		WHERE
			ID = '1'
	) AS a
LEFT JOIN sys_user_role AS b ON a.ID = b.user_id
LEFT JOIN sys_role AS c ON c.id = b.role_id


-- 查询分页用户带出角色列表
SELECT
	DISTINCT
	a.ID AS USER_ID,
	a.`NAME` AS USER_NAME,
	c.ID AS ROLE_ID,
	c.`NAME` AS ROLE_NAME
FROM
	(
		SELECT
			*
		FROM
			sys_user WHERE 1=1
		LIMIT 0,10
	) AS a
LEFT JOIN sys_user_role AS b ON a.ID = b.user_id
LEFT JOIN sys_role AS c ON c.id = b.role_id
ORDER BY
	a.sort_num DESC



-- 根据用户查询资源(可用于判断用户的有没有权限)
SELECT
	DISTINCT
	e.ID AS RESOURCES_ID,
	e.`NAME` AS RESOURCES_NAME
FROM
	sys_user AS a
LEFT JOIN sys_user_role AS b ON a.ID = b.user_id
LEFT JOIN sys_role AS c ON c.id = b.role_id
LEFT JOIN sys_role_resources as d ON c.id=d.role_id
LEFT JOIN sys_resources as e on d.resources_id=e.id
ORDER BY
	e.sort_num ASC


-- 登录完成以后根据用户ID查询菜单
SELECT
	g.*
FROM
	(
		SELECT DISTINCT
			e.ID AS RESOURCES_ID,
			e.`NAME` AS RESOURCES_NAME
		FROM
			sys_user AS a
		LEFT JOIN sys_user_role AS b ON a.ID = b.user_id
		LEFT JOIN sys_role AS c ON c.id = b.role_id
		LEFT JOIN sys_role_resources AS d ON c.id = d.role_id
		LEFT JOIN sys_resources AS e ON d.resources_id = e.id
		WHERE
			a.id = '1'
	) AS f
LEFT JOIN sys_menu AS g ON f.RESOURCES_ID = g.id


-- 根据角色ID查询角色并且带出资源列表。
SELECT
	a.id AS role_id,
	a. NAME AS role_name,
	c.id as resources_id,
	c.name as resources_name
FROM
	sys_role AS a
LEFT JOIN sys_role_resources AS b ON a.id = b.role_id
LEFT JOIN sys_resources AS c ON b.resources_id = c.id
where a.id='1'


-- 根据角色ID查询角色并且带出资源列表。
SELECT
	a.id AS role_id,
	a. NAME AS role_name,
	c.id as resources_id,
	c.name as resources_name
FROM
	(SELECT * from sys_role where 1=1  LIMIT 0,10) AS a
LEFT JOIN sys_role_resources AS b ON a.id = b.role_id
LEFT JOIN sys_resources AS c ON b.resources_id = c.id
ORDER BY a.sort_num desc

-- 根据ID查询资源所有的子资源
SELECT * FROM sys_resources WHERE FIND_IN_SET(id,getSysResourcesChildren('1')) ORDER BY SORT_NUM asc;
-- 根据ID查询资源所有的子资源
SELECT * FROM sys_resources WHERE FIND_IN_SET(id,getSysResourcesParentList('4')) ORDER BY SORT_NUM asc;


-- 会员用户根据mobile或者login_name或者email登录，因为考虑到用户数据量可能会很多所以用union进行关联
SELECT a.* FROM mem_member as a WHERE a.MOBILE='13926205227'
UNION 
SELECT a.* FROM mem_member as a WHERE a.LOGIN_NAME='likeqiang'
UNION 
SELECT a.* FROM mem_member as a WHERE a.EMAIL='huangjixin@qq.com'

-- 根据组织结构带出岗位和会员
SELECT
	d.name as mem_name,
	b.`NAME` as position_name,
	a.`NAME` as dept_name
FROM
	mem_dept AS a
INNER JOIN mem_position AS b ON a.ID = b.DEPT_ID
INNER JOIN mem_member_position AS c ON b.ID = c.POSITION_ID
INNER JOIN mem_member AS d ON c.MEMBER_ID = d.ID

-- 根据会员ID带出其岗位列表
SELECT
	a.id AS member_id,
	a.`NAME` AS member_name,
	c.id as position_id,
	c.name as position_name,
	d.id as dept_id,
	d.name as dept_name
FROM
	mem_member AS a
LEFT JOIN mem_member_position AS b ON a.ID = b.member_id
LEFT JOIN mem_position as c on b.position_id=c.id
LEFT JOIN mem_dept as d on c.dept_id=d.id
WHERE a.ID='1'


-- 查询会员列表带出其岗位列表以及所属组织机构
SELECT
	a.id AS member_id,
	a.`NAME` AS member_name,
	c.id AS position_id,
	c. NAME AS position_name,
	d.id AS dept_id,
	d. NAME AS dept_name
FROM
	(
		SELECT
			*
		FROM
			mem_member
		WHERE
			1 = 1
		LIMIT 0,10
	) AS a
LEFT JOIN mem_member_position AS b ON a.ID = b.member_id
LEFT JOIN mem_position AS c ON b.position_id = c.id
LEFT JOIN mem_dept AS d ON c.dept_id = d.id
ORDER BY
	a.SORT_NUM DESC

-- 查询部门带出岗位
SELECT
	a.id AS dept_id,
	a. NAME AS dept_name,
	b.id as position_id,
	b.name as position_name
FROM
	mem_dept AS a
LEFT JOIN mem_position AS b ON a.id = b.dept_id












