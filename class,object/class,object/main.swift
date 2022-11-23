
import Foundation

/*

class Patient
{
    //object variable
    var name:String = ""
    var gender:String = ""
    var age:Int = 0
    var fee:Float = 0.0
    var tokenNo:Int = 0
    
    static var tokenCounter:Int = 0
    
    init()
    {
        fee = 500
    }

    init(name:String, gender:String, age:Int, fee:Float)
    {
        self.name = name
        self.gender = gender
        self.age = age
        self.fee = fee
    }
    func inputData()
    {
        print("enter patinent name:")
        self.name = readLine()!
        print("enter age")
        self.age = Int(readLine()!)!
        print("enter gender")
        self.gender = readLine()!
        print("Enter fee")
        self.fee = Float(readLine()!)!
    }
    func display()
    {
        print("\(tokenNo), Name of Patient is:\(name), age:\(age), gender:\(gender), fee:\(fee)")
    }
    func setToken()
    {
        Patient.tokenCounter = Patient.tokenCounter + 1
        self.tokenNo = Patient.tokenCounter
    }
}
 
var patientArray:[Patient] = []
while true
{
    print("1. enter new Patient detail")
    print("2. remove  Patient by detail")
    print("3. Display all Patient detail")
    print("4. Display Patient order by age ")
    print("5. Display Patient order by gender")
    print("6. Update patient fee  by tokenNo")
    print("7. Exit from application")
    print("Select ur Choice, from 1-7")
    
    let choice = Int(readLine()!)!
    if (choice==7){
        break
    }
    switch choice{
        case 1:
        var p = Patient()
        p.inputData()
        p.setToken()
        patientArray.append(p)      // add patient detail in patArray
        
        case 2:
            print("Enter tokeNo to remove:")
            let tno = Int(readLine()!)!
            for i in 0...patientArray.count-1
            {
                if(tno == patientArray[i].tokenNo)
                {
                    patientArray.remove(at:i)
                    break
                }
            }
        case 3:
            for p in patientArray
            {
                p.display()
            }
        case 4: // display by age
                for i in 0...patientArray.count-2
                {
                    for j in (i+1)...patientArray.count-1
                    {
                        if(patientArray[i].age>patientArray[j].age)
                        {
                            var tempPatient = patientArray[i]
                            patientArray[i] = patientArray[j]
                            patientArray[j] = tempPatient
                        }
                    }
                }
                
                for p in patientArray
                {
                    p.display()
                }
        
        case 5: // display by gender
            for i in 0...patientArray.count-2{
                for j in (i+1)...patientArray.count-1{
                    if(patientArray[i].gender > patientArray[j].gender)
                    {
                        var tempPatient = patientArray[i]
                        patientArray[i] = patientArray[j]
                        patientArray[j] = tempPatient
                    }
                }
            }
            for p in patientArray
                {
                    p.display()
                }
        
        case 6:
            print("Enter tokenNo to Update fee:")
            let tno = Int(readLine()!)!
            for i in 0...patientArray.count-1
            {
                if(tno==patientArray[i].tokenNo)
                {
                    let patient = patientArray[i]
                    print("Enter the fee amount:")
                    let f = Float(readLine()!)!
                    patient.fee = f
                    break
                }
            }
            
        default:
        print("not valid choice. please select again:")
    }// eof switch loop
}//eof of while loop
 
 */
class BankAccount
{
    var accNo:Int = 0
    var accName:String = ""
    var balance:Float = 0
    init(accNo:Int,accName:String,balance:Float)
    {
        self.accNo = accNo
        self.accName = accName
        self.balance = balance
    }
    func display()
    {
        print(accNo,accName,balance)
    }
    func deposite(amount:Float)
    {
        balance = amount + balance
    }
    func withdraw (amount:Float)
    {
        balance = balance - amount
    }
    
}
var b1 = BankAccount(accNo:1,accName:"Pankaj",balance:5000.456)
b1.display()
b1.deposite(amount:1000)
b1.display()
b1.withdraw(amount: 4000)
b1.display()

var a1 = BankAccount(accNo:1,accName:"Pankaj",balance:500.14)
var a2 = BankAccount(accNo:2,accName:"Anshul",balance:50.14)
var a3 = BankAccount(accNo: 3, accName: "Dipak", balance: 100)
var a4 = BankAccount(accNo:4, accName:"ayush",balance:1000.14)
var a5 = BankAccount(accNo:5,accName:"aman",balance:5000.14)

var bankArray:[BankAccount] = [a1,a2,a3,a4,a5]
                                                                                                                                                                    
print("1.Display account detail by account number")
print("2.Deposit amount in account by ac. number")
print("3.withdraw amount in account by ac. number ")
print("4.Delet account by account number")
print("5.Enter your choice")
var choise = Int(readLine()!)!

switch choise
{
case 1:
    
    print("Enter your account number")
    var a = Int(readLine()!)!
    for i in 0...bankArray.count-1
    {
        print(bankArray[i])
    }
    

    
default:
    print("Its wrong")
    
}









