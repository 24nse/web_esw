import '../entities/project_details.dart';

abstract class ProjectDetailsRepository {
  Future<ProjectDetails> getProjectDetails(String projectId);
}
