import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    @State private var selectedDate = Date()
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.isLoading {
                    ProgressView("Loading NASA APOD...")
                        .padding()
                }
                else if let apod = vm.apod {
                    ScrollView {
                        VStack(spacing: 16) {
                            
                            // Display the APOD image
                            AsyncImage(url: URL(string: apod.hdurl ?? apod.url)) { image in
                                image.resizable()
                                     .scaledToFit()
                                     .cornerRadius(12)
                            } placeholder: {
                                ProgressView()
                            }
                            .padding()
                            .onTapGesture { showDetail = true }
                            .sheet(isPresented: $showDetail) {
                                ImageDetailView(url: apod.hdurl ?? apod.url)
                            }
                            
                            Text(apod.title)
                                .font(.title)
                                .bold()
                                .padding(.horizontal)
                            
                            Text("Date: \(apod.date)")
                                .foregroundColor(.gray)
                            
                            if let copyright = apod.copyright {
                                Text("© \(copyright)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Text(apod.explanation)
                                .padding(.horizontal)
                        }
                    }
                }
                else if let error = vm.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                    Button("Retry") { vm.loadToday() }
                        .buttonStyle(.borderedProminent)
                }

                Divider()

                // Date Picker
                DatePicker("Select APOD Date", selection: $selectedDate, in: validRange, displayedComponents: .date)
                    .padding(.horizontal)

                Button("Load APOD") {
                    Task { await vm.fetchAPOD(for: selectedDate) }
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .navigationTitle("NASA APOD")
            .onAppear { vm.loadToday() }
        }
    }
    
    var validRange: ClosedRange<Date> {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let start = formatter.date(from: "1995-06-16")!
        return start...Date()
    }
}

