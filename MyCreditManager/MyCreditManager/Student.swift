import Foundation

class Student {
    let name: String
    var grades: [String: String]
    private var gradeToFloat: [String: Float]

    init(name: String) {
        self.name = name
        self.grades = [String: String]()
        self.gradeToFloat = [String: Float]()

        gradeToFloat["A+"] = 4.5
        gradeToFloat["A"] = 4.0
        gradeToFloat["B+"] = 3.5
        gradeToFloat["B"] = 3.0
        gradeToFloat["C+"] = 2.5
        gradeToFloat["C"] = 2.0
        gradeToFloat["D+"] = 1.5
        gradeToFloat["D"] = 1.0
        gradeToFloat["F"] = 0.0
    }

    func addGrade(subject: String, grade: String) {
        guard let _ = gradeToFloat[grade] else {
            print("성적 입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        grades[subject] = grade
        print("\(name) 학생의 \(subject) 과목의 성적이 \(grade)로 추가(변경)되었습니다.")
    }

    func deleteGrade(subject: String) {
        if let _ = grades[subject] {
            grades[subject] = nil
            print("\(self.name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(subject) 과목을 찾지 못했습니다. 다시 확인해주세요")
        }
    }

    func showGrade() {
        var gradeSum:Float = 0.0

        for grade in grades {
            print("\(grade.key): \(grade.value)")
            gradeSum += gradeToFloat[grade.value]!
        }
        print("평점 : \(String(format: "%.2f", gradeSum / Float(grades.count)))")
    }
}
