import Foundation
import UIKit

enum Resources {
    enum Fonts {
        static let sfProDisplay2232Bold = UIFont(name: "SF Pro Display Bold", size: 22)
        static let sfProDisplay1620Medium = UIFont(name: "SF Pro Display Medium", size: 16)
        static let sfProDisplay1420Medium = UIFont(name: "SF Pro Display Medium", size: 14)
        static let sfProDisplay1420Regular = UIFont(name: "SF Pro Display Regular", size: 14)
    }
    
    enum Colors {
        static let textGrayColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        static let textBlackColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        static let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha:  1)
        static let buttonActiveTextColor = UIColor(red: 1, green: 1, blue: 1, alpha:  1)
        static let buttonActiveBackground = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        static let buttonInactiveTextColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        static let buttonInactiveBackground = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
    }
    enum Image {
        static let background = UIImage(named: "Background")
    }
    enum Text {
        static let headerText = "Школа мобильной разработки"
        static let descriptionOneText = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды разработчиков"
        static let descriptionTwoText = "Получай стипендию, выстраивай удобный график, работай на современном железе"
        static let sendRequestButtonText = "Отправить заявку"
        static let wantToJoinText = "Хочешь к нам?"
        static let alertTitle = "Поздравляем!"
        static let alertText = "Ваша заявка успешно отправлена!"
        static let alertClose = "Закрыть"
    }
}
