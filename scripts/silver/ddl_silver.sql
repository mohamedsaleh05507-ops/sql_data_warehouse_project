-- ddl for silver layer

DROP TABLE IF EXISTS silver.crm_cust_info;

        -- 1. CRM Customer Info
        CREATE TABLE silver.crm_cust_info (
            cst_id INT,
            cst_key VARCHAR(20),
            cst_firstname VARCHAR(50),
            cst_lastname VARCHAR(50),
            cst_marital_status VARCHAR(10),
            cst_gndr VARCHAR(10),
            cst_create_date DATE,
            dwh_create_time datetime2 default getdate()
        );

        -- 2. CRM Product Info
        DROP TABLE IF EXISTS silver.crm_prd_info;
        CREATE TABLE silver.crm_prd_info (
            prd_id INT,
            cat_id varchar(50),
            prd_key VARCHAR(50),
            prd_nm VARCHAR(100),
            prd_cost FLOAT,
            prd_line VARCHAR(50),
            prd_start_dt DATE,
            prd_end_dt DATE,
            dwh_create_time datetime2 default getdate()
        );

        -- 3. CRM Sales Details
        DROP TABLE IF EXISTS silver.crm_sales_details;
        CREATE TABLE silver.crm_sales_details (
            sls_ord_num VARCHAR(20),
            sls_prd_key VARCHAR(20),
            sls_cust_id INT,
            sls_order_dt date,
            sls_ship_dt date,
            sls_due_dt date,
            sls_sales FLOAT,
            sls_quantity INT,
            sls_price FLOAT,
            dwh_create_time datetime2 default getdate()

        );

        -- 4. ERP Customer AZ12
        DROP TABLE IF EXISTS silver.erp_cust_az12;
        CREATE TABLE silver.erp_cust_az12 (
            cid VARCHAR(20),
            bdate DATE,
            gen VARCHAR(10),
            dwh_create_time datetime2 default getdate()

        );

        -- 5. ERP Location A101
        DROP TABLE IF EXISTS silver.erp_loc_a101;
        CREATE TABLE silver.erp_loc_a101 (
            cid VARCHAR(20),
            cntry VARCHAR(50),
            dwh_create_time datetime2 default getdate()

        );

        -- 6. ERP Product Category G1V2
        DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
        CREATE TABLE silver.erp_px_cat_g1v2 (
            id VARCHAR(10),
            cat VARCHAR(50),
            subcat VARCHAR(50),
            maintenance VARCHAR(10),
            dwh_create_time datetime2 default getdate()

        );
