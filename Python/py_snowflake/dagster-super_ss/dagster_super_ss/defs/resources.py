import dagster as dg
from pathlib import Path

from dagster_dbt import DbtCliResource, DbtProject

# Point to the dbt project at ../super_store_sales
dbt_project_directory = Path(__file__).resolve().parents[3] / "super_store_sales"
profiles_dir = Path.home() / ".dbt"

dbt_project = DbtProject(
    project_dir=dbt_project_directory,
    profiles_dir=profiles_dir,
)
dbt_resource = DbtCliResource(project_dir=dbt_project)