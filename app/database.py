from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os

load_dotenv('..') # my .env file is in parent folder
user_name = os.environ.get('USER')
password = os.environ.get('PASSWORD')

SQLALCHEMY_DATABASE_URL = f"postgresql://{user_name}:{password}@postgresserver/pcdb"
#SQLALCHEMY_DATABASE_URL = "sqlite:///./sql_app.db"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()