
create or alter procedure bronze.load_bronze as
begin

declare @start_time datetime,@end_time datetime
    begin try

        
    print'========================================='
    print'load bronze layer'
    print'========================================='


    print'========================================='
    print'load from crm source'
    print'========================================='
   set @start_time=getdate()
        truncate table bronze.crm_cust_info;
        bulk insert bronze.crm_cust_info
        from'D:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock

        );
 
        truncate table bronze.crm_prd_info;
        bulk insert bronze.crm_prd_info
        from'D:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock
        );

        truncate table bronze.crm_sales_details;
        bulk insert bronze.crm_sales_details
        from'D:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock
        );
       set @end_time=getdate()
       print 'loadind  duration from crm '+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds'

    print'========================================='
    print'load from erp source'
    print'========================================='

    set @start_time=getdate()
        truncate table bronze.erp_cust_az12;
        bulk insert bronze.erp_cust_az12
        from'D:\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock
        );

        truncate table bronze.erp_loc_a101;
        bulk insert bronze.erp_loc_a101
        from'D:\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock
        );

        truncate table bronze.erp_px_cat_g1v2;
        bulk insert bronze.erp_px_cat_g1v2
        from'D:\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        with(
        firstrow=2,
        fieldterminator=',',
        tablock
        );
         set @end_time=getdate()
         print 'loadind  duration from erp '+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
    end try
    begin catch
        print'========================================='
        print 'error accured during load bronze layer'
        print'error massege : '+error_message()
        print'error line : '+cast(error_line()as nvarchar)
        print'========================================='
    end catch
end



