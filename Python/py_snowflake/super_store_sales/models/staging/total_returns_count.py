from snowflake.snowpark.functions import count, col

def model(dbt, session):

    returns_df = dbt.ref("base_returns")

    final_df = returns_df.select(count(col("order_id")).alias("total_returns"))
    #final_df = returns_df.group_by("order_id").count()

    return final_df