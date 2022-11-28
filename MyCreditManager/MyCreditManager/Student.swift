import Foundation

class Student {
    let name: String
    var grades: [String: String]

    init(name: String) {
        self.name = name
        self.grades = [String: String]()
    }

    func gradeToFloat(grade: String) -> Float {
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        case "F":
            return 0.0
        default:
            return -1.0
        }
    }

    func addGrade(subject: String, grade: String) {
        if gradeToFloat(grade: grade) < 0.0 {
            print("성적 입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        grades[subject] = grade
        print("\(name) 학생의 \(subject) 과목의 성적이 \(grade)로 추가(변경)되었습니다.")
    }

    func deleteGrade(subject: String) {
        if let _ = grades[subject] {
            grades[subject] = nil
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(subject) 과목을 찾지 못했습니다. 다시 확인해주세요")
        }
    }

    func showGrade() {
        var gradeSum:Float = 0.0

        for g in grades {
            print("\(g.key): \(g.value)")
            gradeSum += gradeToFloat(grade: g.value)
        }
        print("평점 : \(String(format: "%.2f", gradeSum / Float(grades.count)))")
    }
}
