//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//



import SwiftUI



struct CourseSelectView: View {
    
    let courseList: [Course]
    @State private var searchText = ""

    init(courseList: [Course]) {
        self.courseList = courseList
    }
    
    var body: some View {
        
        
        ScrollView(content: {
            VStack (spacing: 10, content: {
                ForEach(courseList) { course in
                    CourseCardView(course: course)
                }
            })
        })
   }
    
}

#Preview {
        CourseSelectView(courseList: courseList)
}
