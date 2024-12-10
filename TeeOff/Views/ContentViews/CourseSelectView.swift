//
//  CourseSelectView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//



import SwiftUI

struct CourseSelectView: View {
    
    private let courses: [CourseModel] = CourseRepository.shared.courses
    @State private var searchText = ""

    private var filteredCourses: [CourseModel] {
        if searchText.isEmpty {
            return courses
        }
        return courses.filter { course in
            course.id.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if filteredCourses.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 40))
                            .foregroundStyle(.secondary)
                        Text("No courses found")
                            .font(.headline)
                        Text("Try adjusting your search")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, minHeight: 400)
                    .multilineTextAlignment(.center)
                } else {
                    LazyVStack (spacing: 10) {
                        ForEach(filteredCourses) { course in
                            CourseCardView(viewModel: CourseCardViewModel(course: course))
                        }
                    }
                }
            }
            .padding(.horizontal, 4)
            .navigationTitle("Select Course")
        }
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
        CourseSelectView()
}
