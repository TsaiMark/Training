use ParkPay_Mark
declare @email nvarchar(100)
set @email =  'PK0000000013@foyatech.com'
select *from Logins
where Logins.EMail = @email and Logins.MemberType = 'P'

select b.* from Logins
join Areas as b on Logins.PPID = b.AreaNo
where Logins.EMail = @email and Logins.MemberType = 'P'

select c.* from Logins
join ShopAreaRelations as b on Logins.PPID = b.AreaNo
join Shop as c on b.ShopId = c.ShopId
where Logins.EMail = @email and Logins.MemberType = 'P'
