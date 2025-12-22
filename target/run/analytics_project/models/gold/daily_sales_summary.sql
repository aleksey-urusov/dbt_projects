
        alter dynamic table "ANALYTICS_DB"."GOLD"."DAILY_SALES_SUMMARY" set
            target_lag = '5 minutes'
            
    