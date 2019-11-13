import pymysql

# so we updated pymysql here, now I will try and create a database and and then we will add more data to it



# host= input ("please enter host name ")
# name = input("Please enter user name ")
# password = input("Please enter user password ")
# database = input("Please enter user database name ")



connection = pymysql.connect("localhost" , "root" , "test" , "project")

cursor = connection.cursor()

while 1:

  print("\n\n")
  print("enter according to query")
  print("1. new employee")
  print("2. fire employee")
  print("3. Flight Cancel")
  print("4. Show Records")
  print("5 : Exit loop")
  print("6. check whether a vehicle is available")
  print("7. check the kind of food that is available")
  print("8. Cargo weight for the flight")

  print("\n\n")

  number = input("Please enter the number according to what operation do you need : ")
#  print(number)

  if number == "1" :
    print("So you wanna hire an employee. Please enter the following details:")

    fname = input("fname (str): ")
    mname = input("mname(Str) : ")
    lname = input("lname (Str): ")
    job_type = int (input("job_type (int) : "))
    dob = input("dob (Date): ")
    address = input("address (String): ")
    employee_id = input("employee_id (string) : ")
    employee_type = int (input("employee_type (int) : ") )
    gender = input("gender : ")

    query1 = "insert into employee values ('%s', '%s' , '%s' , '%d' , '%s' , '%s' , '%s' , '%d' , '%s'); " %(fname, mname , lname , job_type , dob , address , employee_id , employee_type , gender)


    airport_code = int( input(" Please enter airport code where this guy works : ") )

    query2 = "insert into airport_employee values('%d' , '%d')"%(airport_code , employee_type)


    try:
        cursor.execute(query1)
        cursor.execute(query2)
        connection.commit()
    
        a = int( input( "how many phone numbers do you want ? ") )
        print("please enter one phone number at a time ")
        for i in range( 0 , a ):
            number = int( input( "Please enter the phone number : ") )

            query3 = "insert into employee_phone_numbers values ( '%d' , '%d' )" % (employee_type , number)
            cursor.execute(query3)
            connection.commit()
    except Exception as e:
        connection.rollback()
        print("exception occurred : " , e)

    

  # we write the code to generate the query 
  elif number == "2":
    print("Oh, so you wanna fire an employee, that's sad. Well anyway, give the relevan details and we'll do it right away")

    employee_id = input( " Please enter the employee_id of the guy you wanna fire : ") 
    query1 = "delete from employee where employee_id = '%s' "  %(employee_id)
    query2 = "delete from airport_employee where employee_id = '%s' "  %(employee_id)
    query3 = "delete from employee_phone_numbers where employee_id = '%s' "  %(employee_id)

    try:
        cursor.execute(query1)
        cursor.execute(query2)
        cursor.execute(query3)
        connection.commit()
    except Exception as e:
        connection.rollback()
        print("Exception occrred: " , e)
  # we write the code to generate the query 
  elif number == "3":
  # we write the code to generate the query
    print("ah , flight cancelled. well that's gotta be hard. anyway, give the details and we'll do it right away")
    flight_code = int( input( "Please enter flight code : "))
    query1 = "update flights set status = 'cancelled' where flight_code = '%d' " %(flight_code)

    try:
        cursor.execute(query1)
        connection.commit()
    except Exception as e:
        connection.rollback()
        print("Exception occurred: " , e)

  elif number == "4" :
  # we write the code to generate the query 
    print("The details are as follows:")
  
    try:
      query1 = "show tables"
      cursor.execute( query1 )
      results = cursor.fetchall()
    #   print(results)

      for table in results:
        string = str(table)[2:-3]
        print("\n"+ string)
        query2 = "select * from " + string
        cursor.execute(query2)
        rows = cursor.fetchall()
        for row in rows:
            print(row)

    except Exception as e :
      print("Exception occurred : " , e)


  elif number == "5":
    print("See ya! next time")
    break
  elif number == "6":
    # we will need the 
    veh_id = int(input("Please enter the vehicle number: "))
    query1 = "select availability from vehicles where vehicle_number = '%d' " %(veh_id)
    try:
      cursor.execute(query1)
      result = cursor.fetchone()
      ans = int (str(result)[1:-2] )
      if ans == 1 :
        print("oh , it's available, following is it's detail")
        query2 = "select * from vehicles where vehicle_number = '%d' " %(veh_id)
        cursor.execute(query2)
        result = str(cursor.fetchone())
        print(result)
      else:
        print("Well it seems your vehicle is not available atm -\/0_0\/- ")
      connection.commit()
    except Exception as e:
      connection.rollback()
      print("Exception occurred: ",e)
  elif number == "7":
    flight_number = int( input("Please enter flight number : "))
    query1 = "select food_type_name, price from food where food_type = ( select food_type from flight_food where flight_code = '%d'  )" %(flight_number)

    try:
      cursor.execute(query1) 
      result = cursor.fetchone()
      food_type_name = str(result[0])
      price = str (result[1])

      print("For the flight number " + str(flight_number) + " food_type_name is " + str(food_type_name) + " and price is " + str(price))

    except Exception as e:
      connection.rollback()
      print("Exception occurred ", e)

  elif number == "8":
    flight_number = int( input("Please enter flight number : "))
    query1 = "select cargo_weight from flight_cargo where flight_code = '%d'  " %(flight_number)

    try:
      cursor.execute(query1) 
      result = cursor.fetchone()
      ans = str( result[0] )

      print("For the flight number " + str(flight_number) + " cargo_weight is " + str(ans) + " kg" )

    except Exception as e:
      connection.rollback()
      print("Exception occurred ", e)

  else:
      print("Please enter a valid number and read the instructions carefully!")

# here I believe that we have executed all queries

connection.close()