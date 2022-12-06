import Foundation

var students:[String: Student] = [String: Student]()
var inProgress: Bool = true

func getUserInput(_ isGrade: Bool) -> String? {
    guard let input = readLine() else {
        exitProgram()
        return nil
    }
    if input == "" {
        printError(.input)
        return nil
    }
    if !input.allSatisfy({ $0.isNumber || $0.isCased
        || $0.isWhitespace == isGrade || ($0 == "+") == isGrade}) {
        printError(.alphanumeric)
        return nil
    }
    return input
}

func addStudent() {
    printGuide(.addStudent)
    guard let name = getUserInput(false) else { return }
    if let _ = students[name] {
        printResult(.alreadyExist, name)
    } else {
        students[name] = Student(name: name)
        printResult(.added, name)
    }
}

func deleteStudent() {
    if students.isEmpty {
        return printNoStudent()
    }
    showStudents()
    printGuide(.deleteStudent)
    guard let name = getUserInput(false) else { return }
    if let _ = students[name] {
        students[name] = nil
        printResult(.deleted, name)
    } else {
        printResult(.notFound, name)
    }
}

func addGrade() {
    let infos: [String]

    if students.isEmpty {
        return printNoStudent()
    }
    showStudents()
    printGuide(.addGrade)
    guard let input = getUserInput(true) else { return }
    infos = input.components(separatedBy: " ")
    if infos.count != 3 {
        printError(.input)
        return
    }
    if let student = students[infos[0]] {
        student.addGrade(subject: infos[1], grade: infos[2])
    } else {
        printResult(.notFound, infos[0])
    }
}

func deleteGrade() {
    let infos: [String]

    if students.isEmpty {
        return printNoStudent()
    }
    showStudents()
    printGuide(.deleteGrade)
    guard let input = getUserInput(false) else { return }
    infos = input.components(separatedBy: " ")
    if infos.count != 2 {
        print(ErrorMessage.input)
        return
    }
    if let student = students[infos[0]] {
        student.deleteGrade(subject: infos[1])
    } else {
        printResult(.notFound, infos[0])
    }
}

func showAverageGrade() {
    if students.isEmpty {
        return printNoStudent()
    }
    showStudents()
    printGuide(.showAverageGrade)
    guard let name = getUserInput(false) else { return }
    if let student = students[name] {
        student.showGrade()
    } else {
        printResult(.notFound, name)
    }
}

func showStudents() {
    if students.isEmpty {
        return printNoStudent()
    }
    print("---총 학생 수: \(students.count)명")
    for s in students {
        print(s.key)
    }
    print("---------------")
}

func exitProgram() {
    print("프로그램을 종료합니다...")
    inProgress = false
}

while inProgress {
    printGuide(.main)
    guard let input = getUserInput(false) else { continue }
    if input.count != 1 {
        printError(.mainInput)
        continue
    }
    switch input {
    case "1":
        addStudent()
    case "2":
        deleteStudent()
    case "3":
        addGrade()
    case "4":
        deleteGrade()
    case "5":
        showAverageGrade()
    case "6":
        showStudents()
    case "X":
        exitProgram()
    default:
        printError(.mainInput)
    }
    print()
}
