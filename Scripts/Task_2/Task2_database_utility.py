from sqlalchemy import create_engine

def get_database_engine():
    engine = create_engine("sqlite:///F:\\New folder\\SQL\\SQL_Telco_Churn.db")
    return engine