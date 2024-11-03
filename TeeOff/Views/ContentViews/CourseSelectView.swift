//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//

import SwiftUI



struct CourseSelectView: View {
    
    let courseList: [course]

    init(courseList: [course]) {
        self.courseList = courseList
    }
    
    var body: some View {
        ScrollView {
            HStack (spacing: 10, content: {
                ForEach(courseList) { course in
                    CourseCardView(course: course)
                }
            })
        }
    }
}

#Preview {
                CourseSelectView(courseList: courseList)
}
