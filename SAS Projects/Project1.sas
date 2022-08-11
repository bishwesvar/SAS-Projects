/* SASHELP.Heart data analysis Our analysis will be on data avaoilable in Sashelp Library*/

/*Step1 : Just see data Visually*/
 
PROC PRINT DATA=sashelp.heart(OBS=10);

RUN;

/*Step 2: As a SAS programmer you have to import/export data 
so let first export as EXCEL file then import same file */

PROC EXPORT DATA=Sashelp.heart OUTFILES="C:\Users\biprsi\Desktop\SAS Test\Heart"
	DBMS=XLSX;
RUN;


/*Now we can import data in a file name Proj1 from EXCEL file.*/
PROC IMPORT DATAFILE = "C:\Users\biprsi\Desktop\SAS Test\Heart.XLSX"
	DBMS =XLSX OUT= Proj1;
RUN;

/* Lets try another analysis   */
TITLE "Descriptive statistics on Cholesterol  ";
PROC MEANS DATA=sashelp.heart N MEAN STDERR P5 P95 CLM;
CLASS WEIGHT_STATUS SEX;
VAR CHOLESTEROL ;
RUN;

ODS GRAPHICS ON;
TITLE "Histogram and Probability plot for Cholesterol";
PROC UNIVARIATE DATA =SASHELP.Heart;
	CLASS WEIGHT_STATUS;
	VAR CHOLESTEROL;
	HISTOGRAM CHOLESTEROL;
	INSET SKEWNESS KURTOSIS;
	PROBPLOT CHOLESTEROL;
	INSET SKEWNESS KURTOSIS;
RUN;

TITLE "BOX and WIsker Plot for Colesterol";
PROC SGPLOT DATA= SASHELP.HEART;
VBOX CHOLESTEROL / CATEGORY = WEIGHT_STATUS;
RUN;


ODS GRAPHICS OFF;
