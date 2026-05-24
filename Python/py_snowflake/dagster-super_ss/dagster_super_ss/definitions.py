from dagster import Definitions, load_assets_from_modules

from dagster_super_ss.defs import assets  # noqa: TID252
from dagster_super_ss.defs.resources import dbt_resource

all_assets = load_assets_from_modules([assets])

defs = Definitions(
    assets=all_assets,
    resources={
        "dbt": dbt_resource,
    },
)
