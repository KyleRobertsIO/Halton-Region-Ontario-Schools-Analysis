import pyodbc
from ontario_schools.common.database import SQLServerConnectors
from typing import List

def upload_to_staging(
    connector: SQLServerConnectors.BaseConnector, 
    data: List[dict]
):
    conn_str = connector.get_connection_string_pyodbc()
    conn = pyodbc.connect(conn_str, autocommit = True)
    cursor = conn.cursor()
    sql = """
    INSERT INTO [staging].[ontario_school_demographics]
    (
        School_Year,
        Board_Number,
        Board_Name,
        Board_Type,
        Board_Website,
        School_Number,
        School_Name,
        School_Type,
        Special_Condition_Code,
        School_Level,
        School_Langauge,
        Grade_Range,
        Phone_Number,
        Fax_Number,
        School_Website,
        Building_Suite,
        PO_Box,
        Street_Address,
        Municipality,
        City,
        Province,
        Postal_Code,
        Latitude,
        Longitude,
        G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
        G3_Percentage_Of_Reading_Achievement_Over_3_Years,
        G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
        G3_Change_In_Writing_Achievement_Over_3_Years,
        G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
        G3_Change_In_Math_Achievement_Over_3_Years,
        G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
        G6_Percentage_Of_Reading_Achievement_Over_3_Years,
        G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
        G6_Change_In_Writing_Achievement_Over_3_Years,
        G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
        G6_Change_In_Math_Achievement_Over_3_Years,
        G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math,
        G9_Change_In_Math_Achievement_Over_3_Years,
        G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math,
        G9_Change_In_Applied_Math_Achievement_Over_3_Years,
        G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt,
        G10_Change_In_OSSLT_Literacy_Achievement_Over_3_Years,
        Student_Enrolment,
        Percentage_Of_Students_Whose_First_Lang_Is_Not_English,
        Percentage_Of_Students_Whose_First_Lang_Is_Not_French,
        Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country,
        Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country,
        Percentage_Of_Students_Receiving_Special_Education_Services,
        Percentage_Of_Students_Identifed_As_Gifted,
        Percentage_Of_Children_Who_Live_In_Low_Income_Households,
        Percentage_Of_Students_Whose_Parents_Have_Some_University_Education
    )
    VALUES (<field-count>)
    """
    params = [(
        i.get("school_year"),
        i.get("Board Number"),
        i.get("Board Name"),
        i.get("Board Type"),
        i.get("Board Website"),
        i.get("School Number"),
        i.get("School Name"),
        i.get("School Type"),
        i.get("School Special Condition Code"),
        i.get("School Level"),
        i.get("School Language"),
        i.get("Grade Range"),
        i.get("Phone Number"),
        i.get("Fax Number"),
        i.get("School Website"),
        i.get("Building Suite"),
        i.get("P.O. Box"),
        i.get("Street"),
        i.get("Municipality"),
        i.get("City"),
        i.get("Province"),
        i.get("Postal Code"),
        i.get("Latitude"),
        i.get("Longitude"),
        i.get("Percentage of Grade 3 Students Achieving the Provincial Standard in Reading"),
        i.get("Change in Grade 3 Reading Achievement Over Three Years"),
        i.get("Percentage of Grade 3 Students Achieving the Provincial Standard in Writing"),
        i.get("Change in Grade 3 Writing Achievement Over Three Years"),
        i.get("Percentage of Grade 3 Students Achieving the Provincial Standard in Mathematics"),
        i.get("Change in Grade 3 Mathematics Achievement Over Three Years"),
        i.get("Percentage of Grade 6 Students Achieving the Provincial Standard in Reading"),
        i.get("Change in Grade 6 Reading Achievement Over Three Years"),
        i.get("Percentage of Grade 6 Students Achieving the Provincial Standard in Writing"),
        i.get("Change in Grade 6 Writing Achievement Over Three Years"),
        i.get("Percentage of Grade 6 Students Achieving the Provincial Standard in Mathematics"),
        i.get("Change in Grade 6 Mathematics Achievement Over Three Years"),
        i.get("Percentage of Grade 9 Students Achieving the Provincial Standard in Academic Mathematics"),
        i.get("Change in Grade 9 Academic Mathematics Achievement Over Three Years"),
        i.get("Percentage of Grade 9 Students Achieving the Provincial Standard in Applied Mathematics"),
        i.get("Change in Grade 9 Applied Mathematics Achievement Over Three Years"),
        i.get("Percentage of Students That Passed the Grade 10 OSSLT on Their First Attempt"),
        i.get("Change in Grade 10 OSSLT Literacy Achievement Over Three Years"),
        i.get("Enrolment"),
        i.get("Percentage of Students Whose First Language Is Not English"),
        i.get("Percentage of Students Whose First Language Is Not French"),
        i.get("Percentage of Students Who Are New to Canada from a Non-English Speaking Country"),
        i.get("Percentage of Students Who Are New to Canada from a Non-French Speaking Country"),
        i.get("Percentage of Students Receiving Special Education Services"),
        i.get("Percentage of Students Identified as Gifted"),
        i.get("Percentage of Children Who Live in Low-Income Households"),
        i.get("Percentage of Students Whose Parents Have Some University Education")
    ) for i in data]
    param_marks = ["?" for param in params[0]]
    sql = sql.replace("<field-count>", ', '.join(param_marks))
    cursor.fast_executemany = False
    cursor.executemany(sql, params)
    cursor.close()
    conn.close()