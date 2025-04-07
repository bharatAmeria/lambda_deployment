import sys
import pandas as pd
from src.constants import *
from src.config import CONFIG
from src.logger import logging
from src.exception import MyException
from src.components.dataProcessing import DataPreProcessing, DataPreprocessStrategy

class DataProcessingPipeline:
    def __init__(self):
        pass

    @staticmethod
    def main():
        config = CONFIG["data"]
        
        data = pd.read_csv(config["data_path"])

        logging.info(">>>>>Data Preprocessing Started...<<<<<")
        data_cleaning = DataPreProcessing(data=data,strategy=DataPreprocessStrategy())
        cleaned_data = data_cleaning.handle_data()
        logging.info(">>>>>Data Preprocessing Completed<<<<<\n")

        return cleaned_data


if __name__ == '__main__':
    try:
        logging.info(f"*******************")
        logging.info(f">>>>>> stage {PRE_PROCESSING_STAGE_NAME} started <<<<<<")
        obj = DataProcessingPipeline()
        obj.main()
        logging.info(f">>>>>> stage {PRE_PROCESSING_STAGE_NAME} completed <<<<<<\nx==========x")
    except MyException as e:
            raise MyException(e, sys)
