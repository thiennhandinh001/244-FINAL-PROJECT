#!/bin/bash

#Project name: Advanced Payroll & Overtime Management System

mkdir -p Employee_Payroll
cd Employee_Payroll

echo -e "=================================================================================================================================================================="
echo -e "                                                      WELCOME TO OUR COMPANY - EMPLOYEE POLICY                                                                    "
echo -e "=================================================================================================================================================================="
echo -e "NOTICE:
>> MINIMUM WAGE: $15.00 per hour.
>> STANDARD WORK WEEK: Monday to Friday.
>> DAILY SHIFTS (8 hours per shift):
- MORNING SHIFT: 06:00AM - 14:00PM
- AFTERNOON SHIFT: 14:00PM - 22:00PM
- NIGHT SHIFT: 22:00PM - 06:00AM (Includes a 10% salary bonus)
>> SHIFT POLICY: Employees are restricted to ONE shift per day.
>> TIME SHEET: It will be reset every week.
>> TAX DEDUCTION RATES (Based on weekly working hours):
- Under 36 hours:   5% Tax  
- 36 to 48 hours:  10% Tax
- Over 48 hours:   15% Tax"
echo -e "\n****************************************************************************************************************************************************************" 
while true 
do
echo -e "Choose the option you want to do
Add New Employee (1)
Employee Timesheet (2)
Employee Payroll (3)
View Employees (4)
Quit (5)
Select your option --> \c"
read CHOICE

case $CHOICE in
1) 	
echo -e "\n############################################################# EMPLOYEE INFORMATION #############################################################################"

echo -e "\nPlease enter the employee last name --> \c"
read LNAME

echo -e "\nPlease enter the employee first name --> \c"
read FNAME

mkdir ${LNAME}_${FNAME}
cd ${LNAME}_${FNAME}
touch ${LNAME}_${FNAME}_INFORMATION.txt

echo -e "\nPlease enter the employee's date of birth (MM/DD/YY) --> \c"
read BIRTHDAY

echo -e "\nPlease enter the emplyee's gender (Male/Female) --> \c"
read GENDER

echo -e "\nPlease enter the employee's start date (MM/DD/YY) --> \c"
read DATE

echo -e "\nPlease enter the employee's daily shift --> \c"
read SHIFT
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! EMPLOYEE INFORMATION. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" >> ${LNAME}_${FNAME}_INFORMATION.txt 
echo "Employee Name: ${LNAME} ${FNAME}" >> ${LNAME}_${FNAME}_INFORMATION.txt
echo "Date of Birth: $BIRTHDAY" >> ${LNAME}_${FNAME}_INFORMATION.txt
echo "Gender: $GENDER" >> ${LNAME}_${FNAME}_INFORMATION.txt
echo "Start working on: $DATE" >> ${LNAME}_${FNAME}_INFORMATION.txt
echo "Daily shift: $SHIFT" >> ${LNAME}_${FNAME}_INFORMATION.txt

echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! EMPLOYEE INFORMATION HAS BEEN SUCCESSFULLY UPDATED. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo -e "\nTHIS IS THE INFORMATION ABOUT THE NEW EMPLOYEE."
cat ${LNAME}_${FNAME}_INFORMATION.txt
cd ..
echo -e "\n****************************************************************************************************************************************************************"
;;
2)
echo -e "\nPlease enter the employee last name --> \c"
read LNAME

echo -e "\nPlease enter the employee first name --> \c"
read FNAME

if [[ -d ${LNAME}_${FNAME} ]]
then
echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SEARCH COMPLETE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
cd ${LNAME}_${FNAME}
touch ${LNAME}_${FNAME}_TIMESHEET.txt
echo -e "\nPlease enter the assigned shift --> \c"
read SHIFT
echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ENTER WORK HOURS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! EMPLOYEE TIMESHEET. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" > ${LNAME}_${FNAME}_TIMESHEET.txt
echo "Employee name: ${LNAME} ${FNAME}" >> ${LNAME}_${FNAME}_TIMESHEET.txt
echo "Daily shift : $SHIFT" >> ${LNAME}_${FNAME}_TIMESHEET.txt

for DAY in Monday Tuesday Wednesday Thursday Friday
do

echo -e "\n$DAY"
echo -e "Time in --> \c"
read IN
echo -e "Time out --> \c"
read OUT


if (( $(echo "$OUT < $IN" | bc) ))
then 
TOTAL_HOURS=$(echo "(24 - $IN) + $OUT" | bc )
else
TOTAL_HOURS=$(echo "$OUT - $IN" | bc )
fi
echo "$DAY hours: $TOTAL_HOURS"
echo "$DAY hours: $TOTAL_HOURS" >> ${LNAME}_${FNAME}_TIMESHEET.txt
done 

echo -e "\nALL DATA HAS BEEN RECORDED. HERE IS THE EMPLOYEE'S TIMESHEET."
cat ${LNAME}_${FNAME}_TIMESHEET.txt
cd ..
else
echo -e "\nNOTICE: NAME MISSPELLED OR EMPLOYEE DATA NOT FOUND. PLEASE CHECK AND TRY AGAIN."
fi

echo -e "\n****************************************************************************************************************************************************************"
;;

3)
echo -e "\n****************************************************************************************************************************************************************"
;;

4) 
echo -e "\nPlease enter the last name of the employee you would like to view --> \c"
read LNAME

echo -e "\nPlease enter the first name of the employee you would like to view --> \c"
read FNAME

if [[ -d ${LNAME}_${FNAME} ]]
then
echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SEARCH COMPLETE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo -e "\nDISPLAYING RETRIEVED INFORMATION FOR THE SELECTED EMPLOYEE."
cd ${LNAME}_${FNAME}
cat ${LNAME}_${FNAME}_INFORMATION.txt
cat ${LNAME}_${FNAME}_TIMESHEET.txt
cd ..
else 
echo -e "\nNOTICE: NAME MISSPELLED OR EMPLOYEE DATA NOT FOUND. PLEASE CHECK AND TRY AGAIN."
fi

echo -e "\n****************************************************************************************************************************************************************"
;;

5)	 exit
;;

esac
done