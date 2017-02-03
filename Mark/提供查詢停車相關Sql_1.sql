use ParkPay_Mark
declare @parkingstatus nvarchar(10)
select c.MemberNo,
c.MobilePhone,
a.VehicleIdNo,
a.CarKind,
a.CarAttr,
d.PaymentSn,
a.ParkingNo,
a.IsDeleted,
a.DataSource,
a.AreaNo
,b.AreaName,
a.InTime,
a.OutTime,
case a.ParkingStatus 
when 'P' then a.ParkingStatus+'-�B�z��,�����w�n�J�i��'
when 'O' then a.ParkingStatus+'-�����w�n�J����,�����I��'
when 'F' then a.ParkingStatus+'-�w���ץB�I�ڧ���'
when 'C' then a.ParkingStatus+'-�w�������'
when 'X' then a.ParkingStatus+'-������������o�Ϳ��~'
else a.ParkingStatus
end as 'ParkingStatus'
,a.PayStatus,
a.PaymentType,
a.TaxIdForInvoice,
a.CreatedTime,
a.Price,
a.ParkingAmt,
a.UseDiscountedMin,
a.UseDiscountedPrices
from ParkingTransactions as a
join Areas as b on a.AreaNo = b.AreaNo
join Members as c on a.MemberNo = c.MemberNo
join MemberPayments as d on a.MemberNo = d.MemberNo
where a.OutTime - a.InTime >1
and a.DataSource = 'Parking'    
and a.IsDeleted = '0'