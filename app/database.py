from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os

load_dotenv('.postgres.env') # my .env file is in parent folder
username = os.environ.get('NUSER')
password = os.environ.get('PASSWORD')

print(f'{username}')
print(f'{password}')

SQLALCHEMY_DATABASE_URL = f"postgresql://{username}:{password}@localhost/pcdb"
#SQLALCHEMY_DATABASE_URL = "sqlite:///./sql_app.db"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()