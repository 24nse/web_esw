import '../entities/project_details.dart';
import '../repositories/project_details_repository.dart';

class GetProjectDetails {
  final ProjectDetailsRepository repository;

  const GetProjectDetails(this.repository);

  Future<ProjectDetails> call(String projectId) {
    return repository.getProjectDetails(projectId);
  }
}
