//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//



import SwiftUI



struct CourseSelectView: View {
    
    let courseList: [course]
    @State private var searchText = ""

    init(courseList: [course]) {
        self.courseList = courseList
    }
    
    var body: some View {
        
            
            ScrollView {
                VStack (spacing: 10, content: {
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
