//
//
//  main.swift
//  CalendarHelper
//
//  Created by xfg on 11.10.2019.
//  Copyright © 2019 x. All rights reserved.
//

import Foundation

/*
 
 Консольная программа про работника
 Работник работает по сменному графику 2/2. Дневная смена, ночная смена, выходной, выходной. Напишите программу, определяющую соответствие даты и смены работника.
 Пользователь должен ввести в консоли, какая смена была 1-го января, а затем может вводить месяц и день для получения результата.
 
 */


//Основная идея - последовательно считать с клавиатура 4 параметра (1я смена, месяц, день, високосный ли год)
//Разбить год по месяцам, для удобного человеку вида
//Посчитать остаток от деления даты(количество дней от начала года)
//Так как дни идут подряд, и смены не меняются то это значения остатка всегда верно укажут на смену
//можно делать через массивы но это только память тратить
func run() {
    
    //    let arguments = CommandLine.arguments
    //    print(arguments)
    
    var tmp : Int = 0;
    var tmp1 : Int = 0;
    var tmp2 : Int = 0;
    var tmp3 : Int = 0;
    
    print("Enter working time on 1st junvary 1-Day/0-Night")
    if let input0 = readLine(){
        if let int = Int(input0){
            tmp = int;
        }
        else{
            print("Entered input is \(input0) of the type:\(type(of: input0))")
            return
        }
    }
    
    print("Enter month number")
    if let input = readLine(){
        if let int = Int(input){
            tmp1 = int
        }
        else{
            print("Entered input is \(input) of the type:\(type(of: input))")
            return
        }
    }
    
    print("Enter day number")
    if let input1 = readLine(){
        if let int = Int(input1){
            tmp2 = int
        }
        else{
            print("Entered input is \(input1) of the type:\(type(of: input1))")
            return
        }
    }
    print("Was the year prolific?(0-No/1-Yes)")
    if let input2 = readLine(){
        if let int = Int(input2){
            tmp3 = int
        }
        else{
            print("Entered input is \(input2) of the type:\(type(of: input2))")
            return
        }
    }
    guard(tmp3==0||tmp3==1) else{
        print("Year prolific input error")
        return
    }
    guard(tmp1 < 13 && tmp1 > 0) else{
        print("Month input error")
        return
    }
    
    
    getDay(firstDay: tmp, curM: tmp1, curD: tmp2, year: tmp3)
}

func getDay(firstDay : Int , curM : Int , curD : Int, year : Int){
   
    let daysInFebrary = (year == 1 ? 29 : 28)
    var date:Int = 0;
    switch curM {
    case 1:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 0
    case 2:
        if curD>daysInFebrary {
            printError(dayCount: daysInFebrary)
            return
        }
        date = 31
    case 3:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary
    case 4:
        if curD>30 {
            printError(dayCount: 30)
            return
        }
        date = 31+daysInFebrary+31
    case 5:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary+31+30
    case 6:
        if curD>30 {
            printError(dayCount: 30)
            return
        }
        date = 31+daysInFebrary+31+30+31
    case 7:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary+31+30+31+30
    case 8:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary+31+30+31+30+31
    case 9:
        if curD>30 {
            printError(dayCount: 30)
            return
        }
        date = 31+daysInFebrary+31+30+31+30+31+31
    case 10:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary+31+30+31+30+31+31+30
    case 11:
        if curD>30 {
            printError(dayCount: 30)
            return
        }
        date = 31+daysInFebrary+31+30+31+30+31+31+30+31
    case 12:
        if curD>31 {
            printError(dayCount: 31)
            return
        }
        date = 31+daysInFebrary+31+30+31+30+31+31+30+31+30
    default:
        return
    }
    date += curD
    //    print(date)
    
    if firstDay==1{
        switch date % 4 {
        case 0:
            print("Week end")
        case 1:
            print("Day shift")
        case 2:
            print("Night shift")
        case 3:
            print("Week end")
        default:
            print("I dont know")
        }
    }
    else{
        switch date % 4 {
        case 0:
            print("Day shift")
        case 1:
            print("Night shift")
        case 2:
            print("Week end")
        case 3:
            print("Week end")
        default:
            print("I dont know")
        }
    }
}
func printError(dayCount : Int){
    print("There are only \(dayCount) in selected month")
    
}

run()



