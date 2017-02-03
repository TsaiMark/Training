use ParkPay_Mark
declare @email nvarchar(100)
set @email =  'B01@yahoo.com.tw'
select *from Logins
where Logins.EMail = @email and Logins.MemberType = 'B'

select b.*from Logins
join Shop as b on Logins.PPID = b.ShopId
where Logins.EMail = @email and Logins.MemberType = 'B'

select DISTINCT d.*from Logins
join ShopAscriptions as b on Logins.PPID = b.PPID
join ShopAreaRelations as c on b.ShopId = c.ShopId
join Areas as d on c.AreaNo =  d.AreaNo
where Logins.EMail = @email and Logins.MemberType = 'B'

