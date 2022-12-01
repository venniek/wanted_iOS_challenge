import Foundation

let mainMessage: String = """
    -------------------------------------------------------------------------------------
    원하는 기능을 입력해주세요.
    1: 학생 추가, 2: 학생 삭제, 3: 성적 추가(변경), 4: 성적 삭제, 5: 평점 보기, 6: 학생 목록 보기, X: 종료
    -------------------------------------------------------------------------------------
    """
let addStudentMessage: String = "추가할 학생의 이름을 입력해주세요."
let deleteStudentMessage: String = "삭제할 학생의 이름을 입력해주세요."
let addGradeMessage: String = """
    성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
    예시: Mickey Swift A+
    만약 학생의 성적 중 해당 과목이 존재하면 새로운 점수로 갱신됩니다.
    """
let deleteGradeMessage: String = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요."
let showAverageGradeMessage: String = "평점을 알고싶은 학생의 이름을 입력해주세요."
let inputErrorMessage: String = "입력이 잘못되었습니다. 다시 확인해주세요."
var students:[String: Student] = [String: Student]()
var inProgress: Bool = true

func printGuide(_ guide: String) {
    print(guide)
    print("--> ", terminator: "")
}

func getUserInput() -> String? {
    guard let input = readLine() else {
        exitProgram()
        return nil
    }
    if input == "" {
        print(inputErrorMessage)
        return nil
    }
    return input
}

func addStudent() {
    printGuide(addStudentMessage)
    guard let name = getUserInput() else { return }
    if let _ = students[name] {
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        students[name] = Student(name: name)
        print("\(name) 학생을 추가했습니다.")
    }
}

func deleteStudent() {
    printGuide(deleteStudentMessage)
    guard let name = getUserInput() else { return }
    if let _ = students[name] {
        students[name] = nil
        print("\(name) 학생을 삭제하였습니다.")
    } else {
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

func addGrade() {
    let infos: [String]

    printGuide(addGradeMessage)
    guard let input = getUserInput() else { return }
    infos = input.components(separatedBy: " ")
    if infos.count != 3 {
        print(inputErrorMessage)
        return
    }
    if let student = students[infos[0]] {
        student.addGrade(subject: infos[1], grade: infos[2])
    } else {
        print("\(infos[0]) 학생을 찾지 못했습니다. 다시 확인해주세요.")
    }
}

func deleteGrade() {
    let infos: [String]

    printGuide(deleteGradeMessage)
    guard let input = getUserInput() else { return }
    infos = input.components(separatedBy: " ")
    if infos.count != 2 {
        print(inputErrorMessage)
        return
    }
    if let student = students[infos[0]] {
        student.deleteGrade(subject: infos[1])
    } else {
        print("\(infos[0]) 학생을 찾지 못했습니다. 다시 확인해주세요.")
    }
}

func showAverageGrade() {
    showStudents()
    printGuide(showAverageGradeMessage)
    guard let name = getUserInput() else { return }
    if let student = students[name] {
        print()
        student.showGrade()
        print()
    } else {
        print("\(name) 학생을 찾지 못했습니다. 다시 확인해주세요.")
    }
}

func showStudents() {
    print()
    for s in students {
        print(s.key)
    }
    print()
}

func exitProgram() {
    print("프로그램을 종료합니다...")
    inProgress = false
}

while inProgress {
    printGuide(mainMessage)
    guard let input = getUserInput() else { continue }
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
        print("입력이 잘못되었습니다. 1~6 사이의 숫자 혹은 X를 입력해주세요")
    }
    print()
}
