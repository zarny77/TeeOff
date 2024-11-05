//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//


/*
 TODO: Fix hole chips centering
 TODO: Fill out round struct
 TODO: build out stats view
 TODO: Organize content view
 */
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
