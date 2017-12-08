
set @invSeqNo=(select invoiceSequenceNumber from school where id=schoolId);
insert into invoice (`invoiceNumber`,`merchantId`,`aggregatorId`,`userId`,`studentId`,`dueDate`,`feeDate`,`totalChargeAmount`,`desc`,`type`) 
select 
	CONCAT( invoiceMnemonic,"-",lpad(@invSeqNo:=@invSeqNo+1,6,'0')) as invoiceNumber
    ,merchantId
    ,aggregatorId
    ,userId
    ,studentId
    ,dueDate
    ,feeDate
    ,totalChargeAmount
    ,m.desc
    ,'ACD' as type
from
	(
		select
			 s.invoiceMnemonic
			,sm.merchantId
			,'aggregatorId' as aggregatorId
			,st.studentCode as userId
			,st.id as studentId
			,DATE_ADD(fpd.dueDate, interval s.graceDays day) as dueDate
			,fpd.dueDate as feeDate
			,sum(fpd.feeCharges) as totalChargeAmount
			,case Max(fr.frequencyValue)
				when 1 then 
							CONCAT('Academic Fee: ',DATE_FORMAT(DATE_ADD(fpd.dueDate, interval s.graceDays day),'%b')," ",year(DATE_ADD(fpd.dueDate, interval s.graceDays day))," ",'to'," ",
							DATE_FORMAT(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 11 month),'%b')," ",year(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 11 month)))
						   
				when 2 then 
							CONCAT('Academic Fee: ',DATE_FORMAT(DATE_ADD(fpd.dueDate, interval s.graceDays day),'%b')," ",year(DATE_ADD(fpd.dueDate, interval s.graceDays day))," ",'to'," ",
							DATE_FORMAT(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 5 month),'%b')," ",year(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 5 month)))
						   
				when 4 then 
							CONCAT('Academic Fee: ',DATE_FORMAT(DATE_ADD(fpd.dueDate, interval s.graceDays day),'%b')," ",year(DATE_ADD(fpd.dueDate, interval s.graceDays day))," ",'to'," ",
							DATE_FORMAT(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 2 month),'%b')," ",year(date_add(DATE_ADD(fpd.dueDate, interval s.graceDays day),interval 2 month)))
						   
				when 12 then 
							CONCAT('Academic Fee: ',DATE_FORMAT(DATE_ADD(fpd.dueDate, interval s.graceDays day),'%b')," ",year(DATE_ADD(fpd.dueDate, interval s.graceDays day)))
				end as 'desc'
				
		from 
			School as s 
			inner join academicyear ay on s.id=ay.schoolId and ay.isCurrent=true
			inner join schoolmerchant sm on s.id=sm.schoolId and sm.isDefault=true
			inner join feeplan fp on ay.schoolId=fp.schoolId and fp.academicYear=ay.academicYear
			inner join feeplanheaddetails fpd on fp.id=fpd.feePlanId
			inner join feehead fh on fpd.feeHeadId=fh.id
			inner join frequency fr on fh.frequencyId=fr.id
			inner join feeplanassociation fpa on fp.id=fpa.feeplanId
			inner join class c on fpa.classId=c.id
			inner join category ct on fpa.categoryId=ct.id
			inner join student st on c.id=st.classId and 
									 ct.id=st.categoryId and 
									 st.isActive=true and 
									 st.academicYear=ay.academicYear and
									 st.isAcademicFeeProcessed=false
		where 
			s.id=schoolId
		group by
			fpd.dueDate
		order by
			studentCode,dueDate
	)as m;



-- Insert invoices into invoiceDetails Table
insert  into invoicedetails (`invoiceId`,`feePlanId`,`invoiceNumber`,`feeHeadName`,`chargeHeadName`,`chargeAmount`)
 select  
	i.id as invoiceId
    ,fp.id as feePlanId
    ,i.invoiceNumber
    ,fh.feeHeadName
    ,fh.chargeHeadName
    ,fpd.feeCharges as chargeAmount
from 
	School as s 
	inner join academicyear ay on s.id=ay.schoolId and ay.isCurrent=true
	inner join schoolmerchant sm on s.id=sm.schoolId and sm.isDefault=true
	inner join feeplan fp on ay.schoolId=fp.schoolId and fp.academicYear=ay.academicYear
	inner join feeplanheaddetails fpd on fp.id=fpd.feePlanId
	inner join feehead fh on fpd.feeHeadId=fh.id
	inner join feeplanassociation fpa on fp.id=fpa.feeplanId
	inner join class c on fpa.classId=c.id
	inner join category ct on fpa.categoryId=ct.id
	inner join student st on c.id=st.classId and 
							 ct.id=st.categoryId and 
							 st.isActive=true and 
							 st.academicYear=ay.academicYear and
							 st.isAcademicFeeProcessed=false
	inner join invoice i on fpd.dueDate=i.feeDate
where 
	s.id=schoolId;
-- Update invoiceNumber to School 
update school set invoiceSequenceNumber=@invSeqNo where id=schoolId;
-- Update AcadamicFeeProcessed flag to true
update student set isAcademicFeeProcessed=true where id in (select distinct studentId from invoice where date(createdOn)=date(curdate()));
-- Update TransactionProcessed to ture
update feeplan set isTransactionProcessed=true where id in (select distinct feeplanId from invoicedetails where date(createdOn)=date(curdate()));
 