//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//



import SwiftUI

struct CourseSelectView: View {
    
    private let courses: [Course] = CourseRepository.shared.courses
    @State private var searchText = ""

    private var filteredCourses: [Course] {
        if searchText.isEmpty {
            return courses
        }
        return courses.filter { course in
            course.id.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                ForEach(filteredCourses) { course in
                    CourseCardView(viewModel: CourseCardViewModel(course: course))
                }
            }
        }
        .padding(.horizontal, 4)
        .navigationTitle("Select Course")
        .searchable(text: $searchText, prompt: "Search courses")
    }
    
    // MARK: - Subviews
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.primary)
            
            TextField("Search courses", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    NavigationView {
        CourseSelectView()
    }
}
