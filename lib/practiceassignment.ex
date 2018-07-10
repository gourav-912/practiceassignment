defmodule Practiceassignment do 

  defp checkIfLeapYear(year) do
    if ( (rem(year, 4) == 0 && rem(year, 100) != 0) || rem(year, 400) == 0 ) do
      true
    else 
      false
    end
  end


  defp getListOfFabonacciNumbers(currentElement, nextElement, length, faboncciSeries) do
    temp = nextElement
    nextElement = currentElement + nextElement
    currentElement = temp
    faboncciSeries = faboncciSeries <> "," <> Integer.to_string(nextElement)

    if length > 0 do
      getListOfFabonacciNumbers(currentElement, nextElement, length - 1, faboncciSeries)
    else
      faboncciSeries
    end

  end

  defp swapElemets(counter, list) do
    currentElement = Enum.at(list, counter)
    nextElement = Enum.at(list, counter + 1)
    list = List.replace_at(list, counter, nextElement)
    list = List.replace_at(list, counter + 1, currentElement)
    length = Enum.count(list) - 2 
    if counter == length do
      list
    else
      swapElemets(counter + 1, list)
    end
  end

  defp rotateElements(counter, rotateTimes, list) do  
      if counter == rotateTimes do
        list
      else        
        list = swapElemets(0, list)
        rotateElements(counter + 1, rotateTimes, list)
      end
  end

  defp convertToDecimal(number, result) do
      divisor = div(number, 2)
      reminder = rem(number, 2)
      result = Integer.to_string(reminder) <> result
      IO.puts Integer.to_string(divisor)
      if divisor == 0 do
        result
      else
        convertToDecimal(divisor, result)
      end

  end

  

  def findElementInAList(list, elemnt) do
    if is_list(list) do
      result = Enum.find(list, fn(x) -> x == elemnt end)
      case result do
        nil ->
          "Item not found"
        true ->
          result
      end   
    else 
      "Plase provide valid list"
    end
    
  end


  def getNextNumberOfLeapYears(number, counter \\ 0, leapYearsList \\ []) do    
    currentYear = Date.utc_today()
    newYear =  (currentYear.year) + counter    
    if is_number(number) do
        isLeapYear = checkIfLeapYear(newYear)      

        leapYearsList = 
          if isLeapYear do
            [newYear] ++ leapYearsList 
          else 
            if is_nil(leapYearsList) do
              []
            else
              leapYearsList
            end         
          end

          number = 
            if isLeapYear do
              number - 1  
            else
              number              
            end
         
          counter = counter + 1

          if number == 0 do
            if !is_nil(leapYearsList) do
              Enum.reverse(leapYearsList)
            else
              []
            end            
          else  
            getNextNumberOfLeapYears(number, counter, leapYearsList)
          end 
          
    else
      leapYearsList
    end
  end


  def sumAndProductOfAGivenNumber(number) do
    if is_number(number) do
        myList = 
          number
          |> Integer.to_string
          |> String.graphemes

        integerList = 
          Enum.map(myList, fn(x) -> String.to_integer(x) end)
        
        IO.puts "Sum of Number = " <> Integer.to_string(Enum.sum(integerList)) <> "\n"
            "Product of Number = " <> Integer.to_string(Enum.reduce(integerList, fn(x, acc) -> x * acc end))
    else 
      "Not a valid number"
    end
    
  end



  def getLargestNumberFromAList(list) do
    if is_nil(list) || Enum.count(list) == 0 do
      "List is empty"
    else 
      if is_list(list) do
        Enum.max(list)
      else
        "Not a valid list"
      end
    end

  end


  def acceptNumberAndReturnList(number) do
    if is_number(number) do
      myList = 
        number
        |> Integer.to_string
        |> String.graphemes
      
      Enum.map(myList, fn(x) -> String.to_integer(x) end)
    else 
      "Not a valid number"
    end

  end


  def sumOfRunningList(list) do
    cond do
      is_nil(list) ->
        "List is empty"
      
      !is_list(list) ->
        "Not a valid list"
      
      Enum.count(list) == 0 ->
        IO.puts "Sum of list = 0"

      is_list(list) ->
        IO.puts "Sum of list = " <> Integer.to_string(Enum.sum(list))

    end  
  end


  def sortCommaSepratedString(string) do
    listOfString =
      string
      |> String.split(",")

    Enum.map(listOfString, fn(x) -> String.to_integer(x) end)
    |> Enum.sort   

  end


  def flapMapListExceptNils(list) do
    cond do
      is_nil(list) ->
        "List is empty"
      
      !is_list(list) ->
        "Not a valid list"
      
      Enum.count(list) == 0 ->
        []

      is_list(list) ->
        Enum.filter([[1],[],nil,[2,3,4],[5],[6]] , fn(x) -> !is_nil(x) end) 
        |> Enum.flat_map(fn(x) -> x end)

    end      
  end


  def mapAlternatinglyTakingElements(list1, list2) do  
    Enum.zip(list1, list2)
    |> Enum.into("", fn {k, v} -> k <> v end)    
  end


  def mergeTwoSortedList(list1, list2) do  
    list1 ++ list2
    |> Enum.sort
  end 
  

  def rotateElmentUpKThTimesInAList(list, kTimes) do  
    cond do
      is_nil(list) ->
        nil

      !is_list(list) ->
        "Not a valid List"
      
      is_list(list) && Enum.count(list) == 0 ->
        "Lits is empty"
      
      is_list(list) && kTimes > 0 ->
        rotateElements(0, kTimes, list)

    end
  end

  
  def printFibonacciNumberUpToNoOfTimes(seriesUpTo) do  
    if seriesUpTo > 0 do
      getListOfFabonacciNumbers(0, 1 , seriesUpTo, "0,1")      
    else
      [] 
    end
  end


  def printListOfStringToRectangle(list) do  
    cond do
      is_nil(list) ->
        nil

      !is_list(list) ->
        "Not a valid List"
      
      !Enum.count(list) == 0 ->
        ""
      
      is_list(list) ->
        maxLength = Enum.flat_map(["Hello", "World", "in", "a", "frame"], 
            fn(x) -> [String.length(x)] end) 
          |> Enum.max

        Enum.each(list, fn(x) -> 
              if String.length(x) == maxLength do
                IO.puts "*" <> x <> "*"
              else
                IO.puts "*" <> x <> String.duplicate(" ", (maxLength - String.length(x))) <> "*"
              end
            end
            )
        

    end
  end

  def convertANumberToADecimalBase(number) do  
    cond do
      is_nil(number) ->
        nil

      !is_number(number) ->
        "Not a valid Number"      
      
      is_number(number) ->
        # convertToDecimal(number, "")
        Integer.digits(number, 2)
    end
  end


  def checkIfArmstrongNumber(number) do  
    cond do
      is_nil(number) ->
        nil

      !is_number(number) ->
        "Not a valid Number"      
      
      is_number(number) ->
        length = 
          Integer.to_string(number) 
          |> String.length
        
        totalPowerOfDigits =
           number
           |> Integer.to_string
           |> String.graphemes
           |> Enum.map(fn(x) -> String.to_integer(x) end)
           |> Enum.reduce(fn(x, acc) -> Kernel.trunc(:math.pow(x, length)) + acc end)

        if totalPowerOfDigits == number do
          Integer.to_string(number) <> " is a armstrong number"
        else
          Integer.to_string(number) <> " is not a armstrong number"
        end
    end
  end


end
