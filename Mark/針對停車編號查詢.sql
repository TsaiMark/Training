use ParkPay_Mark
declare @parkingno nvarchar(20)
set @parkingno =  '15120952221967230018'
select b.*from ParkingTransactions
inner join Members as b on ParkingTransactions.MemberNo = b.MemberNo
where ParkingTransactions.ParkingNo = @parkingno

select b.*from ParkingTransactions
inner join Cars as b on ParkingTransactions.MemberNo = b.MemberNo
where ParkingTransactions.ParkingNo = @parkingno

select b.*from ParkingTransactions
inner join MemberPayments as b on ParkingTransactions.MemberNo = b.MemberNo
where ParkingTransactions.ParkingNo = @parkingno

select b.*from ParkingTransactions
inner join CarStatusHistory as b on ParkingTransactions.MemberNo = b.MemberNo
where ParkingTransactions.ParkingNo = @parkingno

select *from ParkingTransactions
where ParkingTransactions.ParkingNo = @parkingno

select b.*from ParkingTransactions
inner join Invoices b on ParkingTransactions.Id = b.Id
where ParkingTransactions.ParkingNo = @parkingno

select *from ParkingDiscount
where ParkingDiscount.ParkingNo = @parkingno

select *from SpendDiscount
where SpendDiscount.ParkingNo = @parkingno

select b.*from ParkingTransactions
inner join MemberBonusHistory b on ParkingTransactions.MemberNo = b.MemberNo
where ParkingTransactions.ParkingNo = @parkingno

