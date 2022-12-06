//
//  Messages.swift
//  MyCreditManager
//
//  Created by 김나연 on 2022/12/05.
//

import Foundation

enum GuideMessage {
    case main
    case addStudent
    case deleteStudent
    case addGrade
    case deleteGrade
    case showAverageGrade
}

enum ErrorMessage {
    case mainInput
    case input
    case alphanumeric
}

enum ResultMessage {
    case added
    case deleted
    case alreadyExist
    case notFound
    case noStudent
}

func printGuide(_ guide: GuideMessage) {
    switch guide {
    case .main:
        print("""
        -------------------------------------------------------------------------------------
        원하는 기능을 입력해주세요.
        1: 학생 추가, 2: 학생 삭제, 3: 성적 추가(변경), 4: 성적 삭제, 5: 평점 보기, 6: 학생 목록 보기, X: 종료
        -------------------------------------------------------------------------------------
        """)
    case .addStudent:
        print("추가할 학생의 이름을 입력해주세요.")
    case .deleteStudent:
        print("삭제할 학생의 이름을 입력해주세요.")
    case .addGrade:
        print("""
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        예시: Mickey Swift A+
        만약 학생의 성적 중 해당 과목이 존재하면 새로운 점수로 갱신됩니다.
        """)
    case .deleteGrade:
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    case .showAverageGrade:
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
    }
    print("--> ", terminator: "")
}

func printError(_ error: ErrorMessage) {
    switch error {
    case .mainInput:
        print("입력이 잘못되었습니다. 1~6 사이의 숫자 혹은 X를 입력해주세요")
    case .input:
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    case .alphanumeric:
        print("입력이 잘못되었습니다. 영문과 숫자만 입력해주세요.")
    }
}

func printResult(_ result: ResultMessage, _ name: String) {
    switch result {
    case .added:
        print("\(name) 학생을 추가했습니다.")
    case .deleted:
        print("\(name) 학생을 삭제하였습니다.")
    case .alreadyExist:
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    case .notFound:
        print("\(name) 학생을 찾지 못했습니다. 다시 확인해주세요.")
    }
}

func printNoStudent() {
    print("현재 저장된 학생이 없습니다. 메뉴로 돌아갑니다.")
}
