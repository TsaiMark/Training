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
when 'P' then a.ParkingStatus+'-處理中,車輛已登入進場'
when 'O' then a.ParkingStatus+'-車輛已登入離場,但未付款'
when 'F' then a.ParkingStatus+'-已結案且付款完畢'
when 'C' then a.ParkingStatus+'-已取消交易'
when 'X' then a.ParkingStatus+'-此筆停車交易發生錯誤'
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